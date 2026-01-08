import 'package:result_dart/result_dart.dart';

import '../entities/host.dart';
import '../value_objects/host_address.dart';
import '../value_objects/token.dart';

abstract class IHostRepository {
  Future<Result<List<Host>>> getAll();

  Future<Result<Host>> getById(String id);

  Future<Result<Host>> getByAddress(HostAddress address);

  Future<Result<Host>> add(Host host);

  Future<Result<Host>> update(Host host);

  Future<Result<Unit>> delete(String id);

  Future<Result<Host>> connect(String hostId);

  Future<Result<Unit>> disconnect(String hostId);

  Future<Result<Token>> authenticate(
    String hostId,
    String username,
    String password,
  );

  Future<Result<Host>> refreshHostInfo(String hostId);
}
