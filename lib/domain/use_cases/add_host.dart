import 'package:result_dart/result_dart.dart';
import 'package:uuid/uuid.dart';

import '../entities/host.dart';
import '../errors/failures.dart';
import '../repositories/i_host_repository.dart';
import '../value_objects/host_address.dart';

class AddHostParams {
  final String name;
  final String host;
  final int port;

  const AddHostParams({
    required this.name,
    required this.host,
    required this.port,
  });
}

class AddHost {
  final IHostRepository _hostRepository;

  AddHost({required IHostRepository hostRepository})
      : _hostRepository = hostRepository;

  Future<Result<Host>> call(AddHostParams params) async {
    if (params.name.isEmpty) {
      return ValidationException.emptyField('name').toFailure();
    }

    if (params.host.isEmpty) {
      return ValidationException.emptyField('host').toFailure();
    }

    HostAddress address;
    try {
      address = HostAddress(host: params.host, port: params.port);
    } on ValidationException catch (e) {
      return e.toFailure();
    }

    final existingResult = await _hostRepository.getByAddress(address);
    if (existingResult.isSuccess()) {
      return const ValidationException('Host já existe com este endereço')
          .toFailure();
    }

    final newHost = Host(
      id: const Uuid().v4(),
      name: params.name,
      address: address,
      status: HostStatus.offline,
    );

    return _hostRepository.add(newHost);
  }
}
