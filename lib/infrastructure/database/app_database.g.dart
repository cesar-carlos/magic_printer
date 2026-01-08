// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $HostsTable extends Hosts with TableInfo<$HostsTable, HostData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HostsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _hostMeta = const VerificationMeta('host');
  @override
  late final GeneratedColumn<String> host = GeneratedColumn<String>(
    'host',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _portMeta = const VerificationMeta('port');
  @override
  late final GeneratedColumn<int> port = GeneratedColumn<int>(
    'port',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<int> status = GeneratedColumn<int>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _requiresAuthMeta = const VerificationMeta(
    'requiresAuth',
  );
  @override
  late final GeneratedColumn<bool> requiresAuth = GeneratedColumn<bool>(
    'requires_auth',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("requires_auth" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _tokenMeta = const VerificationMeta('token');
  @override
  late final GeneratedColumn<String> token = GeneratedColumn<String>(
    'token',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _tokenExpiresAtMeta = const VerificationMeta(
    'tokenExpiresAt',
  );
  @override
  late final GeneratedColumn<DateTime> tokenExpiresAt =
      GeneratedColumn<DateTime>(
        'token_expires_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _lastSeenMeta = const VerificationMeta(
    'lastSeen',
  );
  @override
  late final GeneratedColumn<DateTime> lastSeen = GeneratedColumn<DateTime>(
    'last_seen',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _supportedFeaturesMeta = const VerificationMeta(
    'supportedFeatures',
  );
  @override
  late final GeneratedColumn<String> supportedFeatures =
      GeneratedColumn<String>(
        'supported_features',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant(''),
      );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<String> version = GeneratedColumn<String>(
    'version',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    host,
    port,
    status,
    requiresAuth,
    token,
    tokenExpiresAt,
    lastSeen,
    supportedFeatures,
    version,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'hosts';
  @override
  VerificationContext validateIntegrity(
    Insertable<HostData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('host')) {
      context.handle(
        _hostMeta,
        host.isAcceptableOrUnknown(data['host']!, _hostMeta),
      );
    } else if (isInserting) {
      context.missing(_hostMeta);
    }
    if (data.containsKey('port')) {
      context.handle(
        _portMeta,
        port.isAcceptableOrUnknown(data['port']!, _portMeta),
      );
    } else if (isInserting) {
      context.missing(_portMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('requires_auth')) {
      context.handle(
        _requiresAuthMeta,
        requiresAuth.isAcceptableOrUnknown(
          data['requires_auth']!,
          _requiresAuthMeta,
        ),
      );
    }
    if (data.containsKey('token')) {
      context.handle(
        _tokenMeta,
        token.isAcceptableOrUnknown(data['token']!, _tokenMeta),
      );
    }
    if (data.containsKey('token_expires_at')) {
      context.handle(
        _tokenExpiresAtMeta,
        tokenExpiresAt.isAcceptableOrUnknown(
          data['token_expires_at']!,
          _tokenExpiresAtMeta,
        ),
      );
    }
    if (data.containsKey('last_seen')) {
      context.handle(
        _lastSeenMeta,
        lastSeen.isAcceptableOrUnknown(data['last_seen']!, _lastSeenMeta),
      );
    }
    if (data.containsKey('supported_features')) {
      context.handle(
        _supportedFeaturesMeta,
        supportedFeatures.isAcceptableOrUnknown(
          data['supported_features']!,
          _supportedFeaturesMeta,
        ),
      );
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HostData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HostData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      host: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}host'],
      )!,
      port: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}port'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}status'],
      )!,
      requiresAuth: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}requires_auth'],
      )!,
      token: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}token'],
      ),
      tokenExpiresAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}token_expires_at'],
      ),
      lastSeen: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_seen'],
      ),
      supportedFeatures: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}supported_features'],
      )!,
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}version'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $HostsTable createAlias(String alias) {
    return $HostsTable(attachedDatabase, alias);
  }
}

class HostData extends DataClass implements Insertable<HostData> {
  final String id;
  final String name;
  final String host;
  final int port;
  final int status;
  final bool requiresAuth;
  final String? token;
  final DateTime? tokenExpiresAt;
  final DateTime? lastSeen;
  final String supportedFeatures;
  final String? version;
  final DateTime createdAt;
  final DateTime updatedAt;
  const HostData({
    required this.id,
    required this.name,
    required this.host,
    required this.port,
    required this.status,
    required this.requiresAuth,
    this.token,
    this.tokenExpiresAt,
    this.lastSeen,
    required this.supportedFeatures,
    this.version,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['host'] = Variable<String>(host);
    map['port'] = Variable<int>(port);
    map['status'] = Variable<int>(status);
    map['requires_auth'] = Variable<bool>(requiresAuth);
    if (!nullToAbsent || token != null) {
      map['token'] = Variable<String>(token);
    }
    if (!nullToAbsent || tokenExpiresAt != null) {
      map['token_expires_at'] = Variable<DateTime>(tokenExpiresAt);
    }
    if (!nullToAbsent || lastSeen != null) {
      map['last_seen'] = Variable<DateTime>(lastSeen);
    }
    map['supported_features'] = Variable<String>(supportedFeatures);
    if (!nullToAbsent || version != null) {
      map['version'] = Variable<String>(version);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  HostsCompanion toCompanion(bool nullToAbsent) {
    return HostsCompanion(
      id: Value(id),
      name: Value(name),
      host: Value(host),
      port: Value(port),
      status: Value(status),
      requiresAuth: Value(requiresAuth),
      token: token == null && nullToAbsent
          ? const Value.absent()
          : Value(token),
      tokenExpiresAt: tokenExpiresAt == null && nullToAbsent
          ? const Value.absent()
          : Value(tokenExpiresAt),
      lastSeen: lastSeen == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSeen),
      supportedFeatures: Value(supportedFeatures),
      version: version == null && nullToAbsent
          ? const Value.absent()
          : Value(version),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory HostData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HostData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      host: serializer.fromJson<String>(json['host']),
      port: serializer.fromJson<int>(json['port']),
      status: serializer.fromJson<int>(json['status']),
      requiresAuth: serializer.fromJson<bool>(json['requiresAuth']),
      token: serializer.fromJson<String?>(json['token']),
      tokenExpiresAt: serializer.fromJson<DateTime?>(json['tokenExpiresAt']),
      lastSeen: serializer.fromJson<DateTime?>(json['lastSeen']),
      supportedFeatures: serializer.fromJson<String>(json['supportedFeatures']),
      version: serializer.fromJson<String?>(json['version']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'host': serializer.toJson<String>(host),
      'port': serializer.toJson<int>(port),
      'status': serializer.toJson<int>(status),
      'requiresAuth': serializer.toJson<bool>(requiresAuth),
      'token': serializer.toJson<String?>(token),
      'tokenExpiresAt': serializer.toJson<DateTime?>(tokenExpiresAt),
      'lastSeen': serializer.toJson<DateTime?>(lastSeen),
      'supportedFeatures': serializer.toJson<String>(supportedFeatures),
      'version': serializer.toJson<String?>(version),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  HostData copyWith({
    String? id,
    String? name,
    String? host,
    int? port,
    int? status,
    bool? requiresAuth,
    Value<String?> token = const Value.absent(),
    Value<DateTime?> tokenExpiresAt = const Value.absent(),
    Value<DateTime?> lastSeen = const Value.absent(),
    String? supportedFeatures,
    Value<String?> version = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => HostData(
    id: id ?? this.id,
    name: name ?? this.name,
    host: host ?? this.host,
    port: port ?? this.port,
    status: status ?? this.status,
    requiresAuth: requiresAuth ?? this.requiresAuth,
    token: token.present ? token.value : this.token,
    tokenExpiresAt: tokenExpiresAt.present
        ? tokenExpiresAt.value
        : this.tokenExpiresAt,
    lastSeen: lastSeen.present ? lastSeen.value : this.lastSeen,
    supportedFeatures: supportedFeatures ?? this.supportedFeatures,
    version: version.present ? version.value : this.version,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  HostData copyWithCompanion(HostsCompanion data) {
    return HostData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      host: data.host.present ? data.host.value : this.host,
      port: data.port.present ? data.port.value : this.port,
      status: data.status.present ? data.status.value : this.status,
      requiresAuth: data.requiresAuth.present
          ? data.requiresAuth.value
          : this.requiresAuth,
      token: data.token.present ? data.token.value : this.token,
      tokenExpiresAt: data.tokenExpiresAt.present
          ? data.tokenExpiresAt.value
          : this.tokenExpiresAt,
      lastSeen: data.lastSeen.present ? data.lastSeen.value : this.lastSeen,
      supportedFeatures: data.supportedFeatures.present
          ? data.supportedFeatures.value
          : this.supportedFeatures,
      version: data.version.present ? data.version.value : this.version,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HostData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('host: $host, ')
          ..write('port: $port, ')
          ..write('status: $status, ')
          ..write('requiresAuth: $requiresAuth, ')
          ..write('token: $token, ')
          ..write('tokenExpiresAt: $tokenExpiresAt, ')
          ..write('lastSeen: $lastSeen, ')
          ..write('supportedFeatures: $supportedFeatures, ')
          ..write('version: $version, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    host,
    port,
    status,
    requiresAuth,
    token,
    tokenExpiresAt,
    lastSeen,
    supportedFeatures,
    version,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HostData &&
          other.id == this.id &&
          other.name == this.name &&
          other.host == this.host &&
          other.port == this.port &&
          other.status == this.status &&
          other.requiresAuth == this.requiresAuth &&
          other.token == this.token &&
          other.tokenExpiresAt == this.tokenExpiresAt &&
          other.lastSeen == this.lastSeen &&
          other.supportedFeatures == this.supportedFeatures &&
          other.version == this.version &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class HostsCompanion extends UpdateCompanion<HostData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> host;
  final Value<int> port;
  final Value<int> status;
  final Value<bool> requiresAuth;
  final Value<String?> token;
  final Value<DateTime?> tokenExpiresAt;
  final Value<DateTime?> lastSeen;
  final Value<String> supportedFeatures;
  final Value<String?> version;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const HostsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.host = const Value.absent(),
    this.port = const Value.absent(),
    this.status = const Value.absent(),
    this.requiresAuth = const Value.absent(),
    this.token = const Value.absent(),
    this.tokenExpiresAt = const Value.absent(),
    this.lastSeen = const Value.absent(),
    this.supportedFeatures = const Value.absent(),
    this.version = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  HostsCompanion.insert({
    required String id,
    required String name,
    required String host,
    required int port,
    required int status,
    this.requiresAuth = const Value.absent(),
    this.token = const Value.absent(),
    this.tokenExpiresAt = const Value.absent(),
    this.lastSeen = const Value.absent(),
    this.supportedFeatures = const Value.absent(),
    this.version = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       host = Value(host),
       port = Value(port),
       status = Value(status),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<HostData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? host,
    Expression<int>? port,
    Expression<int>? status,
    Expression<bool>? requiresAuth,
    Expression<String>? token,
    Expression<DateTime>? tokenExpiresAt,
    Expression<DateTime>? lastSeen,
    Expression<String>? supportedFeatures,
    Expression<String>? version,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (host != null) 'host': host,
      if (port != null) 'port': port,
      if (status != null) 'status': status,
      if (requiresAuth != null) 'requires_auth': requiresAuth,
      if (token != null) 'token': token,
      if (tokenExpiresAt != null) 'token_expires_at': tokenExpiresAt,
      if (lastSeen != null) 'last_seen': lastSeen,
      if (supportedFeatures != null) 'supported_features': supportedFeatures,
      if (version != null) 'version': version,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  HostsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? host,
    Value<int>? port,
    Value<int>? status,
    Value<bool>? requiresAuth,
    Value<String?>? token,
    Value<DateTime?>? tokenExpiresAt,
    Value<DateTime?>? lastSeen,
    Value<String>? supportedFeatures,
    Value<String?>? version,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return HostsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      host: host ?? this.host,
      port: port ?? this.port,
      status: status ?? this.status,
      requiresAuth: requiresAuth ?? this.requiresAuth,
      token: token ?? this.token,
      tokenExpiresAt: tokenExpiresAt ?? this.tokenExpiresAt,
      lastSeen: lastSeen ?? this.lastSeen,
      supportedFeatures: supportedFeatures ?? this.supportedFeatures,
      version: version ?? this.version,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (host.present) {
      map['host'] = Variable<String>(host.value);
    }
    if (port.present) {
      map['port'] = Variable<int>(port.value);
    }
    if (status.present) {
      map['status'] = Variable<int>(status.value);
    }
    if (requiresAuth.present) {
      map['requires_auth'] = Variable<bool>(requiresAuth.value);
    }
    if (token.present) {
      map['token'] = Variable<String>(token.value);
    }
    if (tokenExpiresAt.present) {
      map['token_expires_at'] = Variable<DateTime>(tokenExpiresAt.value);
    }
    if (lastSeen.present) {
      map['last_seen'] = Variable<DateTime>(lastSeen.value);
    }
    if (supportedFeatures.present) {
      map['supported_features'] = Variable<String>(supportedFeatures.value);
    }
    if (version.present) {
      map['version'] = Variable<String>(version.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HostsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('host: $host, ')
          ..write('port: $port, ')
          ..write('status: $status, ')
          ..write('requiresAuth: $requiresAuth, ')
          ..write('token: $token, ')
          ..write('tokenExpiresAt: $tokenExpiresAt, ')
          ..write('lastSeen: $lastSeen, ')
          ..write('supportedFeatures: $supportedFeatures, ')
          ..write('version: $version, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PrintersTable extends Printers
    with TableInfo<$PrintersTable, PrinterData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PrintersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _hostIdMeta = const VerificationMeta('hostId');
  @override
  late final GeneratedColumn<String> hostId = GeneratedColumn<String>(
    'host_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _locationMeta = const VerificationMeta(
    'location',
  );
  @override
  late final GeneratedColumn<int> location = GeneratedColumn<int>(
    'location',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<int> status = GeneratedColumn<int>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _driverNameMeta = const VerificationMeta(
    'driverName',
  );
  @override
  late final GeneratedColumn<String> driverName = GeneratedColumn<String>(
    'driver_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _portNameMeta = const VerificationMeta(
    'portName',
  );
  @override
  late final GeneratedColumn<String> portName = GeneratedColumn<String>(
    'port_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _locationDescriptionMeta =
      const VerificationMeta('locationDescription');
  @override
  late final GeneratedColumn<String> locationDescription =
      GeneratedColumn<String>(
        'location_description',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _commentMeta = const VerificationMeta(
    'comment',
  );
  @override
  late final GeneratedColumn<String> comment = GeneratedColumn<String>(
    'comment',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _jobCountMeta = const VerificationMeta(
    'jobCount',
  );
  @override
  late final GeneratedColumn<int> jobCount = GeneratedColumn<int>(
    'job_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _sharedMeta = const VerificationMeta('shared');
  @override
  late final GeneratedColumn<bool> shared = GeneratedColumn<bool>(
    'shared',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("shared" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _allowedGroupsMeta = const VerificationMeta(
    'allowedGroups',
  );
  @override
  late final GeneratedColumn<String> allowedGroups = GeneratedColumn<String>(
    'allowed_groups',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _lastSeenMeta = const VerificationMeta(
    'lastSeen',
  );
  @override
  late final GeneratedColumn<DateTime> lastSeen = GeneratedColumn<DateTime>(
    'last_seen',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    hostId,
    location,
    status,
    driverName,
    portName,
    locationDescription,
    comment,
    jobCount,
    shared,
    allowedGroups,
    lastSeen,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'printers';
  @override
  VerificationContext validateIntegrity(
    Insertable<PrinterData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('host_id')) {
      context.handle(
        _hostIdMeta,
        hostId.isAcceptableOrUnknown(data['host_id']!, _hostIdMeta),
      );
    }
    if (data.containsKey('location')) {
      context.handle(
        _locationMeta,
        location.isAcceptableOrUnknown(data['location']!, _locationMeta),
      );
    } else if (isInserting) {
      context.missing(_locationMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('driver_name')) {
      context.handle(
        _driverNameMeta,
        driverName.isAcceptableOrUnknown(data['driver_name']!, _driverNameMeta),
      );
    }
    if (data.containsKey('port_name')) {
      context.handle(
        _portNameMeta,
        portName.isAcceptableOrUnknown(data['port_name']!, _portNameMeta),
      );
    }
    if (data.containsKey('location_description')) {
      context.handle(
        _locationDescriptionMeta,
        locationDescription.isAcceptableOrUnknown(
          data['location_description']!,
          _locationDescriptionMeta,
        ),
      );
    }
    if (data.containsKey('comment')) {
      context.handle(
        _commentMeta,
        comment.isAcceptableOrUnknown(data['comment']!, _commentMeta),
      );
    }
    if (data.containsKey('job_count')) {
      context.handle(
        _jobCountMeta,
        jobCount.isAcceptableOrUnknown(data['job_count']!, _jobCountMeta),
      );
    }
    if (data.containsKey('shared')) {
      context.handle(
        _sharedMeta,
        shared.isAcceptableOrUnknown(data['shared']!, _sharedMeta),
      );
    }
    if (data.containsKey('allowed_groups')) {
      context.handle(
        _allowedGroupsMeta,
        allowedGroups.isAcceptableOrUnknown(
          data['allowed_groups']!,
          _allowedGroupsMeta,
        ),
      );
    }
    if (data.containsKey('last_seen')) {
      context.handle(
        _lastSeenMeta,
        lastSeen.isAcceptableOrUnknown(data['last_seen']!, _lastSeenMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PrinterData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PrinterData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      hostId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}host_id'],
      ),
      location: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}location'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}status'],
      )!,
      driverName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}driver_name'],
      ),
      portName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}port_name'],
      ),
      locationDescription: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}location_description'],
      ),
      comment: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}comment'],
      ),
      jobCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}job_count'],
      )!,
      shared: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}shared'],
      )!,
      allowedGroups: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}allowed_groups'],
      )!,
      lastSeen: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_seen'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $PrintersTable createAlias(String alias) {
    return $PrintersTable(attachedDatabase, alias);
  }
}

class PrinterData extends DataClass implements Insertable<PrinterData> {
  final String id;
  final String name;
  final String? hostId;
  final int location;
  final int status;
  final String? driverName;
  final String? portName;
  final String? locationDescription;
  final String? comment;
  final int jobCount;
  final bool shared;
  final String allowedGroups;
  final DateTime? lastSeen;
  final DateTime createdAt;
  final DateTime updatedAt;
  const PrinterData({
    required this.id,
    required this.name,
    this.hostId,
    required this.location,
    required this.status,
    this.driverName,
    this.portName,
    this.locationDescription,
    this.comment,
    required this.jobCount,
    required this.shared,
    required this.allowedGroups,
    this.lastSeen,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || hostId != null) {
      map['host_id'] = Variable<String>(hostId);
    }
    map['location'] = Variable<int>(location);
    map['status'] = Variable<int>(status);
    if (!nullToAbsent || driverName != null) {
      map['driver_name'] = Variable<String>(driverName);
    }
    if (!nullToAbsent || portName != null) {
      map['port_name'] = Variable<String>(portName);
    }
    if (!nullToAbsent || locationDescription != null) {
      map['location_description'] = Variable<String>(locationDescription);
    }
    if (!nullToAbsent || comment != null) {
      map['comment'] = Variable<String>(comment);
    }
    map['job_count'] = Variable<int>(jobCount);
    map['shared'] = Variable<bool>(shared);
    map['allowed_groups'] = Variable<String>(allowedGroups);
    if (!nullToAbsent || lastSeen != null) {
      map['last_seen'] = Variable<DateTime>(lastSeen);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  PrintersCompanion toCompanion(bool nullToAbsent) {
    return PrintersCompanion(
      id: Value(id),
      name: Value(name),
      hostId: hostId == null && nullToAbsent
          ? const Value.absent()
          : Value(hostId),
      location: Value(location),
      status: Value(status),
      driverName: driverName == null && nullToAbsent
          ? const Value.absent()
          : Value(driverName),
      portName: portName == null && nullToAbsent
          ? const Value.absent()
          : Value(portName),
      locationDescription: locationDescription == null && nullToAbsent
          ? const Value.absent()
          : Value(locationDescription),
      comment: comment == null && nullToAbsent
          ? const Value.absent()
          : Value(comment),
      jobCount: Value(jobCount),
      shared: Value(shared),
      allowedGroups: Value(allowedGroups),
      lastSeen: lastSeen == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSeen),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory PrinterData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PrinterData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      hostId: serializer.fromJson<String?>(json['hostId']),
      location: serializer.fromJson<int>(json['location']),
      status: serializer.fromJson<int>(json['status']),
      driverName: serializer.fromJson<String?>(json['driverName']),
      portName: serializer.fromJson<String?>(json['portName']),
      locationDescription: serializer.fromJson<String?>(
        json['locationDescription'],
      ),
      comment: serializer.fromJson<String?>(json['comment']),
      jobCount: serializer.fromJson<int>(json['jobCount']),
      shared: serializer.fromJson<bool>(json['shared']),
      allowedGroups: serializer.fromJson<String>(json['allowedGroups']),
      lastSeen: serializer.fromJson<DateTime?>(json['lastSeen']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'hostId': serializer.toJson<String?>(hostId),
      'location': serializer.toJson<int>(location),
      'status': serializer.toJson<int>(status),
      'driverName': serializer.toJson<String?>(driverName),
      'portName': serializer.toJson<String?>(portName),
      'locationDescription': serializer.toJson<String?>(locationDescription),
      'comment': serializer.toJson<String?>(comment),
      'jobCount': serializer.toJson<int>(jobCount),
      'shared': serializer.toJson<bool>(shared),
      'allowedGroups': serializer.toJson<String>(allowedGroups),
      'lastSeen': serializer.toJson<DateTime?>(lastSeen),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  PrinterData copyWith({
    String? id,
    String? name,
    Value<String?> hostId = const Value.absent(),
    int? location,
    int? status,
    Value<String?> driverName = const Value.absent(),
    Value<String?> portName = const Value.absent(),
    Value<String?> locationDescription = const Value.absent(),
    Value<String?> comment = const Value.absent(),
    int? jobCount,
    bool? shared,
    String? allowedGroups,
    Value<DateTime?> lastSeen = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => PrinterData(
    id: id ?? this.id,
    name: name ?? this.name,
    hostId: hostId.present ? hostId.value : this.hostId,
    location: location ?? this.location,
    status: status ?? this.status,
    driverName: driverName.present ? driverName.value : this.driverName,
    portName: portName.present ? portName.value : this.portName,
    locationDescription: locationDescription.present
        ? locationDescription.value
        : this.locationDescription,
    comment: comment.present ? comment.value : this.comment,
    jobCount: jobCount ?? this.jobCount,
    shared: shared ?? this.shared,
    allowedGroups: allowedGroups ?? this.allowedGroups,
    lastSeen: lastSeen.present ? lastSeen.value : this.lastSeen,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  PrinterData copyWithCompanion(PrintersCompanion data) {
    return PrinterData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      hostId: data.hostId.present ? data.hostId.value : this.hostId,
      location: data.location.present ? data.location.value : this.location,
      status: data.status.present ? data.status.value : this.status,
      driverName: data.driverName.present
          ? data.driverName.value
          : this.driverName,
      portName: data.portName.present ? data.portName.value : this.portName,
      locationDescription: data.locationDescription.present
          ? data.locationDescription.value
          : this.locationDescription,
      comment: data.comment.present ? data.comment.value : this.comment,
      jobCount: data.jobCount.present ? data.jobCount.value : this.jobCount,
      shared: data.shared.present ? data.shared.value : this.shared,
      allowedGroups: data.allowedGroups.present
          ? data.allowedGroups.value
          : this.allowedGroups,
      lastSeen: data.lastSeen.present ? data.lastSeen.value : this.lastSeen,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PrinterData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('hostId: $hostId, ')
          ..write('location: $location, ')
          ..write('status: $status, ')
          ..write('driverName: $driverName, ')
          ..write('portName: $portName, ')
          ..write('locationDescription: $locationDescription, ')
          ..write('comment: $comment, ')
          ..write('jobCount: $jobCount, ')
          ..write('shared: $shared, ')
          ..write('allowedGroups: $allowedGroups, ')
          ..write('lastSeen: $lastSeen, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    hostId,
    location,
    status,
    driverName,
    portName,
    locationDescription,
    comment,
    jobCount,
    shared,
    allowedGroups,
    lastSeen,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PrinterData &&
          other.id == this.id &&
          other.name == this.name &&
          other.hostId == this.hostId &&
          other.location == this.location &&
          other.status == this.status &&
          other.driverName == this.driverName &&
          other.portName == this.portName &&
          other.locationDescription == this.locationDescription &&
          other.comment == this.comment &&
          other.jobCount == this.jobCount &&
          other.shared == this.shared &&
          other.allowedGroups == this.allowedGroups &&
          other.lastSeen == this.lastSeen &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class PrintersCompanion extends UpdateCompanion<PrinterData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> hostId;
  final Value<int> location;
  final Value<int> status;
  final Value<String?> driverName;
  final Value<String?> portName;
  final Value<String?> locationDescription;
  final Value<String?> comment;
  final Value<int> jobCount;
  final Value<bool> shared;
  final Value<String> allowedGroups;
  final Value<DateTime?> lastSeen;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const PrintersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.hostId = const Value.absent(),
    this.location = const Value.absent(),
    this.status = const Value.absent(),
    this.driverName = const Value.absent(),
    this.portName = const Value.absent(),
    this.locationDescription = const Value.absent(),
    this.comment = const Value.absent(),
    this.jobCount = const Value.absent(),
    this.shared = const Value.absent(),
    this.allowedGroups = const Value.absent(),
    this.lastSeen = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PrintersCompanion.insert({
    required String id,
    required String name,
    this.hostId = const Value.absent(),
    required int location,
    required int status,
    this.driverName = const Value.absent(),
    this.portName = const Value.absent(),
    this.locationDescription = const Value.absent(),
    this.comment = const Value.absent(),
    this.jobCount = const Value.absent(),
    this.shared = const Value.absent(),
    this.allowedGroups = const Value.absent(),
    this.lastSeen = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       location = Value(location),
       status = Value(status),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<PrinterData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? hostId,
    Expression<int>? location,
    Expression<int>? status,
    Expression<String>? driverName,
    Expression<String>? portName,
    Expression<String>? locationDescription,
    Expression<String>? comment,
    Expression<int>? jobCount,
    Expression<bool>? shared,
    Expression<String>? allowedGroups,
    Expression<DateTime>? lastSeen,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (hostId != null) 'host_id': hostId,
      if (location != null) 'location': location,
      if (status != null) 'status': status,
      if (driverName != null) 'driver_name': driverName,
      if (portName != null) 'port_name': portName,
      if (locationDescription != null)
        'location_description': locationDescription,
      if (comment != null) 'comment': comment,
      if (jobCount != null) 'job_count': jobCount,
      if (shared != null) 'shared': shared,
      if (allowedGroups != null) 'allowed_groups': allowedGroups,
      if (lastSeen != null) 'last_seen': lastSeen,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PrintersCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String?>? hostId,
    Value<int>? location,
    Value<int>? status,
    Value<String?>? driverName,
    Value<String?>? portName,
    Value<String?>? locationDescription,
    Value<String?>? comment,
    Value<int>? jobCount,
    Value<bool>? shared,
    Value<String>? allowedGroups,
    Value<DateTime?>? lastSeen,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return PrintersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      hostId: hostId ?? this.hostId,
      location: location ?? this.location,
      status: status ?? this.status,
      driverName: driverName ?? this.driverName,
      portName: portName ?? this.portName,
      locationDescription: locationDescription ?? this.locationDescription,
      comment: comment ?? this.comment,
      jobCount: jobCount ?? this.jobCount,
      shared: shared ?? this.shared,
      allowedGroups: allowedGroups ?? this.allowedGroups,
      lastSeen: lastSeen ?? this.lastSeen,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (hostId.present) {
      map['host_id'] = Variable<String>(hostId.value);
    }
    if (location.present) {
      map['location'] = Variable<int>(location.value);
    }
    if (status.present) {
      map['status'] = Variable<int>(status.value);
    }
    if (driverName.present) {
      map['driver_name'] = Variable<String>(driverName.value);
    }
    if (portName.present) {
      map['port_name'] = Variable<String>(portName.value);
    }
    if (locationDescription.present) {
      map['location_description'] = Variable<String>(locationDescription.value);
    }
    if (comment.present) {
      map['comment'] = Variable<String>(comment.value);
    }
    if (jobCount.present) {
      map['job_count'] = Variable<int>(jobCount.value);
    }
    if (shared.present) {
      map['shared'] = Variable<bool>(shared.value);
    }
    if (allowedGroups.present) {
      map['allowed_groups'] = Variable<String>(allowedGroups.value);
    }
    if (lastSeen.present) {
      map['last_seen'] = Variable<DateTime>(lastSeen.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PrintersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('hostId: $hostId, ')
          ..write('location: $location, ')
          ..write('status: $status, ')
          ..write('driverName: $driverName, ')
          ..write('portName: $portName, ')
          ..write('locationDescription: $locationDescription, ')
          ..write('comment: $comment, ')
          ..write('jobCount: $jobCount, ')
          ..write('shared: $shared, ')
          ..write('allowedGroups: $allowedGroups, ')
          ..write('lastSeen: $lastSeen, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $JobsTable extends Jobs with TableInfo<$JobsTable, JobData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $JobsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _documentNameMeta = const VerificationMeta(
    'documentName',
  );
  @override
  late final GeneratedColumn<String> documentName = GeneratedColumn<String>(
    'document_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _printerNameMeta = const VerificationMeta(
    'printerName',
  );
  @override
  late final GeneratedColumn<String> printerName = GeneratedColumn<String>(
    'printer_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _hostIdMeta = const VerificationMeta('hostId');
  @override
  late final GeneratedColumn<String> hostId = GeneratedColumn<String>(
    'host_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<int> status = GeneratedColumn<int>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _totalSizeMeta = const VerificationMeta(
    'totalSize',
  );
  @override
  late final GeneratedColumn<int> totalSize = GeneratedColumn<int>(
    'total_size',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _sentBytesMeta = const VerificationMeta(
    'sentBytes',
  );
  @override
  late final GeneratedColumn<int> sentBytes = GeneratedColumn<int>(
    'sent_bytes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _totalChunksMeta = const VerificationMeta(
    'totalChunks',
  );
  @override
  late final GeneratedColumn<int> totalChunks = GeneratedColumn<int>(
    'total_chunks',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _sentChunksMeta = const VerificationMeta(
    'sentChunks',
  );
  @override
  late final GeneratedColumn<int> sentChunks = GeneratedColumn<int>(
    'sent_chunks',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _totalPagesMeta = const VerificationMeta(
    'totalPages',
  );
  @override
  late final GeneratedColumn<int> totalPages = GeneratedColumn<int>(
    'total_pages',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _printedPagesMeta = const VerificationMeta(
    'printedPages',
  );
  @override
  late final GeneratedColumn<int> printedPages = GeneratedColumn<int>(
    'printed_pages',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startedAtMeta = const VerificationMeta(
    'startedAt',
  );
  @override
  late final GeneratedColumn<DateTime> startedAt = GeneratedColumn<DateTime>(
    'started_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _completedAtMeta = const VerificationMeta(
    'completedAt',
  );
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
    'completed_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _errorCodeMeta = const VerificationMeta(
    'errorCode',
  );
  @override
  late final GeneratedColumn<String> errorCode = GeneratedColumn<String>(
    'error_code',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _errorMessageMeta = const VerificationMeta(
    'errorMessage',
  );
  @override
  late final GeneratedColumn<String> errorMessage = GeneratedColumn<String>(
    'error_message',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    documentName,
    printerName,
    hostId,
    status,
    totalSize,
    sentBytes,
    totalChunks,
    sentChunks,
    totalPages,
    printedPages,
    createdAt,
    startedAt,
    completedAt,
    errorCode,
    errorMessage,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'jobs';
  @override
  VerificationContext validateIntegrity(
    Insertable<JobData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('document_name')) {
      context.handle(
        _documentNameMeta,
        documentName.isAcceptableOrUnknown(
          data['document_name']!,
          _documentNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_documentNameMeta);
    }
    if (data.containsKey('printer_name')) {
      context.handle(
        _printerNameMeta,
        printerName.isAcceptableOrUnknown(
          data['printer_name']!,
          _printerNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_printerNameMeta);
    }
    if (data.containsKey('host_id')) {
      context.handle(
        _hostIdMeta,
        hostId.isAcceptableOrUnknown(data['host_id']!, _hostIdMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('total_size')) {
      context.handle(
        _totalSizeMeta,
        totalSize.isAcceptableOrUnknown(data['total_size']!, _totalSizeMeta),
      );
    }
    if (data.containsKey('sent_bytes')) {
      context.handle(
        _sentBytesMeta,
        sentBytes.isAcceptableOrUnknown(data['sent_bytes']!, _sentBytesMeta),
      );
    }
    if (data.containsKey('total_chunks')) {
      context.handle(
        _totalChunksMeta,
        totalChunks.isAcceptableOrUnknown(
          data['total_chunks']!,
          _totalChunksMeta,
        ),
      );
    }
    if (data.containsKey('sent_chunks')) {
      context.handle(
        _sentChunksMeta,
        sentChunks.isAcceptableOrUnknown(data['sent_chunks']!, _sentChunksMeta),
      );
    }
    if (data.containsKey('total_pages')) {
      context.handle(
        _totalPagesMeta,
        totalPages.isAcceptableOrUnknown(data['total_pages']!, _totalPagesMeta),
      );
    }
    if (data.containsKey('printed_pages')) {
      context.handle(
        _printedPagesMeta,
        printedPages.isAcceptableOrUnknown(
          data['printed_pages']!,
          _printedPagesMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('started_at')) {
      context.handle(
        _startedAtMeta,
        startedAt.isAcceptableOrUnknown(data['started_at']!, _startedAtMeta),
      );
    }
    if (data.containsKey('completed_at')) {
      context.handle(
        _completedAtMeta,
        completedAt.isAcceptableOrUnknown(
          data['completed_at']!,
          _completedAtMeta,
        ),
      );
    }
    if (data.containsKey('error_code')) {
      context.handle(
        _errorCodeMeta,
        errorCode.isAcceptableOrUnknown(data['error_code']!, _errorCodeMeta),
      );
    }
    if (data.containsKey('error_message')) {
      context.handle(
        _errorMessageMeta,
        errorMessage.isAcceptableOrUnknown(
          data['error_message']!,
          _errorMessageMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  JobData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return JobData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      documentName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}document_name'],
      )!,
      printerName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}printer_name'],
      )!,
      hostId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}host_id'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}status'],
      )!,
      totalSize: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_size'],
      )!,
      sentBytes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sent_bytes'],
      )!,
      totalChunks: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_chunks'],
      )!,
      sentChunks: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sent_chunks'],
      )!,
      totalPages: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_pages'],
      )!,
      printedPages: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}printed_pages'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      startedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}started_at'],
      ),
      completedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}completed_at'],
      ),
      errorCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}error_code'],
      ),
      errorMessage: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}error_message'],
      ),
    );
  }

  @override
  $JobsTable createAlias(String alias) {
    return $JobsTable(attachedDatabase, alias);
  }
}

class JobData extends DataClass implements Insertable<JobData> {
  final String id;
  final String documentName;
  final String printerName;
  final String? hostId;
  final int status;
  final int totalSize;
  final int sentBytes;
  final int totalChunks;
  final int sentChunks;
  final int totalPages;
  final int printedPages;
  final DateTime createdAt;
  final DateTime? startedAt;
  final DateTime? completedAt;
  final String? errorCode;
  final String? errorMessage;
  const JobData({
    required this.id,
    required this.documentName,
    required this.printerName,
    this.hostId,
    required this.status,
    required this.totalSize,
    required this.sentBytes,
    required this.totalChunks,
    required this.sentChunks,
    required this.totalPages,
    required this.printedPages,
    required this.createdAt,
    this.startedAt,
    this.completedAt,
    this.errorCode,
    this.errorMessage,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['document_name'] = Variable<String>(documentName);
    map['printer_name'] = Variable<String>(printerName);
    if (!nullToAbsent || hostId != null) {
      map['host_id'] = Variable<String>(hostId);
    }
    map['status'] = Variable<int>(status);
    map['total_size'] = Variable<int>(totalSize);
    map['sent_bytes'] = Variable<int>(sentBytes);
    map['total_chunks'] = Variable<int>(totalChunks);
    map['sent_chunks'] = Variable<int>(sentChunks);
    map['total_pages'] = Variable<int>(totalPages);
    map['printed_pages'] = Variable<int>(printedPages);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || startedAt != null) {
      map['started_at'] = Variable<DateTime>(startedAt);
    }
    if (!nullToAbsent || completedAt != null) {
      map['completed_at'] = Variable<DateTime>(completedAt);
    }
    if (!nullToAbsent || errorCode != null) {
      map['error_code'] = Variable<String>(errorCode);
    }
    if (!nullToAbsent || errorMessage != null) {
      map['error_message'] = Variable<String>(errorMessage);
    }
    return map;
  }

  JobsCompanion toCompanion(bool nullToAbsent) {
    return JobsCompanion(
      id: Value(id),
      documentName: Value(documentName),
      printerName: Value(printerName),
      hostId: hostId == null && nullToAbsent
          ? const Value.absent()
          : Value(hostId),
      status: Value(status),
      totalSize: Value(totalSize),
      sentBytes: Value(sentBytes),
      totalChunks: Value(totalChunks),
      sentChunks: Value(sentChunks),
      totalPages: Value(totalPages),
      printedPages: Value(printedPages),
      createdAt: Value(createdAt),
      startedAt: startedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(startedAt),
      completedAt: completedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(completedAt),
      errorCode: errorCode == null && nullToAbsent
          ? const Value.absent()
          : Value(errorCode),
      errorMessage: errorMessage == null && nullToAbsent
          ? const Value.absent()
          : Value(errorMessage),
    );
  }

  factory JobData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return JobData(
      id: serializer.fromJson<String>(json['id']),
      documentName: serializer.fromJson<String>(json['documentName']),
      printerName: serializer.fromJson<String>(json['printerName']),
      hostId: serializer.fromJson<String?>(json['hostId']),
      status: serializer.fromJson<int>(json['status']),
      totalSize: serializer.fromJson<int>(json['totalSize']),
      sentBytes: serializer.fromJson<int>(json['sentBytes']),
      totalChunks: serializer.fromJson<int>(json['totalChunks']),
      sentChunks: serializer.fromJson<int>(json['sentChunks']),
      totalPages: serializer.fromJson<int>(json['totalPages']),
      printedPages: serializer.fromJson<int>(json['printedPages']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      startedAt: serializer.fromJson<DateTime?>(json['startedAt']),
      completedAt: serializer.fromJson<DateTime?>(json['completedAt']),
      errorCode: serializer.fromJson<String?>(json['errorCode']),
      errorMessage: serializer.fromJson<String?>(json['errorMessage']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'documentName': serializer.toJson<String>(documentName),
      'printerName': serializer.toJson<String>(printerName),
      'hostId': serializer.toJson<String?>(hostId),
      'status': serializer.toJson<int>(status),
      'totalSize': serializer.toJson<int>(totalSize),
      'sentBytes': serializer.toJson<int>(sentBytes),
      'totalChunks': serializer.toJson<int>(totalChunks),
      'sentChunks': serializer.toJson<int>(sentChunks),
      'totalPages': serializer.toJson<int>(totalPages),
      'printedPages': serializer.toJson<int>(printedPages),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'startedAt': serializer.toJson<DateTime?>(startedAt),
      'completedAt': serializer.toJson<DateTime?>(completedAt),
      'errorCode': serializer.toJson<String?>(errorCode),
      'errorMessage': serializer.toJson<String?>(errorMessage),
    };
  }

  JobData copyWith({
    String? id,
    String? documentName,
    String? printerName,
    Value<String?> hostId = const Value.absent(),
    int? status,
    int? totalSize,
    int? sentBytes,
    int? totalChunks,
    int? sentChunks,
    int? totalPages,
    int? printedPages,
    DateTime? createdAt,
    Value<DateTime?> startedAt = const Value.absent(),
    Value<DateTime?> completedAt = const Value.absent(),
    Value<String?> errorCode = const Value.absent(),
    Value<String?> errorMessage = const Value.absent(),
  }) => JobData(
    id: id ?? this.id,
    documentName: documentName ?? this.documentName,
    printerName: printerName ?? this.printerName,
    hostId: hostId.present ? hostId.value : this.hostId,
    status: status ?? this.status,
    totalSize: totalSize ?? this.totalSize,
    sentBytes: sentBytes ?? this.sentBytes,
    totalChunks: totalChunks ?? this.totalChunks,
    sentChunks: sentChunks ?? this.sentChunks,
    totalPages: totalPages ?? this.totalPages,
    printedPages: printedPages ?? this.printedPages,
    createdAt: createdAt ?? this.createdAt,
    startedAt: startedAt.present ? startedAt.value : this.startedAt,
    completedAt: completedAt.present ? completedAt.value : this.completedAt,
    errorCode: errorCode.present ? errorCode.value : this.errorCode,
    errorMessage: errorMessage.present ? errorMessage.value : this.errorMessage,
  );
  JobData copyWithCompanion(JobsCompanion data) {
    return JobData(
      id: data.id.present ? data.id.value : this.id,
      documentName: data.documentName.present
          ? data.documentName.value
          : this.documentName,
      printerName: data.printerName.present
          ? data.printerName.value
          : this.printerName,
      hostId: data.hostId.present ? data.hostId.value : this.hostId,
      status: data.status.present ? data.status.value : this.status,
      totalSize: data.totalSize.present ? data.totalSize.value : this.totalSize,
      sentBytes: data.sentBytes.present ? data.sentBytes.value : this.sentBytes,
      totalChunks: data.totalChunks.present
          ? data.totalChunks.value
          : this.totalChunks,
      sentChunks: data.sentChunks.present
          ? data.sentChunks.value
          : this.sentChunks,
      totalPages: data.totalPages.present
          ? data.totalPages.value
          : this.totalPages,
      printedPages: data.printedPages.present
          ? data.printedPages.value
          : this.printedPages,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      startedAt: data.startedAt.present ? data.startedAt.value : this.startedAt,
      completedAt: data.completedAt.present
          ? data.completedAt.value
          : this.completedAt,
      errorCode: data.errorCode.present ? data.errorCode.value : this.errorCode,
      errorMessage: data.errorMessage.present
          ? data.errorMessage.value
          : this.errorMessage,
    );
  }

  @override
  String toString() {
    return (StringBuffer('JobData(')
          ..write('id: $id, ')
          ..write('documentName: $documentName, ')
          ..write('printerName: $printerName, ')
          ..write('hostId: $hostId, ')
          ..write('status: $status, ')
          ..write('totalSize: $totalSize, ')
          ..write('sentBytes: $sentBytes, ')
          ..write('totalChunks: $totalChunks, ')
          ..write('sentChunks: $sentChunks, ')
          ..write('totalPages: $totalPages, ')
          ..write('printedPages: $printedPages, ')
          ..write('createdAt: $createdAt, ')
          ..write('startedAt: $startedAt, ')
          ..write('completedAt: $completedAt, ')
          ..write('errorCode: $errorCode, ')
          ..write('errorMessage: $errorMessage')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    documentName,
    printerName,
    hostId,
    status,
    totalSize,
    sentBytes,
    totalChunks,
    sentChunks,
    totalPages,
    printedPages,
    createdAt,
    startedAt,
    completedAt,
    errorCode,
    errorMessage,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is JobData &&
          other.id == this.id &&
          other.documentName == this.documentName &&
          other.printerName == this.printerName &&
          other.hostId == this.hostId &&
          other.status == this.status &&
          other.totalSize == this.totalSize &&
          other.sentBytes == this.sentBytes &&
          other.totalChunks == this.totalChunks &&
          other.sentChunks == this.sentChunks &&
          other.totalPages == this.totalPages &&
          other.printedPages == this.printedPages &&
          other.createdAt == this.createdAt &&
          other.startedAt == this.startedAt &&
          other.completedAt == this.completedAt &&
          other.errorCode == this.errorCode &&
          other.errorMessage == this.errorMessage);
}

class JobsCompanion extends UpdateCompanion<JobData> {
  final Value<String> id;
  final Value<String> documentName;
  final Value<String> printerName;
  final Value<String?> hostId;
  final Value<int> status;
  final Value<int> totalSize;
  final Value<int> sentBytes;
  final Value<int> totalChunks;
  final Value<int> sentChunks;
  final Value<int> totalPages;
  final Value<int> printedPages;
  final Value<DateTime> createdAt;
  final Value<DateTime?> startedAt;
  final Value<DateTime?> completedAt;
  final Value<String?> errorCode;
  final Value<String?> errorMessage;
  final Value<int> rowid;
  const JobsCompanion({
    this.id = const Value.absent(),
    this.documentName = const Value.absent(),
    this.printerName = const Value.absent(),
    this.hostId = const Value.absent(),
    this.status = const Value.absent(),
    this.totalSize = const Value.absent(),
    this.sentBytes = const Value.absent(),
    this.totalChunks = const Value.absent(),
    this.sentChunks = const Value.absent(),
    this.totalPages = const Value.absent(),
    this.printedPages = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.startedAt = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.errorCode = const Value.absent(),
    this.errorMessage = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  JobsCompanion.insert({
    required String id,
    required String documentName,
    required String printerName,
    this.hostId = const Value.absent(),
    required int status,
    this.totalSize = const Value.absent(),
    this.sentBytes = const Value.absent(),
    this.totalChunks = const Value.absent(),
    this.sentChunks = const Value.absent(),
    this.totalPages = const Value.absent(),
    this.printedPages = const Value.absent(),
    required DateTime createdAt,
    this.startedAt = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.errorCode = const Value.absent(),
    this.errorMessage = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       documentName = Value(documentName),
       printerName = Value(printerName),
       status = Value(status),
       createdAt = Value(createdAt);
  static Insertable<JobData> custom({
    Expression<String>? id,
    Expression<String>? documentName,
    Expression<String>? printerName,
    Expression<String>? hostId,
    Expression<int>? status,
    Expression<int>? totalSize,
    Expression<int>? sentBytes,
    Expression<int>? totalChunks,
    Expression<int>? sentChunks,
    Expression<int>? totalPages,
    Expression<int>? printedPages,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? startedAt,
    Expression<DateTime>? completedAt,
    Expression<String>? errorCode,
    Expression<String>? errorMessage,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (documentName != null) 'document_name': documentName,
      if (printerName != null) 'printer_name': printerName,
      if (hostId != null) 'host_id': hostId,
      if (status != null) 'status': status,
      if (totalSize != null) 'total_size': totalSize,
      if (sentBytes != null) 'sent_bytes': sentBytes,
      if (totalChunks != null) 'total_chunks': totalChunks,
      if (sentChunks != null) 'sent_chunks': sentChunks,
      if (totalPages != null) 'total_pages': totalPages,
      if (printedPages != null) 'printed_pages': printedPages,
      if (createdAt != null) 'created_at': createdAt,
      if (startedAt != null) 'started_at': startedAt,
      if (completedAt != null) 'completed_at': completedAt,
      if (errorCode != null) 'error_code': errorCode,
      if (errorMessage != null) 'error_message': errorMessage,
      if (rowid != null) 'rowid': rowid,
    });
  }

  JobsCompanion copyWith({
    Value<String>? id,
    Value<String>? documentName,
    Value<String>? printerName,
    Value<String?>? hostId,
    Value<int>? status,
    Value<int>? totalSize,
    Value<int>? sentBytes,
    Value<int>? totalChunks,
    Value<int>? sentChunks,
    Value<int>? totalPages,
    Value<int>? printedPages,
    Value<DateTime>? createdAt,
    Value<DateTime?>? startedAt,
    Value<DateTime?>? completedAt,
    Value<String?>? errorCode,
    Value<String?>? errorMessage,
    Value<int>? rowid,
  }) {
    return JobsCompanion(
      id: id ?? this.id,
      documentName: documentName ?? this.documentName,
      printerName: printerName ?? this.printerName,
      hostId: hostId ?? this.hostId,
      status: status ?? this.status,
      totalSize: totalSize ?? this.totalSize,
      sentBytes: sentBytes ?? this.sentBytes,
      totalChunks: totalChunks ?? this.totalChunks,
      sentChunks: sentChunks ?? this.sentChunks,
      totalPages: totalPages ?? this.totalPages,
      printedPages: printedPages ?? this.printedPages,
      createdAt: createdAt ?? this.createdAt,
      startedAt: startedAt ?? this.startedAt,
      completedAt: completedAt ?? this.completedAt,
      errorCode: errorCode ?? this.errorCode,
      errorMessage: errorMessage ?? this.errorMessage,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (documentName.present) {
      map['document_name'] = Variable<String>(documentName.value);
    }
    if (printerName.present) {
      map['printer_name'] = Variable<String>(printerName.value);
    }
    if (hostId.present) {
      map['host_id'] = Variable<String>(hostId.value);
    }
    if (status.present) {
      map['status'] = Variable<int>(status.value);
    }
    if (totalSize.present) {
      map['total_size'] = Variable<int>(totalSize.value);
    }
    if (sentBytes.present) {
      map['sent_bytes'] = Variable<int>(sentBytes.value);
    }
    if (totalChunks.present) {
      map['total_chunks'] = Variable<int>(totalChunks.value);
    }
    if (sentChunks.present) {
      map['sent_chunks'] = Variable<int>(sentChunks.value);
    }
    if (totalPages.present) {
      map['total_pages'] = Variable<int>(totalPages.value);
    }
    if (printedPages.present) {
      map['printed_pages'] = Variable<int>(printedPages.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (startedAt.present) {
      map['started_at'] = Variable<DateTime>(startedAt.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<DateTime>(completedAt.value);
    }
    if (errorCode.present) {
      map['error_code'] = Variable<String>(errorCode.value);
    }
    if (errorMessage.present) {
      map['error_message'] = Variable<String>(errorMessage.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('JobsCompanion(')
          ..write('id: $id, ')
          ..write('documentName: $documentName, ')
          ..write('printerName: $printerName, ')
          ..write('hostId: $hostId, ')
          ..write('status: $status, ')
          ..write('totalSize: $totalSize, ')
          ..write('sentBytes: $sentBytes, ')
          ..write('totalChunks: $totalChunks, ')
          ..write('sentChunks: $sentChunks, ')
          ..write('totalPages: $totalPages, ')
          ..write('printedPages: $printedPages, ')
          ..write('createdAt: $createdAt, ')
          ..write('startedAt: $startedAt, ')
          ..write('completedAt: $completedAt, ')
          ..write('errorCode: $errorCode, ')
          ..write('errorMessage: $errorMessage, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $GroupsTable extends Groups with TableInfo<$GroupsTable, GroupData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GroupsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _permissionsMeta = const VerificationMeta(
    'permissions',
  );
  @override
  late final GeneratedColumn<String> permissions = GeneratedColumn<String>(
    'permissions',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _memberIdsMeta = const VerificationMeta(
    'memberIds',
  );
  @override
  late final GeneratedColumn<String> memberIds = GeneratedColumn<String>(
    'member_ids',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    description,
    permissions,
    memberIds,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'groups';
  @override
  VerificationContext validateIntegrity(
    Insertable<GroupData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('permissions')) {
      context.handle(
        _permissionsMeta,
        permissions.isAcceptableOrUnknown(
          data['permissions']!,
          _permissionsMeta,
        ),
      );
    }
    if (data.containsKey('member_ids')) {
      context.handle(
        _memberIdsMeta,
        memberIds.isAcceptableOrUnknown(data['member_ids']!, _memberIdsMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GroupData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GroupData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      permissions: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}permissions'],
      )!,
      memberIds: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}member_ids'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $GroupsTable createAlias(String alias) {
    return $GroupsTable(attachedDatabase, alias);
  }
}

class GroupData extends DataClass implements Insertable<GroupData> {
  final String id;
  final String name;
  final String? description;
  final String permissions;
  final String memberIds;
  final DateTime createdAt;
  final DateTime updatedAt;
  const GroupData({
    required this.id,
    required this.name,
    this.description,
    required this.permissions,
    required this.memberIds,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['permissions'] = Variable<String>(permissions);
    map['member_ids'] = Variable<String>(memberIds);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  GroupsCompanion toCompanion(bool nullToAbsent) {
    return GroupsCompanion(
      id: Value(id),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      permissions: Value(permissions),
      memberIds: Value(memberIds),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory GroupData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GroupData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      permissions: serializer.fromJson<String>(json['permissions']),
      memberIds: serializer.fromJson<String>(json['memberIds']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'permissions': serializer.toJson<String>(permissions),
      'memberIds': serializer.toJson<String>(memberIds),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  GroupData copyWith({
    String? id,
    String? name,
    Value<String?> description = const Value.absent(),
    String? permissions,
    String? memberIds,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => GroupData(
    id: id ?? this.id,
    name: name ?? this.name,
    description: description.present ? description.value : this.description,
    permissions: permissions ?? this.permissions,
    memberIds: memberIds ?? this.memberIds,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  GroupData copyWithCompanion(GroupsCompanion data) {
    return GroupData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      permissions: data.permissions.present
          ? data.permissions.value
          : this.permissions,
      memberIds: data.memberIds.present ? data.memberIds.value : this.memberIds,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GroupData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('permissions: $permissions, ')
          ..write('memberIds: $memberIds, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    description,
    permissions,
    memberIds,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GroupData &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.permissions == this.permissions &&
          other.memberIds == this.memberIds &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class GroupsCompanion extends UpdateCompanion<GroupData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> description;
  final Value<String> permissions;
  final Value<String> memberIds;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const GroupsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.permissions = const Value.absent(),
    this.memberIds = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  GroupsCompanion.insert({
    required String id,
    required String name,
    this.description = const Value.absent(),
    this.permissions = const Value.absent(),
    this.memberIds = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<GroupData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? permissions,
    Expression<String>? memberIds,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (permissions != null) 'permissions': permissions,
      if (memberIds != null) 'member_ids': memberIds,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  GroupsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String?>? description,
    Value<String>? permissions,
    Value<String>? memberIds,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return GroupsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      permissions: permissions ?? this.permissions,
      memberIds: memberIds ?? this.memberIds,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (permissions.present) {
      map['permissions'] = Variable<String>(permissions.value);
    }
    if (memberIds.present) {
      map['member_ids'] = Variable<String>(memberIds.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GroupsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('permissions: $permissions, ')
          ..write('memberIds: $memberIds, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LogsTable extends Logs with TableInfo<$LogsTable, LogEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _levelMeta = const VerificationMeta('level');
  @override
  late final GeneratedColumn<int> level = GeneratedColumn<int>(
    'level',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<int> category = GeneratedColumn<int>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _messageMeta = const VerificationMeta(
    'message',
  );
  @override
  late final GeneratedColumn<String> message = GeneratedColumn<String>(
    'message',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _detailsMeta = const VerificationMeta(
    'details',
  );
  @override
  late final GeneratedColumn<String> details = GeneratedColumn<String>(
    'details',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _printerIdMeta = const VerificationMeta(
    'printerId',
  );
  @override
  late final GeneratedColumn<String> printerId = GeneratedColumn<String>(
    'printer_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _hostIdMeta = const VerificationMeta('hostId');
  @override
  late final GeneratedColumn<String> hostId = GeneratedColumn<String>(
    'host_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _jobIdMeta = const VerificationMeta('jobId');
  @override
  late final GeneratedColumn<String> jobId = GeneratedColumn<String>(
    'job_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    level,
    category,
    title,
    message,
    details,
    printerId,
    hostId,
    jobId,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'logs';
  @override
  VerificationContext validateIntegrity(
    Insertable<LogEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('level')) {
      context.handle(
        _levelMeta,
        level.isAcceptableOrUnknown(data['level']!, _levelMeta),
      );
    } else if (isInserting) {
      context.missing(_levelMeta);
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('message')) {
      context.handle(
        _messageMeta,
        message.isAcceptableOrUnknown(data['message']!, _messageMeta),
      );
    } else if (isInserting) {
      context.missing(_messageMeta);
    }
    if (data.containsKey('details')) {
      context.handle(
        _detailsMeta,
        details.isAcceptableOrUnknown(data['details']!, _detailsMeta),
      );
    }
    if (data.containsKey('printer_id')) {
      context.handle(
        _printerIdMeta,
        printerId.isAcceptableOrUnknown(data['printer_id']!, _printerIdMeta),
      );
    }
    if (data.containsKey('host_id')) {
      context.handle(
        _hostIdMeta,
        hostId.isAcceptableOrUnknown(data['host_id']!, _hostIdMeta),
      );
    }
    if (data.containsKey('job_id')) {
      context.handle(
        _jobIdMeta,
        jobId.isAcceptableOrUnknown(data['job_id']!, _jobIdMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LogEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LogEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      level: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}level'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}category'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      message: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}message'],
      )!,
      details: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}details'],
      ),
      printerId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}printer_id'],
      ),
      hostId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}host_id'],
      ),
      jobId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}job_id'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $LogsTable createAlias(String alias) {
    return $LogsTable(attachedDatabase, alias);
  }
}

class LogEntry extends DataClass implements Insertable<LogEntry> {
  final String id;
  final int level;
  final int category;
  final String title;
  final String message;
  final String? details;
  final String? printerId;
  final String? hostId;
  final String? jobId;
  final DateTime createdAt;
  const LogEntry({
    required this.id,
    required this.level,
    required this.category,
    required this.title,
    required this.message,
    this.details,
    this.printerId,
    this.hostId,
    this.jobId,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['level'] = Variable<int>(level);
    map['category'] = Variable<int>(category);
    map['title'] = Variable<String>(title);
    map['message'] = Variable<String>(message);
    if (!nullToAbsent || details != null) {
      map['details'] = Variable<String>(details);
    }
    if (!nullToAbsent || printerId != null) {
      map['printer_id'] = Variable<String>(printerId);
    }
    if (!nullToAbsent || hostId != null) {
      map['host_id'] = Variable<String>(hostId);
    }
    if (!nullToAbsent || jobId != null) {
      map['job_id'] = Variable<String>(jobId);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  LogsCompanion toCompanion(bool nullToAbsent) {
    return LogsCompanion(
      id: Value(id),
      level: Value(level),
      category: Value(category),
      title: Value(title),
      message: Value(message),
      details: details == null && nullToAbsent
          ? const Value.absent()
          : Value(details),
      printerId: printerId == null && nullToAbsent
          ? const Value.absent()
          : Value(printerId),
      hostId: hostId == null && nullToAbsent
          ? const Value.absent()
          : Value(hostId),
      jobId: jobId == null && nullToAbsent
          ? const Value.absent()
          : Value(jobId),
      createdAt: Value(createdAt),
    );
  }

  factory LogEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LogEntry(
      id: serializer.fromJson<String>(json['id']),
      level: serializer.fromJson<int>(json['level']),
      category: serializer.fromJson<int>(json['category']),
      title: serializer.fromJson<String>(json['title']),
      message: serializer.fromJson<String>(json['message']),
      details: serializer.fromJson<String?>(json['details']),
      printerId: serializer.fromJson<String?>(json['printerId']),
      hostId: serializer.fromJson<String?>(json['hostId']),
      jobId: serializer.fromJson<String?>(json['jobId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'level': serializer.toJson<int>(level),
      'category': serializer.toJson<int>(category),
      'title': serializer.toJson<String>(title),
      'message': serializer.toJson<String>(message),
      'details': serializer.toJson<String?>(details),
      'printerId': serializer.toJson<String?>(printerId),
      'hostId': serializer.toJson<String?>(hostId),
      'jobId': serializer.toJson<String?>(jobId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  LogEntry copyWith({
    String? id,
    int? level,
    int? category,
    String? title,
    String? message,
    Value<String?> details = const Value.absent(),
    Value<String?> printerId = const Value.absent(),
    Value<String?> hostId = const Value.absent(),
    Value<String?> jobId = const Value.absent(),
    DateTime? createdAt,
  }) => LogEntry(
    id: id ?? this.id,
    level: level ?? this.level,
    category: category ?? this.category,
    title: title ?? this.title,
    message: message ?? this.message,
    details: details.present ? details.value : this.details,
    printerId: printerId.present ? printerId.value : this.printerId,
    hostId: hostId.present ? hostId.value : this.hostId,
    jobId: jobId.present ? jobId.value : this.jobId,
    createdAt: createdAt ?? this.createdAt,
  );
  LogEntry copyWithCompanion(LogsCompanion data) {
    return LogEntry(
      id: data.id.present ? data.id.value : this.id,
      level: data.level.present ? data.level.value : this.level,
      category: data.category.present ? data.category.value : this.category,
      title: data.title.present ? data.title.value : this.title,
      message: data.message.present ? data.message.value : this.message,
      details: data.details.present ? data.details.value : this.details,
      printerId: data.printerId.present ? data.printerId.value : this.printerId,
      hostId: data.hostId.present ? data.hostId.value : this.hostId,
      jobId: data.jobId.present ? data.jobId.value : this.jobId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LogEntry(')
          ..write('id: $id, ')
          ..write('level: $level, ')
          ..write('category: $category, ')
          ..write('title: $title, ')
          ..write('message: $message, ')
          ..write('details: $details, ')
          ..write('printerId: $printerId, ')
          ..write('hostId: $hostId, ')
          ..write('jobId: $jobId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    level,
    category,
    title,
    message,
    details,
    printerId,
    hostId,
    jobId,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LogEntry &&
          other.id == this.id &&
          other.level == this.level &&
          other.category == this.category &&
          other.title == this.title &&
          other.message == this.message &&
          other.details == this.details &&
          other.printerId == this.printerId &&
          other.hostId == this.hostId &&
          other.jobId == this.jobId &&
          other.createdAt == this.createdAt);
}

class LogsCompanion extends UpdateCompanion<LogEntry> {
  final Value<String> id;
  final Value<int> level;
  final Value<int> category;
  final Value<String> title;
  final Value<String> message;
  final Value<String?> details;
  final Value<String?> printerId;
  final Value<String?> hostId;
  final Value<String?> jobId;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const LogsCompanion({
    this.id = const Value.absent(),
    this.level = const Value.absent(),
    this.category = const Value.absent(),
    this.title = const Value.absent(),
    this.message = const Value.absent(),
    this.details = const Value.absent(),
    this.printerId = const Value.absent(),
    this.hostId = const Value.absent(),
    this.jobId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LogsCompanion.insert({
    required String id,
    required int level,
    required int category,
    required String title,
    required String message,
    this.details = const Value.absent(),
    this.printerId = const Value.absent(),
    this.hostId = const Value.absent(),
    this.jobId = const Value.absent(),
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       level = Value(level),
       category = Value(category),
       title = Value(title),
       message = Value(message),
       createdAt = Value(createdAt);
  static Insertable<LogEntry> custom({
    Expression<String>? id,
    Expression<int>? level,
    Expression<int>? category,
    Expression<String>? title,
    Expression<String>? message,
    Expression<String>? details,
    Expression<String>? printerId,
    Expression<String>? hostId,
    Expression<String>? jobId,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (level != null) 'level': level,
      if (category != null) 'category': category,
      if (title != null) 'title': title,
      if (message != null) 'message': message,
      if (details != null) 'details': details,
      if (printerId != null) 'printer_id': printerId,
      if (hostId != null) 'host_id': hostId,
      if (jobId != null) 'job_id': jobId,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LogsCompanion copyWith({
    Value<String>? id,
    Value<int>? level,
    Value<int>? category,
    Value<String>? title,
    Value<String>? message,
    Value<String?>? details,
    Value<String?>? printerId,
    Value<String?>? hostId,
    Value<String?>? jobId,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return LogsCompanion(
      id: id ?? this.id,
      level: level ?? this.level,
      category: category ?? this.category,
      title: title ?? this.title,
      message: message ?? this.message,
      details: details ?? this.details,
      printerId: printerId ?? this.printerId,
      hostId: hostId ?? this.hostId,
      jobId: jobId ?? this.jobId,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (level.present) {
      map['level'] = Variable<int>(level.value);
    }
    if (category.present) {
      map['category'] = Variable<int>(category.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (message.present) {
      map['message'] = Variable<String>(message.value);
    }
    if (details.present) {
      map['details'] = Variable<String>(details.value);
    }
    if (printerId.present) {
      map['printer_id'] = Variable<String>(printerId.value);
    }
    if (hostId.present) {
      map['host_id'] = Variable<String>(hostId.value);
    }
    if (jobId.present) {
      map['job_id'] = Variable<String>(jobId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LogsCompanion(')
          ..write('id: $id, ')
          ..write('level: $level, ')
          ..write('category: $category, ')
          ..write('title: $title, ')
          ..write('message: $message, ')
          ..write('details: $details, ')
          ..write('printerId: $printerId, ')
          ..write('hostId: $hostId, ')
          ..write('jobId: $jobId, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $EmailConfigsTable extends EmailConfigs
    with TableInfo<$EmailConfigsTable, EmailConfigEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EmailConfigsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _smtpHostMeta = const VerificationMeta(
    'smtpHost',
  );
  @override
  late final GeneratedColumn<String> smtpHost = GeneratedColumn<String>(
    'smtp_host',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _smtpPortMeta = const VerificationMeta(
    'smtpPort',
  );
  @override
  late final GeneratedColumn<int> smtpPort = GeneratedColumn<int>(
    'smtp_port',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _useSslMeta = const VerificationMeta('useSsl');
  @override
  late final GeneratedColumn<bool> useSsl = GeneratedColumn<bool>(
    'use_ssl',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("use_ssl" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _usernameMeta = const VerificationMeta(
    'username',
  );
  @override
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
    'username',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _passwordMeta = const VerificationMeta(
    'password',
  );
  @override
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
    'password',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fromEmailMeta = const VerificationMeta(
    'fromEmail',
  );
  @override
  late final GeneratedColumn<String> fromEmail = GeneratedColumn<String>(
    'from_email',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _toEmailMeta = const VerificationMeta(
    'toEmail',
  );
  @override
  late final GeneratedColumn<String> toEmail = GeneratedColumn<String>(
    'to_email',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _enabledMeta = const VerificationMeta(
    'enabled',
  );
  @override
  late final GeneratedColumn<bool> enabled = GeneratedColumn<bool>(
    'enabled',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("enabled" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _notifyOnPrintFailureMeta =
      const VerificationMeta('notifyOnPrintFailure');
  @override
  late final GeneratedColumn<bool> notifyOnPrintFailure = GeneratedColumn<bool>(
    'notify_on_print_failure',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("notify_on_print_failure" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _notifyOnPrinterOfflineMeta =
      const VerificationMeta('notifyOnPrinterOffline');
  @override
  late final GeneratedColumn<bool> notifyOnPrinterOffline =
      GeneratedColumn<bool>(
        'notify_on_printer_offline',
        aliasedName,
        false,
        type: DriftSqlType.bool,
        requiredDuringInsert: false,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("notify_on_printer_offline" IN (0, 1))',
        ),
        defaultValue: const Constant(true),
      );
  static const VerificationMeta _notifyOnJobStuckMeta = const VerificationMeta(
    'notifyOnJobStuck',
  );
  @override
  late final GeneratedColumn<bool> notifyOnJobStuck = GeneratedColumn<bool>(
    'notify_on_job_stuck',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("notify_on_job_stuck" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _notifyOnAuthFailureMeta =
      const VerificationMeta('notifyOnAuthFailure');
  @override
  late final GeneratedColumn<bool> notifyOnAuthFailure = GeneratedColumn<bool>(
    'notify_on_auth_failure',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("notify_on_auth_failure" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    smtpHost,
    smtpPort,
    useSsl,
    username,
    password,
    fromEmail,
    toEmail,
    enabled,
    notifyOnPrintFailure,
    notifyOnPrinterOffline,
    notifyOnJobStuck,
    notifyOnAuthFailure,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'email_configs';
  @override
  VerificationContext validateIntegrity(
    Insertable<EmailConfigEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('smtp_host')) {
      context.handle(
        _smtpHostMeta,
        smtpHost.isAcceptableOrUnknown(data['smtp_host']!, _smtpHostMeta),
      );
    } else if (isInserting) {
      context.missing(_smtpHostMeta);
    }
    if (data.containsKey('smtp_port')) {
      context.handle(
        _smtpPortMeta,
        smtpPort.isAcceptableOrUnknown(data['smtp_port']!, _smtpPortMeta),
      );
    } else if (isInserting) {
      context.missing(_smtpPortMeta);
    }
    if (data.containsKey('use_ssl')) {
      context.handle(
        _useSslMeta,
        useSsl.isAcceptableOrUnknown(data['use_ssl']!, _useSslMeta),
      );
    }
    if (data.containsKey('username')) {
      context.handle(
        _usernameMeta,
        username.isAcceptableOrUnknown(data['username']!, _usernameMeta),
      );
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('password')) {
      context.handle(
        _passwordMeta,
        password.isAcceptableOrUnknown(data['password']!, _passwordMeta),
      );
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    if (data.containsKey('from_email')) {
      context.handle(
        _fromEmailMeta,
        fromEmail.isAcceptableOrUnknown(data['from_email']!, _fromEmailMeta),
      );
    } else if (isInserting) {
      context.missing(_fromEmailMeta);
    }
    if (data.containsKey('to_email')) {
      context.handle(
        _toEmailMeta,
        toEmail.isAcceptableOrUnknown(data['to_email']!, _toEmailMeta),
      );
    } else if (isInserting) {
      context.missing(_toEmailMeta);
    }
    if (data.containsKey('enabled')) {
      context.handle(
        _enabledMeta,
        enabled.isAcceptableOrUnknown(data['enabled']!, _enabledMeta),
      );
    }
    if (data.containsKey('notify_on_print_failure')) {
      context.handle(
        _notifyOnPrintFailureMeta,
        notifyOnPrintFailure.isAcceptableOrUnknown(
          data['notify_on_print_failure']!,
          _notifyOnPrintFailureMeta,
        ),
      );
    }
    if (data.containsKey('notify_on_printer_offline')) {
      context.handle(
        _notifyOnPrinterOfflineMeta,
        notifyOnPrinterOffline.isAcceptableOrUnknown(
          data['notify_on_printer_offline']!,
          _notifyOnPrinterOfflineMeta,
        ),
      );
    }
    if (data.containsKey('notify_on_job_stuck')) {
      context.handle(
        _notifyOnJobStuckMeta,
        notifyOnJobStuck.isAcceptableOrUnknown(
          data['notify_on_job_stuck']!,
          _notifyOnJobStuckMeta,
        ),
      );
    }
    if (data.containsKey('notify_on_auth_failure')) {
      context.handle(
        _notifyOnAuthFailureMeta,
        notifyOnAuthFailure.isAcceptableOrUnknown(
          data['notify_on_auth_failure']!,
          _notifyOnAuthFailureMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  EmailConfigEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EmailConfigEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      smtpHost: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}smtp_host'],
      )!,
      smtpPort: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}smtp_port'],
      )!,
      useSsl: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}use_ssl'],
      )!,
      username: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}username'],
      )!,
      password: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}password'],
      )!,
      fromEmail: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}from_email'],
      )!,
      toEmail: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}to_email'],
      )!,
      enabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}enabled'],
      )!,
      notifyOnPrintFailure: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}notify_on_print_failure'],
      )!,
      notifyOnPrinterOffline: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}notify_on_printer_offline'],
      )!,
      notifyOnJobStuck: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}notify_on_job_stuck'],
      )!,
      notifyOnAuthFailure: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}notify_on_auth_failure'],
      )!,
    );
  }

  @override
  $EmailConfigsTable createAlias(String alias) {
    return $EmailConfigsTable(attachedDatabase, alias);
  }
}

class EmailConfigEntry extends DataClass
    implements Insertable<EmailConfigEntry> {
  final String id;
  final String smtpHost;
  final int smtpPort;
  final bool useSsl;
  final String username;
  final String password;
  final String fromEmail;
  final String toEmail;
  final bool enabled;
  final bool notifyOnPrintFailure;
  final bool notifyOnPrinterOffline;
  final bool notifyOnJobStuck;
  final bool notifyOnAuthFailure;
  const EmailConfigEntry({
    required this.id,
    required this.smtpHost,
    required this.smtpPort,
    required this.useSsl,
    required this.username,
    required this.password,
    required this.fromEmail,
    required this.toEmail,
    required this.enabled,
    required this.notifyOnPrintFailure,
    required this.notifyOnPrinterOffline,
    required this.notifyOnJobStuck,
    required this.notifyOnAuthFailure,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['smtp_host'] = Variable<String>(smtpHost);
    map['smtp_port'] = Variable<int>(smtpPort);
    map['use_ssl'] = Variable<bool>(useSsl);
    map['username'] = Variable<String>(username);
    map['password'] = Variable<String>(password);
    map['from_email'] = Variable<String>(fromEmail);
    map['to_email'] = Variable<String>(toEmail);
    map['enabled'] = Variable<bool>(enabled);
    map['notify_on_print_failure'] = Variable<bool>(notifyOnPrintFailure);
    map['notify_on_printer_offline'] = Variable<bool>(notifyOnPrinterOffline);
    map['notify_on_job_stuck'] = Variable<bool>(notifyOnJobStuck);
    map['notify_on_auth_failure'] = Variable<bool>(notifyOnAuthFailure);
    return map;
  }

  EmailConfigsCompanion toCompanion(bool nullToAbsent) {
    return EmailConfigsCompanion(
      id: Value(id),
      smtpHost: Value(smtpHost),
      smtpPort: Value(smtpPort),
      useSsl: Value(useSsl),
      username: Value(username),
      password: Value(password),
      fromEmail: Value(fromEmail),
      toEmail: Value(toEmail),
      enabled: Value(enabled),
      notifyOnPrintFailure: Value(notifyOnPrintFailure),
      notifyOnPrinterOffline: Value(notifyOnPrinterOffline),
      notifyOnJobStuck: Value(notifyOnJobStuck),
      notifyOnAuthFailure: Value(notifyOnAuthFailure),
    );
  }

  factory EmailConfigEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EmailConfigEntry(
      id: serializer.fromJson<String>(json['id']),
      smtpHost: serializer.fromJson<String>(json['smtpHost']),
      smtpPort: serializer.fromJson<int>(json['smtpPort']),
      useSsl: serializer.fromJson<bool>(json['useSsl']),
      username: serializer.fromJson<String>(json['username']),
      password: serializer.fromJson<String>(json['password']),
      fromEmail: serializer.fromJson<String>(json['fromEmail']),
      toEmail: serializer.fromJson<String>(json['toEmail']),
      enabled: serializer.fromJson<bool>(json['enabled']),
      notifyOnPrintFailure: serializer.fromJson<bool>(
        json['notifyOnPrintFailure'],
      ),
      notifyOnPrinterOffline: serializer.fromJson<bool>(
        json['notifyOnPrinterOffline'],
      ),
      notifyOnJobStuck: serializer.fromJson<bool>(json['notifyOnJobStuck']),
      notifyOnAuthFailure: serializer.fromJson<bool>(
        json['notifyOnAuthFailure'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'smtpHost': serializer.toJson<String>(smtpHost),
      'smtpPort': serializer.toJson<int>(smtpPort),
      'useSsl': serializer.toJson<bool>(useSsl),
      'username': serializer.toJson<String>(username),
      'password': serializer.toJson<String>(password),
      'fromEmail': serializer.toJson<String>(fromEmail),
      'toEmail': serializer.toJson<String>(toEmail),
      'enabled': serializer.toJson<bool>(enabled),
      'notifyOnPrintFailure': serializer.toJson<bool>(notifyOnPrintFailure),
      'notifyOnPrinterOffline': serializer.toJson<bool>(notifyOnPrinterOffline),
      'notifyOnJobStuck': serializer.toJson<bool>(notifyOnJobStuck),
      'notifyOnAuthFailure': serializer.toJson<bool>(notifyOnAuthFailure),
    };
  }

  EmailConfigEntry copyWith({
    String? id,
    String? smtpHost,
    int? smtpPort,
    bool? useSsl,
    String? username,
    String? password,
    String? fromEmail,
    String? toEmail,
    bool? enabled,
    bool? notifyOnPrintFailure,
    bool? notifyOnPrinterOffline,
    bool? notifyOnJobStuck,
    bool? notifyOnAuthFailure,
  }) => EmailConfigEntry(
    id: id ?? this.id,
    smtpHost: smtpHost ?? this.smtpHost,
    smtpPort: smtpPort ?? this.smtpPort,
    useSsl: useSsl ?? this.useSsl,
    username: username ?? this.username,
    password: password ?? this.password,
    fromEmail: fromEmail ?? this.fromEmail,
    toEmail: toEmail ?? this.toEmail,
    enabled: enabled ?? this.enabled,
    notifyOnPrintFailure: notifyOnPrintFailure ?? this.notifyOnPrintFailure,
    notifyOnPrinterOffline:
        notifyOnPrinterOffline ?? this.notifyOnPrinterOffline,
    notifyOnJobStuck: notifyOnJobStuck ?? this.notifyOnJobStuck,
    notifyOnAuthFailure: notifyOnAuthFailure ?? this.notifyOnAuthFailure,
  );
  EmailConfigEntry copyWithCompanion(EmailConfigsCompanion data) {
    return EmailConfigEntry(
      id: data.id.present ? data.id.value : this.id,
      smtpHost: data.smtpHost.present ? data.smtpHost.value : this.smtpHost,
      smtpPort: data.smtpPort.present ? data.smtpPort.value : this.smtpPort,
      useSsl: data.useSsl.present ? data.useSsl.value : this.useSsl,
      username: data.username.present ? data.username.value : this.username,
      password: data.password.present ? data.password.value : this.password,
      fromEmail: data.fromEmail.present ? data.fromEmail.value : this.fromEmail,
      toEmail: data.toEmail.present ? data.toEmail.value : this.toEmail,
      enabled: data.enabled.present ? data.enabled.value : this.enabled,
      notifyOnPrintFailure: data.notifyOnPrintFailure.present
          ? data.notifyOnPrintFailure.value
          : this.notifyOnPrintFailure,
      notifyOnPrinterOffline: data.notifyOnPrinterOffline.present
          ? data.notifyOnPrinterOffline.value
          : this.notifyOnPrinterOffline,
      notifyOnJobStuck: data.notifyOnJobStuck.present
          ? data.notifyOnJobStuck.value
          : this.notifyOnJobStuck,
      notifyOnAuthFailure: data.notifyOnAuthFailure.present
          ? data.notifyOnAuthFailure.value
          : this.notifyOnAuthFailure,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EmailConfigEntry(')
          ..write('id: $id, ')
          ..write('smtpHost: $smtpHost, ')
          ..write('smtpPort: $smtpPort, ')
          ..write('useSsl: $useSsl, ')
          ..write('username: $username, ')
          ..write('password: $password, ')
          ..write('fromEmail: $fromEmail, ')
          ..write('toEmail: $toEmail, ')
          ..write('enabled: $enabled, ')
          ..write('notifyOnPrintFailure: $notifyOnPrintFailure, ')
          ..write('notifyOnPrinterOffline: $notifyOnPrinterOffline, ')
          ..write('notifyOnJobStuck: $notifyOnJobStuck, ')
          ..write('notifyOnAuthFailure: $notifyOnAuthFailure')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    smtpHost,
    smtpPort,
    useSsl,
    username,
    password,
    fromEmail,
    toEmail,
    enabled,
    notifyOnPrintFailure,
    notifyOnPrinterOffline,
    notifyOnJobStuck,
    notifyOnAuthFailure,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EmailConfigEntry &&
          other.id == this.id &&
          other.smtpHost == this.smtpHost &&
          other.smtpPort == this.smtpPort &&
          other.useSsl == this.useSsl &&
          other.username == this.username &&
          other.password == this.password &&
          other.fromEmail == this.fromEmail &&
          other.toEmail == this.toEmail &&
          other.enabled == this.enabled &&
          other.notifyOnPrintFailure == this.notifyOnPrintFailure &&
          other.notifyOnPrinterOffline == this.notifyOnPrinterOffline &&
          other.notifyOnJobStuck == this.notifyOnJobStuck &&
          other.notifyOnAuthFailure == this.notifyOnAuthFailure);
}

class EmailConfigsCompanion extends UpdateCompanion<EmailConfigEntry> {
  final Value<String> id;
  final Value<String> smtpHost;
  final Value<int> smtpPort;
  final Value<bool> useSsl;
  final Value<String> username;
  final Value<String> password;
  final Value<String> fromEmail;
  final Value<String> toEmail;
  final Value<bool> enabled;
  final Value<bool> notifyOnPrintFailure;
  final Value<bool> notifyOnPrinterOffline;
  final Value<bool> notifyOnJobStuck;
  final Value<bool> notifyOnAuthFailure;
  final Value<int> rowid;
  const EmailConfigsCompanion({
    this.id = const Value.absent(),
    this.smtpHost = const Value.absent(),
    this.smtpPort = const Value.absent(),
    this.useSsl = const Value.absent(),
    this.username = const Value.absent(),
    this.password = const Value.absent(),
    this.fromEmail = const Value.absent(),
    this.toEmail = const Value.absent(),
    this.enabled = const Value.absent(),
    this.notifyOnPrintFailure = const Value.absent(),
    this.notifyOnPrinterOffline = const Value.absent(),
    this.notifyOnJobStuck = const Value.absent(),
    this.notifyOnAuthFailure = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  EmailConfigsCompanion.insert({
    required String id,
    required String smtpHost,
    required int smtpPort,
    this.useSsl = const Value.absent(),
    required String username,
    required String password,
    required String fromEmail,
    required String toEmail,
    this.enabled = const Value.absent(),
    this.notifyOnPrintFailure = const Value.absent(),
    this.notifyOnPrinterOffline = const Value.absent(),
    this.notifyOnJobStuck = const Value.absent(),
    this.notifyOnAuthFailure = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       smtpHost = Value(smtpHost),
       smtpPort = Value(smtpPort),
       username = Value(username),
       password = Value(password),
       fromEmail = Value(fromEmail),
       toEmail = Value(toEmail);
  static Insertable<EmailConfigEntry> custom({
    Expression<String>? id,
    Expression<String>? smtpHost,
    Expression<int>? smtpPort,
    Expression<bool>? useSsl,
    Expression<String>? username,
    Expression<String>? password,
    Expression<String>? fromEmail,
    Expression<String>? toEmail,
    Expression<bool>? enabled,
    Expression<bool>? notifyOnPrintFailure,
    Expression<bool>? notifyOnPrinterOffline,
    Expression<bool>? notifyOnJobStuck,
    Expression<bool>? notifyOnAuthFailure,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (smtpHost != null) 'smtp_host': smtpHost,
      if (smtpPort != null) 'smtp_port': smtpPort,
      if (useSsl != null) 'use_ssl': useSsl,
      if (username != null) 'username': username,
      if (password != null) 'password': password,
      if (fromEmail != null) 'from_email': fromEmail,
      if (toEmail != null) 'to_email': toEmail,
      if (enabled != null) 'enabled': enabled,
      if (notifyOnPrintFailure != null)
        'notify_on_print_failure': notifyOnPrintFailure,
      if (notifyOnPrinterOffline != null)
        'notify_on_printer_offline': notifyOnPrinterOffline,
      if (notifyOnJobStuck != null) 'notify_on_job_stuck': notifyOnJobStuck,
      if (notifyOnAuthFailure != null)
        'notify_on_auth_failure': notifyOnAuthFailure,
      if (rowid != null) 'rowid': rowid,
    });
  }

  EmailConfigsCompanion copyWith({
    Value<String>? id,
    Value<String>? smtpHost,
    Value<int>? smtpPort,
    Value<bool>? useSsl,
    Value<String>? username,
    Value<String>? password,
    Value<String>? fromEmail,
    Value<String>? toEmail,
    Value<bool>? enabled,
    Value<bool>? notifyOnPrintFailure,
    Value<bool>? notifyOnPrinterOffline,
    Value<bool>? notifyOnJobStuck,
    Value<bool>? notifyOnAuthFailure,
    Value<int>? rowid,
  }) {
    return EmailConfigsCompanion(
      id: id ?? this.id,
      smtpHost: smtpHost ?? this.smtpHost,
      smtpPort: smtpPort ?? this.smtpPort,
      useSsl: useSsl ?? this.useSsl,
      username: username ?? this.username,
      password: password ?? this.password,
      fromEmail: fromEmail ?? this.fromEmail,
      toEmail: toEmail ?? this.toEmail,
      enabled: enabled ?? this.enabled,
      notifyOnPrintFailure: notifyOnPrintFailure ?? this.notifyOnPrintFailure,
      notifyOnPrinterOffline:
          notifyOnPrinterOffline ?? this.notifyOnPrinterOffline,
      notifyOnJobStuck: notifyOnJobStuck ?? this.notifyOnJobStuck,
      notifyOnAuthFailure: notifyOnAuthFailure ?? this.notifyOnAuthFailure,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (smtpHost.present) {
      map['smtp_host'] = Variable<String>(smtpHost.value);
    }
    if (smtpPort.present) {
      map['smtp_port'] = Variable<int>(smtpPort.value);
    }
    if (useSsl.present) {
      map['use_ssl'] = Variable<bool>(useSsl.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (fromEmail.present) {
      map['from_email'] = Variable<String>(fromEmail.value);
    }
    if (toEmail.present) {
      map['to_email'] = Variable<String>(toEmail.value);
    }
    if (enabled.present) {
      map['enabled'] = Variable<bool>(enabled.value);
    }
    if (notifyOnPrintFailure.present) {
      map['notify_on_print_failure'] = Variable<bool>(
        notifyOnPrintFailure.value,
      );
    }
    if (notifyOnPrinterOffline.present) {
      map['notify_on_printer_offline'] = Variable<bool>(
        notifyOnPrinterOffline.value,
      );
    }
    if (notifyOnJobStuck.present) {
      map['notify_on_job_stuck'] = Variable<bool>(notifyOnJobStuck.value);
    }
    if (notifyOnAuthFailure.present) {
      map['notify_on_auth_failure'] = Variable<bool>(notifyOnAuthFailure.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EmailConfigsCompanion(')
          ..write('id: $id, ')
          ..write('smtpHost: $smtpHost, ')
          ..write('smtpPort: $smtpPort, ')
          ..write('useSsl: $useSsl, ')
          ..write('username: $username, ')
          ..write('password: $password, ')
          ..write('fromEmail: $fromEmail, ')
          ..write('toEmail: $toEmail, ')
          ..write('enabled: $enabled, ')
          ..write('notifyOnPrintFailure: $notifyOnPrintFailure, ')
          ..write('notifyOnPrinterOffline: $notifyOnPrinterOffline, ')
          ..write('notifyOnJobStuck: $notifyOnJobStuck, ')
          ..write('notifyOnAuthFailure: $notifyOnAuthFailure, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $HostsTable hosts = $HostsTable(this);
  late final $PrintersTable printers = $PrintersTable(this);
  late final $JobsTable jobs = $JobsTable(this);
  late final $GroupsTable groups = $GroupsTable(this);
  late final $LogsTable logs = $LogsTable(this);
  late final $EmailConfigsTable emailConfigs = $EmailConfigsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    hosts,
    printers,
    jobs,
    groups,
    logs,
    emailConfigs,
  ];
}

typedef $$HostsTableCreateCompanionBuilder =
    HostsCompanion Function({
      required String id,
      required String name,
      required String host,
      required int port,
      required int status,
      Value<bool> requiresAuth,
      Value<String?> token,
      Value<DateTime?> tokenExpiresAt,
      Value<DateTime?> lastSeen,
      Value<String> supportedFeatures,
      Value<String?> version,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$HostsTableUpdateCompanionBuilder =
    HostsCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> host,
      Value<int> port,
      Value<int> status,
      Value<bool> requiresAuth,
      Value<String?> token,
      Value<DateTime?> tokenExpiresAt,
      Value<DateTime?> lastSeen,
      Value<String> supportedFeatures,
      Value<String?> version,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$HostsTableFilterComposer extends Composer<_$AppDatabase, $HostsTable> {
  $$HostsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get host => $composableBuilder(
    column: $table.host,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get port => $composableBuilder(
    column: $table.port,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get requiresAuth => $composableBuilder(
    column: $table.requiresAuth,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get token => $composableBuilder(
    column: $table.token,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get tokenExpiresAt => $composableBuilder(
    column: $table.tokenExpiresAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastSeen => $composableBuilder(
    column: $table.lastSeen,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get supportedFeatures => $composableBuilder(
    column: $table.supportedFeatures,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$HostsTableOrderingComposer
    extends Composer<_$AppDatabase, $HostsTable> {
  $$HostsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get host => $composableBuilder(
    column: $table.host,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get port => $composableBuilder(
    column: $table.port,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get requiresAuth => $composableBuilder(
    column: $table.requiresAuth,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get token => $composableBuilder(
    column: $table.token,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get tokenExpiresAt => $composableBuilder(
    column: $table.tokenExpiresAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastSeen => $composableBuilder(
    column: $table.lastSeen,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get supportedFeatures => $composableBuilder(
    column: $table.supportedFeatures,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$HostsTableAnnotationComposer
    extends Composer<_$AppDatabase, $HostsTable> {
  $$HostsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get host =>
      $composableBuilder(column: $table.host, builder: (column) => column);

  GeneratedColumn<int> get port =>
      $composableBuilder(column: $table.port, builder: (column) => column);

  GeneratedColumn<int> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<bool> get requiresAuth => $composableBuilder(
    column: $table.requiresAuth,
    builder: (column) => column,
  );

  GeneratedColumn<String> get token =>
      $composableBuilder(column: $table.token, builder: (column) => column);

  GeneratedColumn<DateTime> get tokenExpiresAt => $composableBuilder(
    column: $table.tokenExpiresAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastSeen =>
      $composableBuilder(column: $table.lastSeen, builder: (column) => column);

  GeneratedColumn<String> get supportedFeatures => $composableBuilder(
    column: $table.supportedFeatures,
    builder: (column) => column,
  );

  GeneratedColumn<String> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$HostsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $HostsTable,
          HostData,
          $$HostsTableFilterComposer,
          $$HostsTableOrderingComposer,
          $$HostsTableAnnotationComposer,
          $$HostsTableCreateCompanionBuilder,
          $$HostsTableUpdateCompanionBuilder,
          (HostData, BaseReferences<_$AppDatabase, $HostsTable, HostData>),
          HostData,
          PrefetchHooks Function()
        > {
  $$HostsTableTableManager(_$AppDatabase db, $HostsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HostsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HostsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HostsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> host = const Value.absent(),
                Value<int> port = const Value.absent(),
                Value<int> status = const Value.absent(),
                Value<bool> requiresAuth = const Value.absent(),
                Value<String?> token = const Value.absent(),
                Value<DateTime?> tokenExpiresAt = const Value.absent(),
                Value<DateTime?> lastSeen = const Value.absent(),
                Value<String> supportedFeatures = const Value.absent(),
                Value<String?> version = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => HostsCompanion(
                id: id,
                name: name,
                host: host,
                port: port,
                status: status,
                requiresAuth: requiresAuth,
                token: token,
                tokenExpiresAt: tokenExpiresAt,
                lastSeen: lastSeen,
                supportedFeatures: supportedFeatures,
                version: version,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String host,
                required int port,
                required int status,
                Value<bool> requiresAuth = const Value.absent(),
                Value<String?> token = const Value.absent(),
                Value<DateTime?> tokenExpiresAt = const Value.absent(),
                Value<DateTime?> lastSeen = const Value.absent(),
                Value<String> supportedFeatures = const Value.absent(),
                Value<String?> version = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => HostsCompanion.insert(
                id: id,
                name: name,
                host: host,
                port: port,
                status: status,
                requiresAuth: requiresAuth,
                token: token,
                tokenExpiresAt: tokenExpiresAt,
                lastSeen: lastSeen,
                supportedFeatures: supportedFeatures,
                version: version,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$HostsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $HostsTable,
      HostData,
      $$HostsTableFilterComposer,
      $$HostsTableOrderingComposer,
      $$HostsTableAnnotationComposer,
      $$HostsTableCreateCompanionBuilder,
      $$HostsTableUpdateCompanionBuilder,
      (HostData, BaseReferences<_$AppDatabase, $HostsTable, HostData>),
      HostData,
      PrefetchHooks Function()
    >;
typedef $$PrintersTableCreateCompanionBuilder =
    PrintersCompanion Function({
      required String id,
      required String name,
      Value<String?> hostId,
      required int location,
      required int status,
      Value<String?> driverName,
      Value<String?> portName,
      Value<String?> locationDescription,
      Value<String?> comment,
      Value<int> jobCount,
      Value<bool> shared,
      Value<String> allowedGroups,
      Value<DateTime?> lastSeen,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$PrintersTableUpdateCompanionBuilder =
    PrintersCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String?> hostId,
      Value<int> location,
      Value<int> status,
      Value<String?> driverName,
      Value<String?> portName,
      Value<String?> locationDescription,
      Value<String?> comment,
      Value<int> jobCount,
      Value<bool> shared,
      Value<String> allowedGroups,
      Value<DateTime?> lastSeen,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$PrintersTableFilterComposer
    extends Composer<_$AppDatabase, $PrintersTable> {
  $$PrintersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get hostId => $composableBuilder(
    column: $table.hostId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get driverName => $composableBuilder(
    column: $table.driverName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get portName => $composableBuilder(
    column: $table.portName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get locationDescription => $composableBuilder(
    column: $table.locationDescription,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get comment => $composableBuilder(
    column: $table.comment,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get jobCount => $composableBuilder(
    column: $table.jobCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get shared => $composableBuilder(
    column: $table.shared,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get allowedGroups => $composableBuilder(
    column: $table.allowedGroups,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastSeen => $composableBuilder(
    column: $table.lastSeen,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PrintersTableOrderingComposer
    extends Composer<_$AppDatabase, $PrintersTable> {
  $$PrintersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get hostId => $composableBuilder(
    column: $table.hostId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get driverName => $composableBuilder(
    column: $table.driverName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get portName => $composableBuilder(
    column: $table.portName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get locationDescription => $composableBuilder(
    column: $table.locationDescription,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get comment => $composableBuilder(
    column: $table.comment,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get jobCount => $composableBuilder(
    column: $table.jobCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get shared => $composableBuilder(
    column: $table.shared,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get allowedGroups => $composableBuilder(
    column: $table.allowedGroups,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastSeen => $composableBuilder(
    column: $table.lastSeen,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PrintersTableAnnotationComposer
    extends Composer<_$AppDatabase, $PrintersTable> {
  $$PrintersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get hostId =>
      $composableBuilder(column: $table.hostId, builder: (column) => column);

  GeneratedColumn<int> get location =>
      $composableBuilder(column: $table.location, builder: (column) => column);

  GeneratedColumn<int> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get driverName => $composableBuilder(
    column: $table.driverName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get portName =>
      $composableBuilder(column: $table.portName, builder: (column) => column);

  GeneratedColumn<String> get locationDescription => $composableBuilder(
    column: $table.locationDescription,
    builder: (column) => column,
  );

  GeneratedColumn<String> get comment =>
      $composableBuilder(column: $table.comment, builder: (column) => column);

  GeneratedColumn<int> get jobCount =>
      $composableBuilder(column: $table.jobCount, builder: (column) => column);

  GeneratedColumn<bool> get shared =>
      $composableBuilder(column: $table.shared, builder: (column) => column);

  GeneratedColumn<String> get allowedGroups => $composableBuilder(
    column: $table.allowedGroups,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastSeen =>
      $composableBuilder(column: $table.lastSeen, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$PrintersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PrintersTable,
          PrinterData,
          $$PrintersTableFilterComposer,
          $$PrintersTableOrderingComposer,
          $$PrintersTableAnnotationComposer,
          $$PrintersTableCreateCompanionBuilder,
          $$PrintersTableUpdateCompanionBuilder,
          (
            PrinterData,
            BaseReferences<_$AppDatabase, $PrintersTable, PrinterData>,
          ),
          PrinterData,
          PrefetchHooks Function()
        > {
  $$PrintersTableTableManager(_$AppDatabase db, $PrintersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PrintersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PrintersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PrintersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> hostId = const Value.absent(),
                Value<int> location = const Value.absent(),
                Value<int> status = const Value.absent(),
                Value<String?> driverName = const Value.absent(),
                Value<String?> portName = const Value.absent(),
                Value<String?> locationDescription = const Value.absent(),
                Value<String?> comment = const Value.absent(),
                Value<int> jobCount = const Value.absent(),
                Value<bool> shared = const Value.absent(),
                Value<String> allowedGroups = const Value.absent(),
                Value<DateTime?> lastSeen = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PrintersCompanion(
                id: id,
                name: name,
                hostId: hostId,
                location: location,
                status: status,
                driverName: driverName,
                portName: portName,
                locationDescription: locationDescription,
                comment: comment,
                jobCount: jobCount,
                shared: shared,
                allowedGroups: allowedGroups,
                lastSeen: lastSeen,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<String?> hostId = const Value.absent(),
                required int location,
                required int status,
                Value<String?> driverName = const Value.absent(),
                Value<String?> portName = const Value.absent(),
                Value<String?> locationDescription = const Value.absent(),
                Value<String?> comment = const Value.absent(),
                Value<int> jobCount = const Value.absent(),
                Value<bool> shared = const Value.absent(),
                Value<String> allowedGroups = const Value.absent(),
                Value<DateTime?> lastSeen = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => PrintersCompanion.insert(
                id: id,
                name: name,
                hostId: hostId,
                location: location,
                status: status,
                driverName: driverName,
                portName: portName,
                locationDescription: locationDescription,
                comment: comment,
                jobCount: jobCount,
                shared: shared,
                allowedGroups: allowedGroups,
                lastSeen: lastSeen,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PrintersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PrintersTable,
      PrinterData,
      $$PrintersTableFilterComposer,
      $$PrintersTableOrderingComposer,
      $$PrintersTableAnnotationComposer,
      $$PrintersTableCreateCompanionBuilder,
      $$PrintersTableUpdateCompanionBuilder,
      (PrinterData, BaseReferences<_$AppDatabase, $PrintersTable, PrinterData>),
      PrinterData,
      PrefetchHooks Function()
    >;
typedef $$JobsTableCreateCompanionBuilder =
    JobsCompanion Function({
      required String id,
      required String documentName,
      required String printerName,
      Value<String?> hostId,
      required int status,
      Value<int> totalSize,
      Value<int> sentBytes,
      Value<int> totalChunks,
      Value<int> sentChunks,
      Value<int> totalPages,
      Value<int> printedPages,
      required DateTime createdAt,
      Value<DateTime?> startedAt,
      Value<DateTime?> completedAt,
      Value<String?> errorCode,
      Value<String?> errorMessage,
      Value<int> rowid,
    });
typedef $$JobsTableUpdateCompanionBuilder =
    JobsCompanion Function({
      Value<String> id,
      Value<String> documentName,
      Value<String> printerName,
      Value<String?> hostId,
      Value<int> status,
      Value<int> totalSize,
      Value<int> sentBytes,
      Value<int> totalChunks,
      Value<int> sentChunks,
      Value<int> totalPages,
      Value<int> printedPages,
      Value<DateTime> createdAt,
      Value<DateTime?> startedAt,
      Value<DateTime?> completedAt,
      Value<String?> errorCode,
      Value<String?> errorMessage,
      Value<int> rowid,
    });

class $$JobsTableFilterComposer extends Composer<_$AppDatabase, $JobsTable> {
  $$JobsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get documentName => $composableBuilder(
    column: $table.documentName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get printerName => $composableBuilder(
    column: $table.printerName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get hostId => $composableBuilder(
    column: $table.hostId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalSize => $composableBuilder(
    column: $table.totalSize,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sentBytes => $composableBuilder(
    column: $table.sentBytes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalChunks => $composableBuilder(
    column: $table.totalChunks,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sentChunks => $composableBuilder(
    column: $table.sentChunks,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalPages => $composableBuilder(
    column: $table.totalPages,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get printedPages => $composableBuilder(
    column: $table.printedPages,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get errorCode => $composableBuilder(
    column: $table.errorCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get errorMessage => $composableBuilder(
    column: $table.errorMessage,
    builder: (column) => ColumnFilters(column),
  );
}

class $$JobsTableOrderingComposer extends Composer<_$AppDatabase, $JobsTable> {
  $$JobsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get documentName => $composableBuilder(
    column: $table.documentName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get printerName => $composableBuilder(
    column: $table.printerName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get hostId => $composableBuilder(
    column: $table.hostId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalSize => $composableBuilder(
    column: $table.totalSize,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sentBytes => $composableBuilder(
    column: $table.sentBytes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalChunks => $composableBuilder(
    column: $table.totalChunks,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sentChunks => $composableBuilder(
    column: $table.sentChunks,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalPages => $composableBuilder(
    column: $table.totalPages,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get printedPages => $composableBuilder(
    column: $table.printedPages,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get errorCode => $composableBuilder(
    column: $table.errorCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get errorMessage => $composableBuilder(
    column: $table.errorMessage,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$JobsTableAnnotationComposer
    extends Composer<_$AppDatabase, $JobsTable> {
  $$JobsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get documentName => $composableBuilder(
    column: $table.documentName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get printerName => $composableBuilder(
    column: $table.printerName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get hostId =>
      $composableBuilder(column: $table.hostId, builder: (column) => column);

  GeneratedColumn<int> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<int> get totalSize =>
      $composableBuilder(column: $table.totalSize, builder: (column) => column);

  GeneratedColumn<int> get sentBytes =>
      $composableBuilder(column: $table.sentBytes, builder: (column) => column);

  GeneratedColumn<int> get totalChunks => $composableBuilder(
    column: $table.totalChunks,
    builder: (column) => column,
  );

  GeneratedColumn<int> get sentChunks => $composableBuilder(
    column: $table.sentChunks,
    builder: (column) => column,
  );

  GeneratedColumn<int> get totalPages => $composableBuilder(
    column: $table.totalPages,
    builder: (column) => column,
  );

  GeneratedColumn<int> get printedPages => $composableBuilder(
    column: $table.printedPages,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get startedAt =>
      $composableBuilder(column: $table.startedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get errorCode =>
      $composableBuilder(column: $table.errorCode, builder: (column) => column);

  GeneratedColumn<String> get errorMessage => $composableBuilder(
    column: $table.errorMessage,
    builder: (column) => column,
  );
}

class $$JobsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $JobsTable,
          JobData,
          $$JobsTableFilterComposer,
          $$JobsTableOrderingComposer,
          $$JobsTableAnnotationComposer,
          $$JobsTableCreateCompanionBuilder,
          $$JobsTableUpdateCompanionBuilder,
          (JobData, BaseReferences<_$AppDatabase, $JobsTable, JobData>),
          JobData,
          PrefetchHooks Function()
        > {
  $$JobsTableTableManager(_$AppDatabase db, $JobsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$JobsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$JobsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$JobsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> documentName = const Value.absent(),
                Value<String> printerName = const Value.absent(),
                Value<String?> hostId = const Value.absent(),
                Value<int> status = const Value.absent(),
                Value<int> totalSize = const Value.absent(),
                Value<int> sentBytes = const Value.absent(),
                Value<int> totalChunks = const Value.absent(),
                Value<int> sentChunks = const Value.absent(),
                Value<int> totalPages = const Value.absent(),
                Value<int> printedPages = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> startedAt = const Value.absent(),
                Value<DateTime?> completedAt = const Value.absent(),
                Value<String?> errorCode = const Value.absent(),
                Value<String?> errorMessage = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => JobsCompanion(
                id: id,
                documentName: documentName,
                printerName: printerName,
                hostId: hostId,
                status: status,
                totalSize: totalSize,
                sentBytes: sentBytes,
                totalChunks: totalChunks,
                sentChunks: sentChunks,
                totalPages: totalPages,
                printedPages: printedPages,
                createdAt: createdAt,
                startedAt: startedAt,
                completedAt: completedAt,
                errorCode: errorCode,
                errorMessage: errorMessage,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String documentName,
                required String printerName,
                Value<String?> hostId = const Value.absent(),
                required int status,
                Value<int> totalSize = const Value.absent(),
                Value<int> sentBytes = const Value.absent(),
                Value<int> totalChunks = const Value.absent(),
                Value<int> sentChunks = const Value.absent(),
                Value<int> totalPages = const Value.absent(),
                Value<int> printedPages = const Value.absent(),
                required DateTime createdAt,
                Value<DateTime?> startedAt = const Value.absent(),
                Value<DateTime?> completedAt = const Value.absent(),
                Value<String?> errorCode = const Value.absent(),
                Value<String?> errorMessage = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => JobsCompanion.insert(
                id: id,
                documentName: documentName,
                printerName: printerName,
                hostId: hostId,
                status: status,
                totalSize: totalSize,
                sentBytes: sentBytes,
                totalChunks: totalChunks,
                sentChunks: sentChunks,
                totalPages: totalPages,
                printedPages: printedPages,
                createdAt: createdAt,
                startedAt: startedAt,
                completedAt: completedAt,
                errorCode: errorCode,
                errorMessage: errorMessage,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$JobsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $JobsTable,
      JobData,
      $$JobsTableFilterComposer,
      $$JobsTableOrderingComposer,
      $$JobsTableAnnotationComposer,
      $$JobsTableCreateCompanionBuilder,
      $$JobsTableUpdateCompanionBuilder,
      (JobData, BaseReferences<_$AppDatabase, $JobsTable, JobData>),
      JobData,
      PrefetchHooks Function()
    >;
typedef $$GroupsTableCreateCompanionBuilder =
    GroupsCompanion Function({
      required String id,
      required String name,
      Value<String?> description,
      Value<String> permissions,
      Value<String> memberIds,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$GroupsTableUpdateCompanionBuilder =
    GroupsCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String?> description,
      Value<String> permissions,
      Value<String> memberIds,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$GroupsTableFilterComposer
    extends Composer<_$AppDatabase, $GroupsTable> {
  $$GroupsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get permissions => $composableBuilder(
    column: $table.permissions,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get memberIds => $composableBuilder(
    column: $table.memberIds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$GroupsTableOrderingComposer
    extends Composer<_$AppDatabase, $GroupsTable> {
  $$GroupsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get permissions => $composableBuilder(
    column: $table.permissions,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get memberIds => $composableBuilder(
    column: $table.memberIds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$GroupsTableAnnotationComposer
    extends Composer<_$AppDatabase, $GroupsTable> {
  $$GroupsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get permissions => $composableBuilder(
    column: $table.permissions,
    builder: (column) => column,
  );

  GeneratedColumn<String> get memberIds =>
      $composableBuilder(column: $table.memberIds, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$GroupsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $GroupsTable,
          GroupData,
          $$GroupsTableFilterComposer,
          $$GroupsTableOrderingComposer,
          $$GroupsTableAnnotationComposer,
          $$GroupsTableCreateCompanionBuilder,
          $$GroupsTableUpdateCompanionBuilder,
          (GroupData, BaseReferences<_$AppDatabase, $GroupsTable, GroupData>),
          GroupData,
          PrefetchHooks Function()
        > {
  $$GroupsTableTableManager(_$AppDatabase db, $GroupsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GroupsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GroupsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GroupsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String> permissions = const Value.absent(),
                Value<String> memberIds = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => GroupsCompanion(
                id: id,
                name: name,
                description: description,
                permissions: permissions,
                memberIds: memberIds,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<String?> description = const Value.absent(),
                Value<String> permissions = const Value.absent(),
                Value<String> memberIds = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => GroupsCompanion.insert(
                id: id,
                name: name,
                description: description,
                permissions: permissions,
                memberIds: memberIds,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$GroupsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $GroupsTable,
      GroupData,
      $$GroupsTableFilterComposer,
      $$GroupsTableOrderingComposer,
      $$GroupsTableAnnotationComposer,
      $$GroupsTableCreateCompanionBuilder,
      $$GroupsTableUpdateCompanionBuilder,
      (GroupData, BaseReferences<_$AppDatabase, $GroupsTable, GroupData>),
      GroupData,
      PrefetchHooks Function()
    >;
typedef $$LogsTableCreateCompanionBuilder =
    LogsCompanion Function({
      required String id,
      required int level,
      required int category,
      required String title,
      required String message,
      Value<String?> details,
      Value<String?> printerId,
      Value<String?> hostId,
      Value<String?> jobId,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$LogsTableUpdateCompanionBuilder =
    LogsCompanion Function({
      Value<String> id,
      Value<int> level,
      Value<int> category,
      Value<String> title,
      Value<String> message,
      Value<String?> details,
      Value<String?> printerId,
      Value<String?> hostId,
      Value<String?> jobId,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$LogsTableFilterComposer extends Composer<_$AppDatabase, $LogsTable> {
  $$LogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get level => $composableBuilder(
    column: $table.level,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get message => $composableBuilder(
    column: $table.message,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get details => $composableBuilder(
    column: $table.details,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get printerId => $composableBuilder(
    column: $table.printerId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get hostId => $composableBuilder(
    column: $table.hostId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get jobId => $composableBuilder(
    column: $table.jobId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LogsTableOrderingComposer extends Composer<_$AppDatabase, $LogsTable> {
  $$LogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get level => $composableBuilder(
    column: $table.level,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get message => $composableBuilder(
    column: $table.message,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get details => $composableBuilder(
    column: $table.details,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get printerId => $composableBuilder(
    column: $table.printerId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get hostId => $composableBuilder(
    column: $table.hostId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get jobId => $composableBuilder(
    column: $table.jobId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $LogsTable> {
  $$LogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get level =>
      $composableBuilder(column: $table.level, builder: (column) => column);

  GeneratedColumn<int> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get message =>
      $composableBuilder(column: $table.message, builder: (column) => column);

  GeneratedColumn<String> get details =>
      $composableBuilder(column: $table.details, builder: (column) => column);

  GeneratedColumn<String> get printerId =>
      $composableBuilder(column: $table.printerId, builder: (column) => column);

  GeneratedColumn<String> get hostId =>
      $composableBuilder(column: $table.hostId, builder: (column) => column);

  GeneratedColumn<String> get jobId =>
      $composableBuilder(column: $table.jobId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$LogsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LogsTable,
          LogEntry,
          $$LogsTableFilterComposer,
          $$LogsTableOrderingComposer,
          $$LogsTableAnnotationComposer,
          $$LogsTableCreateCompanionBuilder,
          $$LogsTableUpdateCompanionBuilder,
          (LogEntry, BaseReferences<_$AppDatabase, $LogsTable, LogEntry>),
          LogEntry,
          PrefetchHooks Function()
        > {
  $$LogsTableTableManager(_$AppDatabase db, $LogsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<int> level = const Value.absent(),
                Value<int> category = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> message = const Value.absent(),
                Value<String?> details = const Value.absent(),
                Value<String?> printerId = const Value.absent(),
                Value<String?> hostId = const Value.absent(),
                Value<String?> jobId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LogsCompanion(
                id: id,
                level: level,
                category: category,
                title: title,
                message: message,
                details: details,
                printerId: printerId,
                hostId: hostId,
                jobId: jobId,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required int level,
                required int category,
                required String title,
                required String message,
                Value<String?> details = const Value.absent(),
                Value<String?> printerId = const Value.absent(),
                Value<String?> hostId = const Value.absent(),
                Value<String?> jobId = const Value.absent(),
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => LogsCompanion.insert(
                id: id,
                level: level,
                category: category,
                title: title,
                message: message,
                details: details,
                printerId: printerId,
                hostId: hostId,
                jobId: jobId,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LogsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LogsTable,
      LogEntry,
      $$LogsTableFilterComposer,
      $$LogsTableOrderingComposer,
      $$LogsTableAnnotationComposer,
      $$LogsTableCreateCompanionBuilder,
      $$LogsTableUpdateCompanionBuilder,
      (LogEntry, BaseReferences<_$AppDatabase, $LogsTable, LogEntry>),
      LogEntry,
      PrefetchHooks Function()
    >;
typedef $$EmailConfigsTableCreateCompanionBuilder =
    EmailConfigsCompanion Function({
      required String id,
      required String smtpHost,
      required int smtpPort,
      Value<bool> useSsl,
      required String username,
      required String password,
      required String fromEmail,
      required String toEmail,
      Value<bool> enabled,
      Value<bool> notifyOnPrintFailure,
      Value<bool> notifyOnPrinterOffline,
      Value<bool> notifyOnJobStuck,
      Value<bool> notifyOnAuthFailure,
      Value<int> rowid,
    });
typedef $$EmailConfigsTableUpdateCompanionBuilder =
    EmailConfigsCompanion Function({
      Value<String> id,
      Value<String> smtpHost,
      Value<int> smtpPort,
      Value<bool> useSsl,
      Value<String> username,
      Value<String> password,
      Value<String> fromEmail,
      Value<String> toEmail,
      Value<bool> enabled,
      Value<bool> notifyOnPrintFailure,
      Value<bool> notifyOnPrinterOffline,
      Value<bool> notifyOnJobStuck,
      Value<bool> notifyOnAuthFailure,
      Value<int> rowid,
    });

class $$EmailConfigsTableFilterComposer
    extends Composer<_$AppDatabase, $EmailConfigsTable> {
  $$EmailConfigsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get smtpHost => $composableBuilder(
    column: $table.smtpHost,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get smtpPort => $composableBuilder(
    column: $table.smtpPort,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get useSsl => $composableBuilder(
    column: $table.useSsl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get username => $composableBuilder(
    column: $table.username,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get password => $composableBuilder(
    column: $table.password,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fromEmail => $composableBuilder(
    column: $table.fromEmail,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get toEmail => $composableBuilder(
    column: $table.toEmail,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get enabled => $composableBuilder(
    column: $table.enabled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get notifyOnPrintFailure => $composableBuilder(
    column: $table.notifyOnPrintFailure,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get notifyOnPrinterOffline => $composableBuilder(
    column: $table.notifyOnPrinterOffline,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get notifyOnJobStuck => $composableBuilder(
    column: $table.notifyOnJobStuck,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get notifyOnAuthFailure => $composableBuilder(
    column: $table.notifyOnAuthFailure,
    builder: (column) => ColumnFilters(column),
  );
}

class $$EmailConfigsTableOrderingComposer
    extends Composer<_$AppDatabase, $EmailConfigsTable> {
  $$EmailConfigsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get smtpHost => $composableBuilder(
    column: $table.smtpHost,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get smtpPort => $composableBuilder(
    column: $table.smtpPort,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get useSsl => $composableBuilder(
    column: $table.useSsl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get username => $composableBuilder(
    column: $table.username,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get password => $composableBuilder(
    column: $table.password,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fromEmail => $composableBuilder(
    column: $table.fromEmail,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get toEmail => $composableBuilder(
    column: $table.toEmail,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get enabled => $composableBuilder(
    column: $table.enabled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get notifyOnPrintFailure => $composableBuilder(
    column: $table.notifyOnPrintFailure,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get notifyOnPrinterOffline => $composableBuilder(
    column: $table.notifyOnPrinterOffline,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get notifyOnJobStuck => $composableBuilder(
    column: $table.notifyOnJobStuck,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get notifyOnAuthFailure => $composableBuilder(
    column: $table.notifyOnAuthFailure,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$EmailConfigsTableAnnotationComposer
    extends Composer<_$AppDatabase, $EmailConfigsTable> {
  $$EmailConfigsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get smtpHost =>
      $composableBuilder(column: $table.smtpHost, builder: (column) => column);

  GeneratedColumn<int> get smtpPort =>
      $composableBuilder(column: $table.smtpPort, builder: (column) => column);

  GeneratedColumn<bool> get useSsl =>
      $composableBuilder(column: $table.useSsl, builder: (column) => column);

  GeneratedColumn<String> get username =>
      $composableBuilder(column: $table.username, builder: (column) => column);

  GeneratedColumn<String> get password =>
      $composableBuilder(column: $table.password, builder: (column) => column);

  GeneratedColumn<String> get fromEmail =>
      $composableBuilder(column: $table.fromEmail, builder: (column) => column);

  GeneratedColumn<String> get toEmail =>
      $composableBuilder(column: $table.toEmail, builder: (column) => column);

  GeneratedColumn<bool> get enabled =>
      $composableBuilder(column: $table.enabled, builder: (column) => column);

  GeneratedColumn<bool> get notifyOnPrintFailure => $composableBuilder(
    column: $table.notifyOnPrintFailure,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get notifyOnPrinterOffline => $composableBuilder(
    column: $table.notifyOnPrinterOffline,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get notifyOnJobStuck => $composableBuilder(
    column: $table.notifyOnJobStuck,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get notifyOnAuthFailure => $composableBuilder(
    column: $table.notifyOnAuthFailure,
    builder: (column) => column,
  );
}

class $$EmailConfigsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $EmailConfigsTable,
          EmailConfigEntry,
          $$EmailConfigsTableFilterComposer,
          $$EmailConfigsTableOrderingComposer,
          $$EmailConfigsTableAnnotationComposer,
          $$EmailConfigsTableCreateCompanionBuilder,
          $$EmailConfigsTableUpdateCompanionBuilder,
          (
            EmailConfigEntry,
            BaseReferences<_$AppDatabase, $EmailConfigsTable, EmailConfigEntry>,
          ),
          EmailConfigEntry,
          PrefetchHooks Function()
        > {
  $$EmailConfigsTableTableManager(_$AppDatabase db, $EmailConfigsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EmailConfigsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EmailConfigsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EmailConfigsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> smtpHost = const Value.absent(),
                Value<int> smtpPort = const Value.absent(),
                Value<bool> useSsl = const Value.absent(),
                Value<String> username = const Value.absent(),
                Value<String> password = const Value.absent(),
                Value<String> fromEmail = const Value.absent(),
                Value<String> toEmail = const Value.absent(),
                Value<bool> enabled = const Value.absent(),
                Value<bool> notifyOnPrintFailure = const Value.absent(),
                Value<bool> notifyOnPrinterOffline = const Value.absent(),
                Value<bool> notifyOnJobStuck = const Value.absent(),
                Value<bool> notifyOnAuthFailure = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => EmailConfigsCompanion(
                id: id,
                smtpHost: smtpHost,
                smtpPort: smtpPort,
                useSsl: useSsl,
                username: username,
                password: password,
                fromEmail: fromEmail,
                toEmail: toEmail,
                enabled: enabled,
                notifyOnPrintFailure: notifyOnPrintFailure,
                notifyOnPrinterOffline: notifyOnPrinterOffline,
                notifyOnJobStuck: notifyOnJobStuck,
                notifyOnAuthFailure: notifyOnAuthFailure,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String smtpHost,
                required int smtpPort,
                Value<bool> useSsl = const Value.absent(),
                required String username,
                required String password,
                required String fromEmail,
                required String toEmail,
                Value<bool> enabled = const Value.absent(),
                Value<bool> notifyOnPrintFailure = const Value.absent(),
                Value<bool> notifyOnPrinterOffline = const Value.absent(),
                Value<bool> notifyOnJobStuck = const Value.absent(),
                Value<bool> notifyOnAuthFailure = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => EmailConfigsCompanion.insert(
                id: id,
                smtpHost: smtpHost,
                smtpPort: smtpPort,
                useSsl: useSsl,
                username: username,
                password: password,
                fromEmail: fromEmail,
                toEmail: toEmail,
                enabled: enabled,
                notifyOnPrintFailure: notifyOnPrintFailure,
                notifyOnPrinterOffline: notifyOnPrinterOffline,
                notifyOnJobStuck: notifyOnJobStuck,
                notifyOnAuthFailure: notifyOnAuthFailure,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$EmailConfigsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $EmailConfigsTable,
      EmailConfigEntry,
      $$EmailConfigsTableFilterComposer,
      $$EmailConfigsTableOrderingComposer,
      $$EmailConfigsTableAnnotationComposer,
      $$EmailConfigsTableCreateCompanionBuilder,
      $$EmailConfigsTableUpdateCompanionBuilder,
      (
        EmailConfigEntry,
        BaseReferences<_$AppDatabase, $EmailConfigsTable, EmailConfigEntry>,
      ),
      EmailConfigEntry,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$HostsTableTableManager get hosts =>
      $$HostsTableTableManager(_db, _db.hosts);
  $$PrintersTableTableManager get printers =>
      $$PrintersTableTableManager(_db, _db.printers);
  $$JobsTableTableManager get jobs => $$JobsTableTableManager(_db, _db.jobs);
  $$GroupsTableTableManager get groups =>
      $$GroupsTableTableManager(_db, _db.groups);
  $$LogsTableTableManager get logs => $$LogsTableTableManager(_db, _db.logs);
  $$EmailConfigsTableTableManager get emailConfigs =>
      $$EmailConfigsTableTableManager(_db, _db.emailConfigs);
}
