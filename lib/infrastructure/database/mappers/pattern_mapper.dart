import '../../../domain/domain.dart';
import '../app_database.dart';

class PatternMapper {
  static Pattern toEntity(PatternData data) {
    return Pattern(
      id: data.id,
      printerId: data.printerId,
      patternType: PatternType.values[data.patternType],
      description: data.description,
      occurrenceCount: data.occurrenceCount,
      lastOccurrence: data.lastOccurrence,
      confidence: data.confidence,
    );
  }

  static PatternsTableCompanion toCompanion(Pattern entity) {
    return PatternsTableCompanion.insert(
      id: entity.id,
      printerId: entity.printerId,
      patternType: entity.patternType.index,
      description: entity.description,
      occurrenceCount: entity.occurrenceCount,
      lastOccurrence: entity.lastOccurrence,
      confidence: entity.confidence,
      createdAt: DateTime.now(),
    );
  }
}
