import 'package:drift/drift.dart';
import 'package:result_dart/result_dart.dart';

import '../../../domain/domain.dart';
import '../app_database.dart';
import '../mappers/mappers.dart';

class PredictionRepository implements IPredictionRepository {
  final AppDatabase _db;

  PredictionRepository(this._db);

  @override
  Future<Result<List<Prediction>>> getPredictions(String printerId) async {
    try {
      final data = await (_db.select(_db.predictionsTable)
            ..where((tbl) => tbl.printerId.equals(printerId))
            ..orderBy([
              (tbl) => OrderingTerm(
                    expression: tbl.predictedDate,
                    mode: OrderingMode.asc,
                  )
            ]))
          .get();
      final predictions = data.map(PredictionMapper.toEntity).toList();
      return Success(predictions);
    } catch (e) {
      return StorageException
          .readFailed('predictions for printer: $printerId')
          .toFailure();
    }
  }

  @override
  Future<Result<void>> addPrediction(Prediction prediction) async {
    try {
      await _db
          .into(_db.predictionsTable)
          .insert(PredictionMapper.toCompanion(prediction));
      return const Success(unit);
    } catch (e) {
      return StorageException
          .writeFailed('prediction: ${prediction.id}')
          .toFailure();
    }
  }

  @override
  Future<Result<void>> updatePredictionStatus(
    String id,
    PredictionStatus status,
  ) async {
    try {
      await (_db.update(_db.predictionsTable)..where((tbl) => tbl.id.equals(id)))
          .write(PredictionsTableCompanion(status: Value(status.index)));
      return const Success(unit);
    } catch (e) {
      return StorageException.writeFailed('prediction: $id').toFailure();
    }
  }

  @override
  Future<Result<List<Pattern>>> detectPatterns(String printerId) async {
    try {
      final data = await (_db.select(_db.patternsTable)
            ..where((tbl) => tbl.printerId.equals(printerId)))
          .get();
      final patterns = data.map(PatternMapper.toEntity).toList();
      return Success(patterns);
    } catch (e) {
      return StorageException
          .readFailed('patterns for printer: $printerId')
          .toFailure();
    }
  }
}
