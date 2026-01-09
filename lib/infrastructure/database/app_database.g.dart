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
  static const VerificationMeta _totalPagesPrintedMeta = const VerificationMeta(
    'totalPagesPrinted',
  );
  @override
  late final GeneratedColumn<int> totalPagesPrinted = GeneratedColumn<int>(
    'total_pages_printed',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _tonerLevelMeta = const VerificationMeta(
    'tonerLevel',
  );
  @override
  late final GeneratedColumn<String> tonerLevel = GeneratedColumn<String>(
    'toner_level',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('unknown'),
  );
  static const VerificationMeta _paperLevelMeta = const VerificationMeta(
    'paperLevel',
  );
  @override
  late final GeneratedColumn<String> paperLevel = GeneratedColumn<String>(
    'paper_level',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('unknown'),
  );
  static const VerificationMeta _lastMaintenanceDateMeta =
      const VerificationMeta('lastMaintenanceDate');
  @override
  late final GeneratedColumn<DateTime> lastMaintenanceDate =
      GeneratedColumn<DateTime>(
        'last_maintenance_date',
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
    totalPagesPrinted,
    tonerLevel,
    paperLevel,
    lastMaintenanceDate,
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
    if (data.containsKey('total_pages_printed')) {
      context.handle(
        _totalPagesPrintedMeta,
        totalPagesPrinted.isAcceptableOrUnknown(
          data['total_pages_printed']!,
          _totalPagesPrintedMeta,
        ),
      );
    }
    if (data.containsKey('toner_level')) {
      context.handle(
        _tonerLevelMeta,
        tonerLevel.isAcceptableOrUnknown(data['toner_level']!, _tonerLevelMeta),
      );
    }
    if (data.containsKey('paper_level')) {
      context.handle(
        _paperLevelMeta,
        paperLevel.isAcceptableOrUnknown(data['paper_level']!, _paperLevelMeta),
      );
    }
    if (data.containsKey('last_maintenance_date')) {
      context.handle(
        _lastMaintenanceDateMeta,
        lastMaintenanceDate.isAcceptableOrUnknown(
          data['last_maintenance_date']!,
          _lastMaintenanceDateMeta,
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
      totalPagesPrinted: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_pages_printed'],
      )!,
      tonerLevel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}toner_level'],
      )!,
      paperLevel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}paper_level'],
      )!,
      lastMaintenanceDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_maintenance_date'],
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
  final int totalPagesPrinted;
  final String tonerLevel;
  final String paperLevel;
  final DateTime? lastMaintenanceDate;
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
    required this.totalPagesPrinted,
    required this.tonerLevel,
    required this.paperLevel,
    this.lastMaintenanceDate,
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
    map['total_pages_printed'] = Variable<int>(totalPagesPrinted);
    map['toner_level'] = Variable<String>(tonerLevel);
    map['paper_level'] = Variable<String>(paperLevel);
    if (!nullToAbsent || lastMaintenanceDate != null) {
      map['last_maintenance_date'] = Variable<DateTime>(lastMaintenanceDate);
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
      totalPagesPrinted: Value(totalPagesPrinted),
      tonerLevel: Value(tonerLevel),
      paperLevel: Value(paperLevel),
      lastMaintenanceDate: lastMaintenanceDate == null && nullToAbsent
          ? const Value.absent()
          : Value(lastMaintenanceDate),
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
      totalPagesPrinted: serializer.fromJson<int>(json['totalPagesPrinted']),
      tonerLevel: serializer.fromJson<String>(json['tonerLevel']),
      paperLevel: serializer.fromJson<String>(json['paperLevel']),
      lastMaintenanceDate: serializer.fromJson<DateTime?>(
        json['lastMaintenanceDate'],
      ),
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
      'totalPagesPrinted': serializer.toJson<int>(totalPagesPrinted),
      'tonerLevel': serializer.toJson<String>(tonerLevel),
      'paperLevel': serializer.toJson<String>(paperLevel),
      'lastMaintenanceDate': serializer.toJson<DateTime?>(lastMaintenanceDate),
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
    int? totalPagesPrinted,
    String? tonerLevel,
    String? paperLevel,
    Value<DateTime?> lastMaintenanceDate = const Value.absent(),
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
    totalPagesPrinted: totalPagesPrinted ?? this.totalPagesPrinted,
    tonerLevel: tonerLevel ?? this.tonerLevel,
    paperLevel: paperLevel ?? this.paperLevel,
    lastMaintenanceDate: lastMaintenanceDate.present
        ? lastMaintenanceDate.value
        : this.lastMaintenanceDate,
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
      totalPagesPrinted: data.totalPagesPrinted.present
          ? data.totalPagesPrinted.value
          : this.totalPagesPrinted,
      tonerLevel: data.tonerLevel.present
          ? data.tonerLevel.value
          : this.tonerLevel,
      paperLevel: data.paperLevel.present
          ? data.paperLevel.value
          : this.paperLevel,
      lastMaintenanceDate: data.lastMaintenanceDate.present
          ? data.lastMaintenanceDate.value
          : this.lastMaintenanceDate,
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
          ..write('totalPagesPrinted: $totalPagesPrinted, ')
          ..write('tonerLevel: $tonerLevel, ')
          ..write('paperLevel: $paperLevel, ')
          ..write('lastMaintenanceDate: $lastMaintenanceDate, ')
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
    totalPagesPrinted,
    tonerLevel,
    paperLevel,
    lastMaintenanceDate,
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
          other.totalPagesPrinted == this.totalPagesPrinted &&
          other.tonerLevel == this.tonerLevel &&
          other.paperLevel == this.paperLevel &&
          other.lastMaintenanceDate == this.lastMaintenanceDate &&
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
  final Value<int> totalPagesPrinted;
  final Value<String> tonerLevel;
  final Value<String> paperLevel;
  final Value<DateTime?> lastMaintenanceDate;
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
    this.totalPagesPrinted = const Value.absent(),
    this.tonerLevel = const Value.absent(),
    this.paperLevel = const Value.absent(),
    this.lastMaintenanceDate = const Value.absent(),
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
    this.totalPagesPrinted = const Value.absent(),
    this.tonerLevel = const Value.absent(),
    this.paperLevel = const Value.absent(),
    this.lastMaintenanceDate = const Value.absent(),
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
    Expression<int>? totalPagesPrinted,
    Expression<String>? tonerLevel,
    Expression<String>? paperLevel,
    Expression<DateTime>? lastMaintenanceDate,
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
      if (totalPagesPrinted != null) 'total_pages_printed': totalPagesPrinted,
      if (tonerLevel != null) 'toner_level': tonerLevel,
      if (paperLevel != null) 'paper_level': paperLevel,
      if (lastMaintenanceDate != null)
        'last_maintenance_date': lastMaintenanceDate,
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
    Value<int>? totalPagesPrinted,
    Value<String>? tonerLevel,
    Value<String>? paperLevel,
    Value<DateTime?>? lastMaintenanceDate,
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
      totalPagesPrinted: totalPagesPrinted ?? this.totalPagesPrinted,
      tonerLevel: tonerLevel ?? this.tonerLevel,
      paperLevel: paperLevel ?? this.paperLevel,
      lastMaintenanceDate: lastMaintenanceDate ?? this.lastMaintenanceDate,
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
    if (totalPagesPrinted.present) {
      map['total_pages_printed'] = Variable<int>(totalPagesPrinted.value);
    }
    if (tonerLevel.present) {
      map['toner_level'] = Variable<String>(tonerLevel.value);
    }
    if (paperLevel.present) {
      map['paper_level'] = Variable<String>(paperLevel.value);
    }
    if (lastMaintenanceDate.present) {
      map['last_maintenance_date'] = Variable<DateTime>(
        lastMaintenanceDate.value,
      );
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
          ..write('totalPagesPrinted: $totalPagesPrinted, ')
          ..write('tonerLevel: $tonerLevel, ')
          ..write('paperLevel: $paperLevel, ')
          ..write('lastMaintenanceDate: $lastMaintenanceDate, ')
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
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _usernameMeta = const VerificationMeta(
    'username',
  );
  @override
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
    'username',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _documentTypeMeta = const VerificationMeta(
    'documentType',
  );
  @override
  late final GeneratedColumn<String> documentType = GeneratedColumn<String>(
    'document_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _departmentMeta = const VerificationMeta(
    'department',
  );
  @override
  late final GeneratedColumn<String> department = GeneratedColumn<String>(
    'department',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _estimatedCostMeta = const VerificationMeta(
    'estimatedCost',
  );
  @override
  late final GeneratedColumn<int> estimatedCost = GeneratedColumn<int>(
    'estimated_cost',
    aliasedName,
    true,
    type: DriftSqlType.int,
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
    userId,
    username,
    documentType,
    department,
    estimatedCost,
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
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    }
    if (data.containsKey('username')) {
      context.handle(
        _usernameMeta,
        username.isAcceptableOrUnknown(data['username']!, _usernameMeta),
      );
    }
    if (data.containsKey('document_type')) {
      context.handle(
        _documentTypeMeta,
        documentType.isAcceptableOrUnknown(
          data['document_type']!,
          _documentTypeMeta,
        ),
      );
    }
    if (data.containsKey('department')) {
      context.handle(
        _departmentMeta,
        department.isAcceptableOrUnknown(data['department']!, _departmentMeta),
      );
    }
    if (data.containsKey('estimated_cost')) {
      context.handle(
        _estimatedCostMeta,
        estimatedCost.isAcceptableOrUnknown(
          data['estimated_cost']!,
          _estimatedCostMeta,
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
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      ),
      username: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}username'],
      ),
      documentType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}document_type'],
      ),
      department: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}department'],
      ),
      estimatedCost: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}estimated_cost'],
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
  final String? userId;
  final String? username;
  final String? documentType;
  final String? department;
  final int? estimatedCost;
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
    this.userId,
    this.username,
    this.documentType,
    this.department,
    this.estimatedCost,
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
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<String>(userId);
    }
    if (!nullToAbsent || username != null) {
      map['username'] = Variable<String>(username);
    }
    if (!nullToAbsent || documentType != null) {
      map['document_type'] = Variable<String>(documentType);
    }
    if (!nullToAbsent || department != null) {
      map['department'] = Variable<String>(department);
    }
    if (!nullToAbsent || estimatedCost != null) {
      map['estimated_cost'] = Variable<int>(estimatedCost);
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
      userId: userId == null && nullToAbsent
          ? const Value.absent()
          : Value(userId),
      username: username == null && nullToAbsent
          ? const Value.absent()
          : Value(username),
      documentType: documentType == null && nullToAbsent
          ? const Value.absent()
          : Value(documentType),
      department: department == null && nullToAbsent
          ? const Value.absent()
          : Value(department),
      estimatedCost: estimatedCost == null && nullToAbsent
          ? const Value.absent()
          : Value(estimatedCost),
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
      userId: serializer.fromJson<String?>(json['userId']),
      username: serializer.fromJson<String?>(json['username']),
      documentType: serializer.fromJson<String?>(json['documentType']),
      department: serializer.fromJson<String?>(json['department']),
      estimatedCost: serializer.fromJson<int?>(json['estimatedCost']),
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
      'userId': serializer.toJson<String?>(userId),
      'username': serializer.toJson<String?>(username),
      'documentType': serializer.toJson<String?>(documentType),
      'department': serializer.toJson<String?>(department),
      'estimatedCost': serializer.toJson<int?>(estimatedCost),
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
    Value<String?> userId = const Value.absent(),
    Value<String?> username = const Value.absent(),
    Value<String?> documentType = const Value.absent(),
    Value<String?> department = const Value.absent(),
    Value<int?> estimatedCost = const Value.absent(),
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
    userId: userId.present ? userId.value : this.userId,
    username: username.present ? username.value : this.username,
    documentType: documentType.present ? documentType.value : this.documentType,
    department: department.present ? department.value : this.department,
    estimatedCost: estimatedCost.present
        ? estimatedCost.value
        : this.estimatedCost,
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
      userId: data.userId.present ? data.userId.value : this.userId,
      username: data.username.present ? data.username.value : this.username,
      documentType: data.documentType.present
          ? data.documentType.value
          : this.documentType,
      department: data.department.present
          ? data.department.value
          : this.department,
      estimatedCost: data.estimatedCost.present
          ? data.estimatedCost.value
          : this.estimatedCost,
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
          ..write('errorMessage: $errorMessage, ')
          ..write('userId: $userId, ')
          ..write('username: $username, ')
          ..write('documentType: $documentType, ')
          ..write('department: $department, ')
          ..write('estimatedCost: $estimatedCost')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
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
    userId,
    username,
    documentType,
    department,
    estimatedCost,
  ]);
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
          other.errorMessage == this.errorMessage &&
          other.userId == this.userId &&
          other.username == this.username &&
          other.documentType == this.documentType &&
          other.department == this.department &&
          other.estimatedCost == this.estimatedCost);
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
  final Value<String?> userId;
  final Value<String?> username;
  final Value<String?> documentType;
  final Value<String?> department;
  final Value<int?> estimatedCost;
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
    this.userId = const Value.absent(),
    this.username = const Value.absent(),
    this.documentType = const Value.absent(),
    this.department = const Value.absent(),
    this.estimatedCost = const Value.absent(),
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
    this.userId = const Value.absent(),
    this.username = const Value.absent(),
    this.documentType = const Value.absent(),
    this.department = const Value.absent(),
    this.estimatedCost = const Value.absent(),
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
    Expression<String>? userId,
    Expression<String>? username,
    Expression<String>? documentType,
    Expression<String>? department,
    Expression<int>? estimatedCost,
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
      if (userId != null) 'user_id': userId,
      if (username != null) 'username': username,
      if (documentType != null) 'document_type': documentType,
      if (department != null) 'department': department,
      if (estimatedCost != null) 'estimated_cost': estimatedCost,
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
    Value<String?>? userId,
    Value<String?>? username,
    Value<String?>? documentType,
    Value<String?>? department,
    Value<int?>? estimatedCost,
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
      userId: userId ?? this.userId,
      username: username ?? this.username,
      documentType: documentType ?? this.documentType,
      department: department ?? this.department,
      estimatedCost: estimatedCost ?? this.estimatedCost,
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
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (documentType.present) {
      map['document_type'] = Variable<String>(documentType.value);
    }
    if (department.present) {
      map['department'] = Variable<String>(department.value);
    }
    if (estimatedCost.present) {
      map['estimated_cost'] = Variable<int>(estimatedCost.value);
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
          ..write('userId: $userId, ')
          ..write('username: $username, ')
          ..write('documentType: $documentType, ')
          ..write('department: $department, ')
          ..write('estimatedCost: $estimatedCost, ')
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

class $UsersTable extends Users with TableInfo<$UsersTable, UserData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
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
  static const VerificationMeta _displayNameMeta = const VerificationMeta(
    'displayName',
  );
  @override
  late final GeneratedColumn<String> displayName = GeneratedColumn<String>(
    'display_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _departmentMeta = const VerificationMeta(
    'department',
  );
  @override
  late final GeneratedColumn<String> department = GeneratedColumn<String>(
    'department',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _groupIdsMeta = const VerificationMeta(
    'groupIds',
  );
  @override
  late final GeneratedColumn<String> groupIds = GeneratedColumn<String>(
    'group_ids',
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
  @override
  List<GeneratedColumn> get $columns => [
    id,
    username,
    displayName,
    department,
    email,
    groupIds,
    createdAt,
    lastSeen,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('username')) {
      context.handle(
        _usernameMeta,
        username.isAcceptableOrUnknown(data['username']!, _usernameMeta),
      );
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('display_name')) {
      context.handle(
        _displayNameMeta,
        displayName.isAcceptableOrUnknown(
          data['display_name']!,
          _displayNameMeta,
        ),
      );
    }
    if (data.containsKey('department')) {
      context.handle(
        _departmentMeta,
        department.isAcceptableOrUnknown(data['department']!, _departmentMeta),
      );
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    }
    if (data.containsKey('group_ids')) {
      context.handle(
        _groupIdsMeta,
        groupIds.isAcceptableOrUnknown(data['group_ids']!, _groupIdsMeta),
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
    if (data.containsKey('last_seen')) {
      context.handle(
        _lastSeenMeta,
        lastSeen.isAcceptableOrUnknown(data['last_seen']!, _lastSeenMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      username: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}username'],
      )!,
      displayName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}display_name'],
      ),
      department: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}department'],
      ),
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      ),
      groupIds: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}group_ids'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      lastSeen: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_seen'],
      ),
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class UserData extends DataClass implements Insertable<UserData> {
  final String id;
  final String username;
  final String? displayName;
  final String? department;
  final String? email;
  final String groupIds;
  final DateTime createdAt;
  final DateTime? lastSeen;
  const UserData({
    required this.id,
    required this.username,
    this.displayName,
    this.department,
    this.email,
    required this.groupIds,
    required this.createdAt,
    this.lastSeen,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['username'] = Variable<String>(username);
    if (!nullToAbsent || displayName != null) {
      map['display_name'] = Variable<String>(displayName);
    }
    if (!nullToAbsent || department != null) {
      map['department'] = Variable<String>(department);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    map['group_ids'] = Variable<String>(groupIds);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || lastSeen != null) {
      map['last_seen'] = Variable<DateTime>(lastSeen);
    }
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      username: Value(username),
      displayName: displayName == null && nullToAbsent
          ? const Value.absent()
          : Value(displayName),
      department: department == null && nullToAbsent
          ? const Value.absent()
          : Value(department),
      email: email == null && nullToAbsent
          ? const Value.absent()
          : Value(email),
      groupIds: Value(groupIds),
      createdAt: Value(createdAt),
      lastSeen: lastSeen == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSeen),
    );
  }

  factory UserData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserData(
      id: serializer.fromJson<String>(json['id']),
      username: serializer.fromJson<String>(json['username']),
      displayName: serializer.fromJson<String?>(json['displayName']),
      department: serializer.fromJson<String?>(json['department']),
      email: serializer.fromJson<String?>(json['email']),
      groupIds: serializer.fromJson<String>(json['groupIds']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      lastSeen: serializer.fromJson<DateTime?>(json['lastSeen']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'username': serializer.toJson<String>(username),
      'displayName': serializer.toJson<String?>(displayName),
      'department': serializer.toJson<String?>(department),
      'email': serializer.toJson<String?>(email),
      'groupIds': serializer.toJson<String>(groupIds),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'lastSeen': serializer.toJson<DateTime?>(lastSeen),
    };
  }

  UserData copyWith({
    String? id,
    String? username,
    Value<String?> displayName = const Value.absent(),
    Value<String?> department = const Value.absent(),
    Value<String?> email = const Value.absent(),
    String? groupIds,
    DateTime? createdAt,
    Value<DateTime?> lastSeen = const Value.absent(),
  }) => UserData(
    id: id ?? this.id,
    username: username ?? this.username,
    displayName: displayName.present ? displayName.value : this.displayName,
    department: department.present ? department.value : this.department,
    email: email.present ? email.value : this.email,
    groupIds: groupIds ?? this.groupIds,
    createdAt: createdAt ?? this.createdAt,
    lastSeen: lastSeen.present ? lastSeen.value : this.lastSeen,
  );
  UserData copyWithCompanion(UsersCompanion data) {
    return UserData(
      id: data.id.present ? data.id.value : this.id,
      username: data.username.present ? data.username.value : this.username,
      displayName: data.displayName.present
          ? data.displayName.value
          : this.displayName,
      department: data.department.present
          ? data.department.value
          : this.department,
      email: data.email.present ? data.email.value : this.email,
      groupIds: data.groupIds.present ? data.groupIds.value : this.groupIds,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      lastSeen: data.lastSeen.present ? data.lastSeen.value : this.lastSeen,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserData(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('displayName: $displayName, ')
          ..write('department: $department, ')
          ..write('email: $email, ')
          ..write('groupIds: $groupIds, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastSeen: $lastSeen')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    username,
    displayName,
    department,
    email,
    groupIds,
    createdAt,
    lastSeen,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserData &&
          other.id == this.id &&
          other.username == this.username &&
          other.displayName == this.displayName &&
          other.department == this.department &&
          other.email == this.email &&
          other.groupIds == this.groupIds &&
          other.createdAt == this.createdAt &&
          other.lastSeen == this.lastSeen);
}

class UsersCompanion extends UpdateCompanion<UserData> {
  final Value<String> id;
  final Value<String> username;
  final Value<String?> displayName;
  final Value<String?> department;
  final Value<String?> email;
  final Value<String> groupIds;
  final Value<DateTime> createdAt;
  final Value<DateTime?> lastSeen;
  final Value<int> rowid;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.username = const Value.absent(),
    this.displayName = const Value.absent(),
    this.department = const Value.absent(),
    this.email = const Value.absent(),
    this.groupIds = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.lastSeen = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UsersCompanion.insert({
    required String id,
    required String username,
    this.displayName = const Value.absent(),
    this.department = const Value.absent(),
    this.email = const Value.absent(),
    this.groupIds = const Value.absent(),
    required DateTime createdAt,
    this.lastSeen = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       username = Value(username),
       createdAt = Value(createdAt);
  static Insertable<UserData> custom({
    Expression<String>? id,
    Expression<String>? username,
    Expression<String>? displayName,
    Expression<String>? department,
    Expression<String>? email,
    Expression<String>? groupIds,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? lastSeen,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (username != null) 'username': username,
      if (displayName != null) 'display_name': displayName,
      if (department != null) 'department': department,
      if (email != null) 'email': email,
      if (groupIds != null) 'group_ids': groupIds,
      if (createdAt != null) 'created_at': createdAt,
      if (lastSeen != null) 'last_seen': lastSeen,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UsersCompanion copyWith({
    Value<String>? id,
    Value<String>? username,
    Value<String?>? displayName,
    Value<String?>? department,
    Value<String?>? email,
    Value<String>? groupIds,
    Value<DateTime>? createdAt,
    Value<DateTime?>? lastSeen,
    Value<int>? rowid,
  }) {
    return UsersCompanion(
      id: id ?? this.id,
      username: username ?? this.username,
      displayName: displayName ?? this.displayName,
      department: department ?? this.department,
      email: email ?? this.email,
      groupIds: groupIds ?? this.groupIds,
      createdAt: createdAt ?? this.createdAt,
      lastSeen: lastSeen ?? this.lastSeen,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (displayName.present) {
      map['display_name'] = Variable<String>(displayName.value);
    }
    if (department.present) {
      map['department'] = Variable<String>(department.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (groupIds.present) {
      map['group_ids'] = Variable<String>(groupIds.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (lastSeen.present) {
      map['last_seen'] = Variable<DateTime>(lastSeen.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('displayName: $displayName, ')
          ..write('department: $department, ')
          ..write('email: $email, ')
          ..write('groupIds: $groupIds, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastSeen: $lastSeen, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PrinterSuppliesTable extends PrinterSupplies
    with TableInfo<$PrinterSuppliesTable, PrinterSupplyData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PrinterSuppliesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _printerIdMeta = const VerificationMeta(
    'printerId',
  );
  @override
  late final GeneratedColumn<String> printerId = GeneratedColumn<String>(
    'printer_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _supplyTypeMeta = const VerificationMeta(
    'supplyType',
  );
  @override
  late final GeneratedColumn<String> supplyType = GeneratedColumn<String>(
    'supply_type',
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
  static const VerificationMeta _unitMeta = const VerificationMeta('unit');
  @override
  late final GeneratedColumn<String> unit = GeneratedColumn<String>(
    'unit',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastCheckedMeta = const VerificationMeta(
    'lastChecked',
  );
  @override
  late final GeneratedColumn<DateTime> lastChecked = GeneratedColumn<DateTime>(
    'last_checked',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    printerId,
    supplyType,
    level,
    unit,
    lastChecked,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'printer_supplies';
  @override
  VerificationContext validateIntegrity(
    Insertable<PrinterSupplyData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('printer_id')) {
      context.handle(
        _printerIdMeta,
        printerId.isAcceptableOrUnknown(data['printer_id']!, _printerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_printerIdMeta);
    }
    if (data.containsKey('supply_type')) {
      context.handle(
        _supplyTypeMeta,
        supplyType.isAcceptableOrUnknown(data['supply_type']!, _supplyTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_supplyTypeMeta);
    }
    if (data.containsKey('level')) {
      context.handle(
        _levelMeta,
        level.isAcceptableOrUnknown(data['level']!, _levelMeta),
      );
    } else if (isInserting) {
      context.missing(_levelMeta);
    }
    if (data.containsKey('unit')) {
      context.handle(
        _unitMeta,
        unit.isAcceptableOrUnknown(data['unit']!, _unitMeta),
      );
    } else if (isInserting) {
      context.missing(_unitMeta);
    }
    if (data.containsKey('last_checked')) {
      context.handle(
        _lastCheckedMeta,
        lastChecked.isAcceptableOrUnknown(
          data['last_checked']!,
          _lastCheckedMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_lastCheckedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PrinterSupplyData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PrinterSupplyData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      printerId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}printer_id'],
      )!,
      supplyType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}supply_type'],
      )!,
      level: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}level'],
      )!,
      unit: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}unit'],
      )!,
      lastChecked: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_checked'],
      )!,
    );
  }

  @override
  $PrinterSuppliesTable createAlias(String alias) {
    return $PrinterSuppliesTable(attachedDatabase, alias);
  }
}

class PrinterSupplyData extends DataClass
    implements Insertable<PrinterSupplyData> {
  final String id;
  final String printerId;
  final String supplyType;
  final int level;
  final String unit;
  final DateTime lastChecked;
  const PrinterSupplyData({
    required this.id,
    required this.printerId,
    required this.supplyType,
    required this.level,
    required this.unit,
    required this.lastChecked,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['printer_id'] = Variable<String>(printerId);
    map['supply_type'] = Variable<String>(supplyType);
    map['level'] = Variable<int>(level);
    map['unit'] = Variable<String>(unit);
    map['last_checked'] = Variable<DateTime>(lastChecked);
    return map;
  }

  PrinterSuppliesCompanion toCompanion(bool nullToAbsent) {
    return PrinterSuppliesCompanion(
      id: Value(id),
      printerId: Value(printerId),
      supplyType: Value(supplyType),
      level: Value(level),
      unit: Value(unit),
      lastChecked: Value(lastChecked),
    );
  }

  factory PrinterSupplyData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PrinterSupplyData(
      id: serializer.fromJson<String>(json['id']),
      printerId: serializer.fromJson<String>(json['printerId']),
      supplyType: serializer.fromJson<String>(json['supplyType']),
      level: serializer.fromJson<int>(json['level']),
      unit: serializer.fromJson<String>(json['unit']),
      lastChecked: serializer.fromJson<DateTime>(json['lastChecked']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'printerId': serializer.toJson<String>(printerId),
      'supplyType': serializer.toJson<String>(supplyType),
      'level': serializer.toJson<int>(level),
      'unit': serializer.toJson<String>(unit),
      'lastChecked': serializer.toJson<DateTime>(lastChecked),
    };
  }

  PrinterSupplyData copyWith({
    String? id,
    String? printerId,
    String? supplyType,
    int? level,
    String? unit,
    DateTime? lastChecked,
  }) => PrinterSupplyData(
    id: id ?? this.id,
    printerId: printerId ?? this.printerId,
    supplyType: supplyType ?? this.supplyType,
    level: level ?? this.level,
    unit: unit ?? this.unit,
    lastChecked: lastChecked ?? this.lastChecked,
  );
  PrinterSupplyData copyWithCompanion(PrinterSuppliesCompanion data) {
    return PrinterSupplyData(
      id: data.id.present ? data.id.value : this.id,
      printerId: data.printerId.present ? data.printerId.value : this.printerId,
      supplyType: data.supplyType.present
          ? data.supplyType.value
          : this.supplyType,
      level: data.level.present ? data.level.value : this.level,
      unit: data.unit.present ? data.unit.value : this.unit,
      lastChecked: data.lastChecked.present
          ? data.lastChecked.value
          : this.lastChecked,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PrinterSupplyData(')
          ..write('id: $id, ')
          ..write('printerId: $printerId, ')
          ..write('supplyType: $supplyType, ')
          ..write('level: $level, ')
          ..write('unit: $unit, ')
          ..write('lastChecked: $lastChecked')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, printerId, supplyType, level, unit, lastChecked);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PrinterSupplyData &&
          other.id == this.id &&
          other.printerId == this.printerId &&
          other.supplyType == this.supplyType &&
          other.level == this.level &&
          other.unit == this.unit &&
          other.lastChecked == this.lastChecked);
}

class PrinterSuppliesCompanion extends UpdateCompanion<PrinterSupplyData> {
  final Value<String> id;
  final Value<String> printerId;
  final Value<String> supplyType;
  final Value<int> level;
  final Value<String> unit;
  final Value<DateTime> lastChecked;
  final Value<int> rowid;
  const PrinterSuppliesCompanion({
    this.id = const Value.absent(),
    this.printerId = const Value.absent(),
    this.supplyType = const Value.absent(),
    this.level = const Value.absent(),
    this.unit = const Value.absent(),
    this.lastChecked = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PrinterSuppliesCompanion.insert({
    required String id,
    required String printerId,
    required String supplyType,
    required int level,
    required String unit,
    required DateTime lastChecked,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       printerId = Value(printerId),
       supplyType = Value(supplyType),
       level = Value(level),
       unit = Value(unit),
       lastChecked = Value(lastChecked);
  static Insertable<PrinterSupplyData> custom({
    Expression<String>? id,
    Expression<String>? printerId,
    Expression<String>? supplyType,
    Expression<int>? level,
    Expression<String>? unit,
    Expression<DateTime>? lastChecked,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (printerId != null) 'printer_id': printerId,
      if (supplyType != null) 'supply_type': supplyType,
      if (level != null) 'level': level,
      if (unit != null) 'unit': unit,
      if (lastChecked != null) 'last_checked': lastChecked,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PrinterSuppliesCompanion copyWith({
    Value<String>? id,
    Value<String>? printerId,
    Value<String>? supplyType,
    Value<int>? level,
    Value<String>? unit,
    Value<DateTime>? lastChecked,
    Value<int>? rowid,
  }) {
    return PrinterSuppliesCompanion(
      id: id ?? this.id,
      printerId: printerId ?? this.printerId,
      supplyType: supplyType ?? this.supplyType,
      level: level ?? this.level,
      unit: unit ?? this.unit,
      lastChecked: lastChecked ?? this.lastChecked,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (printerId.present) {
      map['printer_id'] = Variable<String>(printerId.value);
    }
    if (supplyType.present) {
      map['supply_type'] = Variable<String>(supplyType.value);
    }
    if (level.present) {
      map['level'] = Variable<int>(level.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(unit.value);
    }
    if (lastChecked.present) {
      map['last_checked'] = Variable<DateTime>(lastChecked.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PrinterSuppliesCompanion(')
          ..write('id: $id, ')
          ..write('printerId: $printerId, ')
          ..write('supplyType: $supplyType, ')
          ..write('level: $level, ')
          ..write('unit: $unit, ')
          ..write('lastChecked: $lastChecked, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PrinterMaintenancesTable extends PrinterMaintenances
    with TableInfo<$PrinterMaintenancesTable, PrinterMaintenanceData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PrinterMaintenancesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _printerIdMeta = const VerificationMeta(
    'printerId',
  );
  @override
  late final GeneratedColumn<String> printerId = GeneratedColumn<String>(
    'printer_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _maintenanceTypeMeta = const VerificationMeta(
    'maintenanceType',
  );
  @override
  late final GeneratedColumn<String> maintenanceType = GeneratedColumn<String>(
    'maintenance_type',
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
  static const VerificationMeta _performedByMeta = const VerificationMeta(
    'performedBy',
  );
  @override
  late final GeneratedColumn<String> performedBy = GeneratedColumn<String>(
    'performed_by',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _performedAtMeta = const VerificationMeta(
    'performedAt',
  );
  @override
  late final GeneratedColumn<DateTime> performedAt = GeneratedColumn<DateTime>(
    'performed_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    printerId,
    maintenanceType,
    description,
    performedBy,
    performedAt,
    notes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'printer_maintenances';
  @override
  VerificationContext validateIntegrity(
    Insertable<PrinterMaintenanceData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('printer_id')) {
      context.handle(
        _printerIdMeta,
        printerId.isAcceptableOrUnknown(data['printer_id']!, _printerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_printerIdMeta);
    }
    if (data.containsKey('maintenance_type')) {
      context.handle(
        _maintenanceTypeMeta,
        maintenanceType.isAcceptableOrUnknown(
          data['maintenance_type']!,
          _maintenanceTypeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_maintenanceTypeMeta);
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
    if (data.containsKey('performed_by')) {
      context.handle(
        _performedByMeta,
        performedBy.isAcceptableOrUnknown(
          data['performed_by']!,
          _performedByMeta,
        ),
      );
    }
    if (data.containsKey('performed_at')) {
      context.handle(
        _performedAtMeta,
        performedAt.isAcceptableOrUnknown(
          data['performed_at']!,
          _performedAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_performedAtMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PrinterMaintenanceData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PrinterMaintenanceData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      printerId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}printer_id'],
      )!,
      maintenanceType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}maintenance_type'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      performedBy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}performed_by'],
      ),
      performedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}performed_at'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
    );
  }

  @override
  $PrinterMaintenancesTable createAlias(String alias) {
    return $PrinterMaintenancesTable(attachedDatabase, alias);
  }
}

class PrinterMaintenanceData extends DataClass
    implements Insertable<PrinterMaintenanceData> {
  final String id;
  final String printerId;
  final String maintenanceType;
  final String? description;
  final String? performedBy;
  final DateTime performedAt;
  final String? notes;
  const PrinterMaintenanceData({
    required this.id,
    required this.printerId,
    required this.maintenanceType,
    this.description,
    this.performedBy,
    required this.performedAt,
    this.notes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['printer_id'] = Variable<String>(printerId);
    map['maintenance_type'] = Variable<String>(maintenanceType);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || performedBy != null) {
      map['performed_by'] = Variable<String>(performedBy);
    }
    map['performed_at'] = Variable<DateTime>(performedAt);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  PrinterMaintenancesCompanion toCompanion(bool nullToAbsent) {
    return PrinterMaintenancesCompanion(
      id: Value(id),
      printerId: Value(printerId),
      maintenanceType: Value(maintenanceType),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      performedBy: performedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(performedBy),
      performedAt: Value(performedAt),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
    );
  }

  factory PrinterMaintenanceData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PrinterMaintenanceData(
      id: serializer.fromJson<String>(json['id']),
      printerId: serializer.fromJson<String>(json['printerId']),
      maintenanceType: serializer.fromJson<String>(json['maintenanceType']),
      description: serializer.fromJson<String?>(json['description']),
      performedBy: serializer.fromJson<String?>(json['performedBy']),
      performedAt: serializer.fromJson<DateTime>(json['performedAt']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'printerId': serializer.toJson<String>(printerId),
      'maintenanceType': serializer.toJson<String>(maintenanceType),
      'description': serializer.toJson<String?>(description),
      'performedBy': serializer.toJson<String?>(performedBy),
      'performedAt': serializer.toJson<DateTime>(performedAt),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  PrinterMaintenanceData copyWith({
    String? id,
    String? printerId,
    String? maintenanceType,
    Value<String?> description = const Value.absent(),
    Value<String?> performedBy = const Value.absent(),
    DateTime? performedAt,
    Value<String?> notes = const Value.absent(),
  }) => PrinterMaintenanceData(
    id: id ?? this.id,
    printerId: printerId ?? this.printerId,
    maintenanceType: maintenanceType ?? this.maintenanceType,
    description: description.present ? description.value : this.description,
    performedBy: performedBy.present ? performedBy.value : this.performedBy,
    performedAt: performedAt ?? this.performedAt,
    notes: notes.present ? notes.value : this.notes,
  );
  PrinterMaintenanceData copyWithCompanion(PrinterMaintenancesCompanion data) {
    return PrinterMaintenanceData(
      id: data.id.present ? data.id.value : this.id,
      printerId: data.printerId.present ? data.printerId.value : this.printerId,
      maintenanceType: data.maintenanceType.present
          ? data.maintenanceType.value
          : this.maintenanceType,
      description: data.description.present
          ? data.description.value
          : this.description,
      performedBy: data.performedBy.present
          ? data.performedBy.value
          : this.performedBy,
      performedAt: data.performedAt.present
          ? data.performedAt.value
          : this.performedAt,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PrinterMaintenanceData(')
          ..write('id: $id, ')
          ..write('printerId: $printerId, ')
          ..write('maintenanceType: $maintenanceType, ')
          ..write('description: $description, ')
          ..write('performedBy: $performedBy, ')
          ..write('performedAt: $performedAt, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    printerId,
    maintenanceType,
    description,
    performedBy,
    performedAt,
    notes,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PrinterMaintenanceData &&
          other.id == this.id &&
          other.printerId == this.printerId &&
          other.maintenanceType == this.maintenanceType &&
          other.description == this.description &&
          other.performedBy == this.performedBy &&
          other.performedAt == this.performedAt &&
          other.notes == this.notes);
}

class PrinterMaintenancesCompanion
    extends UpdateCompanion<PrinterMaintenanceData> {
  final Value<String> id;
  final Value<String> printerId;
  final Value<String> maintenanceType;
  final Value<String?> description;
  final Value<String?> performedBy;
  final Value<DateTime> performedAt;
  final Value<String?> notes;
  final Value<int> rowid;
  const PrinterMaintenancesCompanion({
    this.id = const Value.absent(),
    this.printerId = const Value.absent(),
    this.maintenanceType = const Value.absent(),
    this.description = const Value.absent(),
    this.performedBy = const Value.absent(),
    this.performedAt = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PrinterMaintenancesCompanion.insert({
    required String id,
    required String printerId,
    required String maintenanceType,
    this.description = const Value.absent(),
    this.performedBy = const Value.absent(),
    required DateTime performedAt,
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       printerId = Value(printerId),
       maintenanceType = Value(maintenanceType),
       performedAt = Value(performedAt);
  static Insertable<PrinterMaintenanceData> custom({
    Expression<String>? id,
    Expression<String>? printerId,
    Expression<String>? maintenanceType,
    Expression<String>? description,
    Expression<String>? performedBy,
    Expression<DateTime>? performedAt,
    Expression<String>? notes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (printerId != null) 'printer_id': printerId,
      if (maintenanceType != null) 'maintenance_type': maintenanceType,
      if (description != null) 'description': description,
      if (performedBy != null) 'performed_by': performedBy,
      if (performedAt != null) 'performed_at': performedAt,
      if (notes != null) 'notes': notes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PrinterMaintenancesCompanion copyWith({
    Value<String>? id,
    Value<String>? printerId,
    Value<String>? maintenanceType,
    Value<String?>? description,
    Value<String?>? performedBy,
    Value<DateTime>? performedAt,
    Value<String?>? notes,
    Value<int>? rowid,
  }) {
    return PrinterMaintenancesCompanion(
      id: id ?? this.id,
      printerId: printerId ?? this.printerId,
      maintenanceType: maintenanceType ?? this.maintenanceType,
      description: description ?? this.description,
      performedBy: performedBy ?? this.performedBy,
      performedAt: performedAt ?? this.performedAt,
      notes: notes ?? this.notes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (printerId.present) {
      map['printer_id'] = Variable<String>(printerId.value);
    }
    if (maintenanceType.present) {
      map['maintenance_type'] = Variable<String>(maintenanceType.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (performedBy.present) {
      map['performed_by'] = Variable<String>(performedBy.value);
    }
    if (performedAt.present) {
      map['performed_at'] = Variable<DateTime>(performedAt.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PrinterMaintenancesCompanion(')
          ..write('id: $id, ')
          ..write('printerId: $printerId, ')
          ..write('maintenanceType: $maintenanceType, ')
          ..write('description: $description, ')
          ..write('performedBy: $performedBy, ')
          ..write('performedAt: $performedAt, ')
          ..write('notes: $notes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PrinterCountersTable extends PrinterCounters
    with TableInfo<$PrinterCountersTable, PrinterCounterData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PrinterCountersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _printerIdMeta = const VerificationMeta(
    'printerId',
  );
  @override
  late final GeneratedColumn<String> printerId = GeneratedColumn<String>(
    'printer_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _totalPagesPrintedMeta = const VerificationMeta(
    'totalPagesPrinted',
  );
  @override
  late final GeneratedColumn<int> totalPagesPrinted = GeneratedColumn<int>(
    'total_pages_printed',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _totalJobsProcessedMeta =
      const VerificationMeta('totalJobsProcessed');
  @override
  late final GeneratedColumn<int> totalJobsProcessed = GeneratedColumn<int>(
    'total_jobs_processed',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _totalBytesPrintedMeta = const VerificationMeta(
    'totalBytesPrinted',
  );
  @override
  late final GeneratedColumn<int> totalBytesPrinted = GeneratedColumn<int>(
    'total_bytes_printed',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _lastResetMeta = const VerificationMeta(
    'lastReset',
  );
  @override
  late final GeneratedColumn<DateTime> lastReset = GeneratedColumn<DateTime>(
    'last_reset',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    printerId,
    totalPagesPrinted,
    totalJobsProcessed,
    totalBytesPrinted,
    lastReset,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'printer_counters';
  @override
  VerificationContext validateIntegrity(
    Insertable<PrinterCounterData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('printer_id')) {
      context.handle(
        _printerIdMeta,
        printerId.isAcceptableOrUnknown(data['printer_id']!, _printerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_printerIdMeta);
    }
    if (data.containsKey('total_pages_printed')) {
      context.handle(
        _totalPagesPrintedMeta,
        totalPagesPrinted.isAcceptableOrUnknown(
          data['total_pages_printed']!,
          _totalPagesPrintedMeta,
        ),
      );
    }
    if (data.containsKey('total_jobs_processed')) {
      context.handle(
        _totalJobsProcessedMeta,
        totalJobsProcessed.isAcceptableOrUnknown(
          data['total_jobs_processed']!,
          _totalJobsProcessedMeta,
        ),
      );
    }
    if (data.containsKey('total_bytes_printed')) {
      context.handle(
        _totalBytesPrintedMeta,
        totalBytesPrinted.isAcceptableOrUnknown(
          data['total_bytes_printed']!,
          _totalBytesPrintedMeta,
        ),
      );
    }
    if (data.containsKey('last_reset')) {
      context.handle(
        _lastResetMeta,
        lastReset.isAcceptableOrUnknown(data['last_reset']!, _lastResetMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {printerId};
  @override
  PrinterCounterData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PrinterCounterData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      printerId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}printer_id'],
      )!,
      totalPagesPrinted: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_pages_printed'],
      )!,
      totalJobsProcessed: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_jobs_processed'],
      )!,
      totalBytesPrinted: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_bytes_printed'],
      )!,
      lastReset: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_reset'],
      ),
    );
  }

  @override
  $PrinterCountersTable createAlias(String alias) {
    return $PrinterCountersTable(attachedDatabase, alias);
  }
}

class PrinterCounterData extends DataClass
    implements Insertable<PrinterCounterData> {
  final String id;
  final String printerId;
  final int totalPagesPrinted;
  final int totalJobsProcessed;
  final int totalBytesPrinted;
  final DateTime? lastReset;
  const PrinterCounterData({
    required this.id,
    required this.printerId,
    required this.totalPagesPrinted,
    required this.totalJobsProcessed,
    required this.totalBytesPrinted,
    this.lastReset,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['printer_id'] = Variable<String>(printerId);
    map['total_pages_printed'] = Variable<int>(totalPagesPrinted);
    map['total_jobs_processed'] = Variable<int>(totalJobsProcessed);
    map['total_bytes_printed'] = Variable<int>(totalBytesPrinted);
    if (!nullToAbsent || lastReset != null) {
      map['last_reset'] = Variable<DateTime>(lastReset);
    }
    return map;
  }

  PrinterCountersCompanion toCompanion(bool nullToAbsent) {
    return PrinterCountersCompanion(
      id: Value(id),
      printerId: Value(printerId),
      totalPagesPrinted: Value(totalPagesPrinted),
      totalJobsProcessed: Value(totalJobsProcessed),
      totalBytesPrinted: Value(totalBytesPrinted),
      lastReset: lastReset == null && nullToAbsent
          ? const Value.absent()
          : Value(lastReset),
    );
  }

  factory PrinterCounterData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PrinterCounterData(
      id: serializer.fromJson<String>(json['id']),
      printerId: serializer.fromJson<String>(json['printerId']),
      totalPagesPrinted: serializer.fromJson<int>(json['totalPagesPrinted']),
      totalJobsProcessed: serializer.fromJson<int>(json['totalJobsProcessed']),
      totalBytesPrinted: serializer.fromJson<int>(json['totalBytesPrinted']),
      lastReset: serializer.fromJson<DateTime?>(json['lastReset']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'printerId': serializer.toJson<String>(printerId),
      'totalPagesPrinted': serializer.toJson<int>(totalPagesPrinted),
      'totalJobsProcessed': serializer.toJson<int>(totalJobsProcessed),
      'totalBytesPrinted': serializer.toJson<int>(totalBytesPrinted),
      'lastReset': serializer.toJson<DateTime?>(lastReset),
    };
  }

  PrinterCounterData copyWith({
    String? id,
    String? printerId,
    int? totalPagesPrinted,
    int? totalJobsProcessed,
    int? totalBytesPrinted,
    Value<DateTime?> lastReset = const Value.absent(),
  }) => PrinterCounterData(
    id: id ?? this.id,
    printerId: printerId ?? this.printerId,
    totalPagesPrinted: totalPagesPrinted ?? this.totalPagesPrinted,
    totalJobsProcessed: totalJobsProcessed ?? this.totalJobsProcessed,
    totalBytesPrinted: totalBytesPrinted ?? this.totalBytesPrinted,
    lastReset: lastReset.present ? lastReset.value : this.lastReset,
  );
  PrinterCounterData copyWithCompanion(PrinterCountersCompanion data) {
    return PrinterCounterData(
      id: data.id.present ? data.id.value : this.id,
      printerId: data.printerId.present ? data.printerId.value : this.printerId,
      totalPagesPrinted: data.totalPagesPrinted.present
          ? data.totalPagesPrinted.value
          : this.totalPagesPrinted,
      totalJobsProcessed: data.totalJobsProcessed.present
          ? data.totalJobsProcessed.value
          : this.totalJobsProcessed,
      totalBytesPrinted: data.totalBytesPrinted.present
          ? data.totalBytesPrinted.value
          : this.totalBytesPrinted,
      lastReset: data.lastReset.present ? data.lastReset.value : this.lastReset,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PrinterCounterData(')
          ..write('id: $id, ')
          ..write('printerId: $printerId, ')
          ..write('totalPagesPrinted: $totalPagesPrinted, ')
          ..write('totalJobsProcessed: $totalJobsProcessed, ')
          ..write('totalBytesPrinted: $totalBytesPrinted, ')
          ..write('lastReset: $lastReset')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    printerId,
    totalPagesPrinted,
    totalJobsProcessed,
    totalBytesPrinted,
    lastReset,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PrinterCounterData &&
          other.id == this.id &&
          other.printerId == this.printerId &&
          other.totalPagesPrinted == this.totalPagesPrinted &&
          other.totalJobsProcessed == this.totalJobsProcessed &&
          other.totalBytesPrinted == this.totalBytesPrinted &&
          other.lastReset == this.lastReset);
}

class PrinterCountersCompanion extends UpdateCompanion<PrinterCounterData> {
  final Value<String> id;
  final Value<String> printerId;
  final Value<int> totalPagesPrinted;
  final Value<int> totalJobsProcessed;
  final Value<int> totalBytesPrinted;
  final Value<DateTime?> lastReset;
  final Value<int> rowid;
  const PrinterCountersCompanion({
    this.id = const Value.absent(),
    this.printerId = const Value.absent(),
    this.totalPagesPrinted = const Value.absent(),
    this.totalJobsProcessed = const Value.absent(),
    this.totalBytesPrinted = const Value.absent(),
    this.lastReset = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PrinterCountersCompanion.insert({
    required String id,
    required String printerId,
    this.totalPagesPrinted = const Value.absent(),
    this.totalJobsProcessed = const Value.absent(),
    this.totalBytesPrinted = const Value.absent(),
    this.lastReset = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       printerId = Value(printerId);
  static Insertable<PrinterCounterData> custom({
    Expression<String>? id,
    Expression<String>? printerId,
    Expression<int>? totalPagesPrinted,
    Expression<int>? totalJobsProcessed,
    Expression<int>? totalBytesPrinted,
    Expression<DateTime>? lastReset,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (printerId != null) 'printer_id': printerId,
      if (totalPagesPrinted != null) 'total_pages_printed': totalPagesPrinted,
      if (totalJobsProcessed != null)
        'total_jobs_processed': totalJobsProcessed,
      if (totalBytesPrinted != null) 'total_bytes_printed': totalBytesPrinted,
      if (lastReset != null) 'last_reset': lastReset,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PrinterCountersCompanion copyWith({
    Value<String>? id,
    Value<String>? printerId,
    Value<int>? totalPagesPrinted,
    Value<int>? totalJobsProcessed,
    Value<int>? totalBytesPrinted,
    Value<DateTime?>? lastReset,
    Value<int>? rowid,
  }) {
    return PrinterCountersCompanion(
      id: id ?? this.id,
      printerId: printerId ?? this.printerId,
      totalPagesPrinted: totalPagesPrinted ?? this.totalPagesPrinted,
      totalJobsProcessed: totalJobsProcessed ?? this.totalJobsProcessed,
      totalBytesPrinted: totalBytesPrinted ?? this.totalBytesPrinted,
      lastReset: lastReset ?? this.lastReset,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (printerId.present) {
      map['printer_id'] = Variable<String>(printerId.value);
    }
    if (totalPagesPrinted.present) {
      map['total_pages_printed'] = Variable<int>(totalPagesPrinted.value);
    }
    if (totalJobsProcessed.present) {
      map['total_jobs_processed'] = Variable<int>(totalJobsProcessed.value);
    }
    if (totalBytesPrinted.present) {
      map['total_bytes_printed'] = Variable<int>(totalBytesPrinted.value);
    }
    if (lastReset.present) {
      map['last_reset'] = Variable<DateTime>(lastReset.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PrinterCountersCompanion(')
          ..write('id: $id, ')
          ..write('printerId: $printerId, ')
          ..write('totalPagesPrinted: $totalPagesPrinted, ')
          ..write('totalJobsProcessed: $totalJobsProcessed, ')
          ..write('totalBytesPrinted: $totalBytesPrinted, ')
          ..write('lastReset: $lastReset, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PrinterHealthTableTable extends PrinterHealthTable
    with TableInfo<$PrinterHealthTableTable, PrinterHealthData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PrinterHealthTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _printerIdMeta = const VerificationMeta(
    'printerId',
  );
  @override
  late final GeneratedColumn<String> printerId = GeneratedColumn<String>(
    'printer_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _healthScoreMeta = const VerificationMeta(
    'healthScore',
  );
  @override
  late final GeneratedColumn<int> healthScore = GeneratedColumn<int>(
    'health_score',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _errorRateMeta = const VerificationMeta(
    'errorRate',
  );
  @override
  late final GeneratedColumn<double> errorRate = GeneratedColumn<double>(
    'error_rate',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _availabilityMeta = const VerificationMeta(
    'availability',
  );
  @override
  late final GeneratedColumn<double> availability = GeneratedColumn<double>(
    'availability',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _avgResponseTimeMsMeta = const VerificationMeta(
    'avgResponseTimeMs',
  );
  @override
  late final GeneratedColumn<int> avgResponseTimeMs = GeneratedColumn<int>(
    'avg_response_time_ms',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _supplyScoreMeta = const VerificationMeta(
    'supplyScore',
  );
  @override
  late final GeneratedColumn<int> supplyScore = GeneratedColumn<int>(
    'supply_score',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastCheckMeta = const VerificationMeta(
    'lastCheck',
  );
  @override
  late final GeneratedColumn<DateTime> lastCheck = GeneratedColumn<DateTime>(
    'last_check',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
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
    printerId,
    healthScore,
    errorRate,
    availability,
    avgResponseTimeMs,
    supplyScore,
    lastCheck,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'printer_health_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<PrinterHealthData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('printer_id')) {
      context.handle(
        _printerIdMeta,
        printerId.isAcceptableOrUnknown(data['printer_id']!, _printerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_printerIdMeta);
    }
    if (data.containsKey('health_score')) {
      context.handle(
        _healthScoreMeta,
        healthScore.isAcceptableOrUnknown(
          data['health_score']!,
          _healthScoreMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_healthScoreMeta);
    }
    if (data.containsKey('error_rate')) {
      context.handle(
        _errorRateMeta,
        errorRate.isAcceptableOrUnknown(data['error_rate']!, _errorRateMeta),
      );
    } else if (isInserting) {
      context.missing(_errorRateMeta);
    }
    if (data.containsKey('availability')) {
      context.handle(
        _availabilityMeta,
        availability.isAcceptableOrUnknown(
          data['availability']!,
          _availabilityMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_availabilityMeta);
    }
    if (data.containsKey('avg_response_time_ms')) {
      context.handle(
        _avgResponseTimeMsMeta,
        avgResponseTimeMs.isAcceptableOrUnknown(
          data['avg_response_time_ms']!,
          _avgResponseTimeMsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_avgResponseTimeMsMeta);
    }
    if (data.containsKey('supply_score')) {
      context.handle(
        _supplyScoreMeta,
        supplyScore.isAcceptableOrUnknown(
          data['supply_score']!,
          _supplyScoreMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_supplyScoreMeta);
    }
    if (data.containsKey('last_check')) {
      context.handle(
        _lastCheckMeta,
        lastCheck.isAcceptableOrUnknown(data['last_check']!, _lastCheckMeta),
      );
    } else if (isInserting) {
      context.missing(_lastCheckMeta);
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
  Set<GeneratedColumn> get $primaryKey => {printerId};
  @override
  PrinterHealthData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PrinterHealthData(
      printerId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}printer_id'],
      )!,
      healthScore: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}health_score'],
      )!,
      errorRate: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}error_rate'],
      )!,
      availability: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}availability'],
      )!,
      avgResponseTimeMs: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}avg_response_time_ms'],
      )!,
      supplyScore: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}supply_score'],
      )!,
      lastCheck: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_check'],
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
  $PrinterHealthTableTable createAlias(String alias) {
    return $PrinterHealthTableTable(attachedDatabase, alias);
  }
}

class PrinterHealthData extends DataClass
    implements Insertable<PrinterHealthData> {
  final String printerId;
  final int healthScore;
  final double errorRate;
  final double availability;
  final int avgResponseTimeMs;
  final int supplyScore;
  final DateTime lastCheck;
  final DateTime createdAt;
  final DateTime updatedAt;
  const PrinterHealthData({
    required this.printerId,
    required this.healthScore,
    required this.errorRate,
    required this.availability,
    required this.avgResponseTimeMs,
    required this.supplyScore,
    required this.lastCheck,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['printer_id'] = Variable<String>(printerId);
    map['health_score'] = Variable<int>(healthScore);
    map['error_rate'] = Variable<double>(errorRate);
    map['availability'] = Variable<double>(availability);
    map['avg_response_time_ms'] = Variable<int>(avgResponseTimeMs);
    map['supply_score'] = Variable<int>(supplyScore);
    map['last_check'] = Variable<DateTime>(lastCheck);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  PrinterHealthTableCompanion toCompanion(bool nullToAbsent) {
    return PrinterHealthTableCompanion(
      printerId: Value(printerId),
      healthScore: Value(healthScore),
      errorRate: Value(errorRate),
      availability: Value(availability),
      avgResponseTimeMs: Value(avgResponseTimeMs),
      supplyScore: Value(supplyScore),
      lastCheck: Value(lastCheck),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory PrinterHealthData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PrinterHealthData(
      printerId: serializer.fromJson<String>(json['printerId']),
      healthScore: serializer.fromJson<int>(json['healthScore']),
      errorRate: serializer.fromJson<double>(json['errorRate']),
      availability: serializer.fromJson<double>(json['availability']),
      avgResponseTimeMs: serializer.fromJson<int>(json['avgResponseTimeMs']),
      supplyScore: serializer.fromJson<int>(json['supplyScore']),
      lastCheck: serializer.fromJson<DateTime>(json['lastCheck']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'printerId': serializer.toJson<String>(printerId),
      'healthScore': serializer.toJson<int>(healthScore),
      'errorRate': serializer.toJson<double>(errorRate),
      'availability': serializer.toJson<double>(availability),
      'avgResponseTimeMs': serializer.toJson<int>(avgResponseTimeMs),
      'supplyScore': serializer.toJson<int>(supplyScore),
      'lastCheck': serializer.toJson<DateTime>(lastCheck),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  PrinterHealthData copyWith({
    String? printerId,
    int? healthScore,
    double? errorRate,
    double? availability,
    int? avgResponseTimeMs,
    int? supplyScore,
    DateTime? lastCheck,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => PrinterHealthData(
    printerId: printerId ?? this.printerId,
    healthScore: healthScore ?? this.healthScore,
    errorRate: errorRate ?? this.errorRate,
    availability: availability ?? this.availability,
    avgResponseTimeMs: avgResponseTimeMs ?? this.avgResponseTimeMs,
    supplyScore: supplyScore ?? this.supplyScore,
    lastCheck: lastCheck ?? this.lastCheck,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  PrinterHealthData copyWithCompanion(PrinterHealthTableCompanion data) {
    return PrinterHealthData(
      printerId: data.printerId.present ? data.printerId.value : this.printerId,
      healthScore: data.healthScore.present
          ? data.healthScore.value
          : this.healthScore,
      errorRate: data.errorRate.present ? data.errorRate.value : this.errorRate,
      availability: data.availability.present
          ? data.availability.value
          : this.availability,
      avgResponseTimeMs: data.avgResponseTimeMs.present
          ? data.avgResponseTimeMs.value
          : this.avgResponseTimeMs,
      supplyScore: data.supplyScore.present
          ? data.supplyScore.value
          : this.supplyScore,
      lastCheck: data.lastCheck.present ? data.lastCheck.value : this.lastCheck,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PrinterHealthData(')
          ..write('printerId: $printerId, ')
          ..write('healthScore: $healthScore, ')
          ..write('errorRate: $errorRate, ')
          ..write('availability: $availability, ')
          ..write('avgResponseTimeMs: $avgResponseTimeMs, ')
          ..write('supplyScore: $supplyScore, ')
          ..write('lastCheck: $lastCheck, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    printerId,
    healthScore,
    errorRate,
    availability,
    avgResponseTimeMs,
    supplyScore,
    lastCheck,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PrinterHealthData &&
          other.printerId == this.printerId &&
          other.healthScore == this.healthScore &&
          other.errorRate == this.errorRate &&
          other.availability == this.availability &&
          other.avgResponseTimeMs == this.avgResponseTimeMs &&
          other.supplyScore == this.supplyScore &&
          other.lastCheck == this.lastCheck &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class PrinterHealthTableCompanion extends UpdateCompanion<PrinterHealthData> {
  final Value<String> printerId;
  final Value<int> healthScore;
  final Value<double> errorRate;
  final Value<double> availability;
  final Value<int> avgResponseTimeMs;
  final Value<int> supplyScore;
  final Value<DateTime> lastCheck;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const PrinterHealthTableCompanion({
    this.printerId = const Value.absent(),
    this.healthScore = const Value.absent(),
    this.errorRate = const Value.absent(),
    this.availability = const Value.absent(),
    this.avgResponseTimeMs = const Value.absent(),
    this.supplyScore = const Value.absent(),
    this.lastCheck = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PrinterHealthTableCompanion.insert({
    required String printerId,
    required int healthScore,
    required double errorRate,
    required double availability,
    required int avgResponseTimeMs,
    required int supplyScore,
    required DateTime lastCheck,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : printerId = Value(printerId),
       healthScore = Value(healthScore),
       errorRate = Value(errorRate),
       availability = Value(availability),
       avgResponseTimeMs = Value(avgResponseTimeMs),
       supplyScore = Value(supplyScore),
       lastCheck = Value(lastCheck),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<PrinterHealthData> custom({
    Expression<String>? printerId,
    Expression<int>? healthScore,
    Expression<double>? errorRate,
    Expression<double>? availability,
    Expression<int>? avgResponseTimeMs,
    Expression<int>? supplyScore,
    Expression<DateTime>? lastCheck,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (printerId != null) 'printer_id': printerId,
      if (healthScore != null) 'health_score': healthScore,
      if (errorRate != null) 'error_rate': errorRate,
      if (availability != null) 'availability': availability,
      if (avgResponseTimeMs != null) 'avg_response_time_ms': avgResponseTimeMs,
      if (supplyScore != null) 'supply_score': supplyScore,
      if (lastCheck != null) 'last_check': lastCheck,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PrinterHealthTableCompanion copyWith({
    Value<String>? printerId,
    Value<int>? healthScore,
    Value<double>? errorRate,
    Value<double>? availability,
    Value<int>? avgResponseTimeMs,
    Value<int>? supplyScore,
    Value<DateTime>? lastCheck,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return PrinterHealthTableCompanion(
      printerId: printerId ?? this.printerId,
      healthScore: healthScore ?? this.healthScore,
      errorRate: errorRate ?? this.errorRate,
      availability: availability ?? this.availability,
      avgResponseTimeMs: avgResponseTimeMs ?? this.avgResponseTimeMs,
      supplyScore: supplyScore ?? this.supplyScore,
      lastCheck: lastCheck ?? this.lastCheck,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (printerId.present) {
      map['printer_id'] = Variable<String>(printerId.value);
    }
    if (healthScore.present) {
      map['health_score'] = Variable<int>(healthScore.value);
    }
    if (errorRate.present) {
      map['error_rate'] = Variable<double>(errorRate.value);
    }
    if (availability.present) {
      map['availability'] = Variable<double>(availability.value);
    }
    if (avgResponseTimeMs.present) {
      map['avg_response_time_ms'] = Variable<int>(avgResponseTimeMs.value);
    }
    if (supplyScore.present) {
      map['supply_score'] = Variable<int>(supplyScore.value);
    }
    if (lastCheck.present) {
      map['last_check'] = Variable<DateTime>(lastCheck.value);
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
    return (StringBuffer('PrinterHealthTableCompanion(')
          ..write('printerId: $printerId, ')
          ..write('healthScore: $healthScore, ')
          ..write('errorRate: $errorRate, ')
          ..write('availability: $availability, ')
          ..write('avgResponseTimeMs: $avgResponseTimeMs, ')
          ..write('supplyScore: $supplyScore, ')
          ..write('lastCheck: $lastCheck, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AlertRulesTableTable extends AlertRulesTable
    with TableInfo<$AlertRulesTableTable, AlertRuleData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AlertRulesTableTable(this.attachedDatabase, [this._alias]);
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
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<int> type = GeneratedColumn<int>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.int,
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
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _severityMeta = const VerificationMeta(
    'severity',
  );
  @override
  late final GeneratedColumn<int> severity = GeneratedColumn<int>(
    'severity',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _thresholdsMeta = const VerificationMeta(
    'thresholds',
  );
  @override
  late final GeneratedColumn<String> thresholds = GeneratedColumn<String>(
    'thresholds',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _actionsMeta = const VerificationMeta(
    'actions',
  );
  @override
  late final GeneratedColumn<String> actions = GeneratedColumn<String>(
    'actions',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _suppressionTimeMinutesMeta =
      const VerificationMeta('suppressionTimeMinutes');
  @override
  late final GeneratedColumn<int> suppressionTimeMinutes = GeneratedColumn<int>(
    'suppression_time_minutes',
    aliasedName,
    true,
    type: DriftSqlType.int,
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
    description,
    type,
    enabled,
    severity,
    thresholds,
    actions,
    suppressionTimeMinutes,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'alert_rules_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<AlertRuleData> instance, {
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
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('enabled')) {
      context.handle(
        _enabledMeta,
        enabled.isAcceptableOrUnknown(data['enabled']!, _enabledMeta),
      );
    }
    if (data.containsKey('severity')) {
      context.handle(
        _severityMeta,
        severity.isAcceptableOrUnknown(data['severity']!, _severityMeta),
      );
    } else if (isInserting) {
      context.missing(_severityMeta);
    }
    if (data.containsKey('thresholds')) {
      context.handle(
        _thresholdsMeta,
        thresholds.isAcceptableOrUnknown(data['thresholds']!, _thresholdsMeta),
      );
    } else if (isInserting) {
      context.missing(_thresholdsMeta);
    }
    if (data.containsKey('actions')) {
      context.handle(
        _actionsMeta,
        actions.isAcceptableOrUnknown(data['actions']!, _actionsMeta),
      );
    } else if (isInserting) {
      context.missing(_actionsMeta);
    }
    if (data.containsKey('suppression_time_minutes')) {
      context.handle(
        _suppressionTimeMinutesMeta,
        suppressionTimeMinutes.isAcceptableOrUnknown(
          data['suppression_time_minutes']!,
          _suppressionTimeMinutesMeta,
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
  AlertRuleData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AlertRuleData(
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
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}type'],
      )!,
      enabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}enabled'],
      )!,
      severity: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}severity'],
      )!,
      thresholds: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}thresholds'],
      )!,
      actions: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}actions'],
      )!,
      suppressionTimeMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}suppression_time_minutes'],
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
  $AlertRulesTableTable createAlias(String alias) {
    return $AlertRulesTableTable(attachedDatabase, alias);
  }
}

class AlertRuleData extends DataClass implements Insertable<AlertRuleData> {
  final String id;
  final String name;
  final String description;
  final int type;
  final bool enabled;
  final int severity;
  final String thresholds;
  final String actions;
  final int? suppressionTimeMinutes;
  final DateTime createdAt;
  final DateTime updatedAt;
  const AlertRuleData({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
    required this.enabled,
    required this.severity,
    required this.thresholds,
    required this.actions,
    this.suppressionTimeMinutes,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    map['type'] = Variable<int>(type);
    map['enabled'] = Variable<bool>(enabled);
    map['severity'] = Variable<int>(severity);
    map['thresholds'] = Variable<String>(thresholds);
    map['actions'] = Variable<String>(actions);
    if (!nullToAbsent || suppressionTimeMinutes != null) {
      map['suppression_time_minutes'] = Variable<int>(suppressionTimeMinutes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  AlertRulesTableCompanion toCompanion(bool nullToAbsent) {
    return AlertRulesTableCompanion(
      id: Value(id),
      name: Value(name),
      description: Value(description),
      type: Value(type),
      enabled: Value(enabled),
      severity: Value(severity),
      thresholds: Value(thresholds),
      actions: Value(actions),
      suppressionTimeMinutes: suppressionTimeMinutes == null && nullToAbsent
          ? const Value.absent()
          : Value(suppressionTimeMinutes),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory AlertRuleData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AlertRuleData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      type: serializer.fromJson<int>(json['type']),
      enabled: serializer.fromJson<bool>(json['enabled']),
      severity: serializer.fromJson<int>(json['severity']),
      thresholds: serializer.fromJson<String>(json['thresholds']),
      actions: serializer.fromJson<String>(json['actions']),
      suppressionTimeMinutes: serializer.fromJson<int?>(
        json['suppressionTimeMinutes'],
      ),
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
      'description': serializer.toJson<String>(description),
      'type': serializer.toJson<int>(type),
      'enabled': serializer.toJson<bool>(enabled),
      'severity': serializer.toJson<int>(severity),
      'thresholds': serializer.toJson<String>(thresholds),
      'actions': serializer.toJson<String>(actions),
      'suppressionTimeMinutes': serializer.toJson<int?>(suppressionTimeMinutes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  AlertRuleData copyWith({
    String? id,
    String? name,
    String? description,
    int? type,
    bool? enabled,
    int? severity,
    String? thresholds,
    String? actions,
    Value<int?> suppressionTimeMinutes = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => AlertRuleData(
    id: id ?? this.id,
    name: name ?? this.name,
    description: description ?? this.description,
    type: type ?? this.type,
    enabled: enabled ?? this.enabled,
    severity: severity ?? this.severity,
    thresholds: thresholds ?? this.thresholds,
    actions: actions ?? this.actions,
    suppressionTimeMinutes: suppressionTimeMinutes.present
        ? suppressionTimeMinutes.value
        : this.suppressionTimeMinutes,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  AlertRuleData copyWithCompanion(AlertRulesTableCompanion data) {
    return AlertRuleData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      type: data.type.present ? data.type.value : this.type,
      enabled: data.enabled.present ? data.enabled.value : this.enabled,
      severity: data.severity.present ? data.severity.value : this.severity,
      thresholds: data.thresholds.present
          ? data.thresholds.value
          : this.thresholds,
      actions: data.actions.present ? data.actions.value : this.actions,
      suppressionTimeMinutes: data.suppressionTimeMinutes.present
          ? data.suppressionTimeMinutes.value
          : this.suppressionTimeMinutes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AlertRuleData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('type: $type, ')
          ..write('enabled: $enabled, ')
          ..write('severity: $severity, ')
          ..write('thresholds: $thresholds, ')
          ..write('actions: $actions, ')
          ..write('suppressionTimeMinutes: $suppressionTimeMinutes, ')
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
    type,
    enabled,
    severity,
    thresholds,
    actions,
    suppressionTimeMinutes,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AlertRuleData &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.type == this.type &&
          other.enabled == this.enabled &&
          other.severity == this.severity &&
          other.thresholds == this.thresholds &&
          other.actions == this.actions &&
          other.suppressionTimeMinutes == this.suppressionTimeMinutes &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class AlertRulesTableCompanion extends UpdateCompanion<AlertRuleData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> description;
  final Value<int> type;
  final Value<bool> enabled;
  final Value<int> severity;
  final Value<String> thresholds;
  final Value<String> actions;
  final Value<int?> suppressionTimeMinutes;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const AlertRulesTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.type = const Value.absent(),
    this.enabled = const Value.absent(),
    this.severity = const Value.absent(),
    this.thresholds = const Value.absent(),
    this.actions = const Value.absent(),
    this.suppressionTimeMinutes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AlertRulesTableCompanion.insert({
    required String id,
    required String name,
    required String description,
    required int type,
    this.enabled = const Value.absent(),
    required int severity,
    required String thresholds,
    required String actions,
    this.suppressionTimeMinutes = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       description = Value(description),
       type = Value(type),
       severity = Value(severity),
       thresholds = Value(thresholds),
       actions = Value(actions),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<AlertRuleData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<int>? type,
    Expression<bool>? enabled,
    Expression<int>? severity,
    Expression<String>? thresholds,
    Expression<String>? actions,
    Expression<int>? suppressionTimeMinutes,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (type != null) 'type': type,
      if (enabled != null) 'enabled': enabled,
      if (severity != null) 'severity': severity,
      if (thresholds != null) 'thresholds': thresholds,
      if (actions != null) 'actions': actions,
      if (suppressionTimeMinutes != null)
        'suppression_time_minutes': suppressionTimeMinutes,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AlertRulesTableCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? description,
    Value<int>? type,
    Value<bool>? enabled,
    Value<int>? severity,
    Value<String>? thresholds,
    Value<String>? actions,
    Value<int?>? suppressionTimeMinutes,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return AlertRulesTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      type: type ?? this.type,
      enabled: enabled ?? this.enabled,
      severity: severity ?? this.severity,
      thresholds: thresholds ?? this.thresholds,
      actions: actions ?? this.actions,
      suppressionTimeMinutes:
          suppressionTimeMinutes ?? this.suppressionTimeMinutes,
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
    if (type.present) {
      map['type'] = Variable<int>(type.value);
    }
    if (enabled.present) {
      map['enabled'] = Variable<bool>(enabled.value);
    }
    if (severity.present) {
      map['severity'] = Variable<int>(severity.value);
    }
    if (thresholds.present) {
      map['thresholds'] = Variable<String>(thresholds.value);
    }
    if (actions.present) {
      map['actions'] = Variable<String>(actions.value);
    }
    if (suppressionTimeMinutes.present) {
      map['suppression_time_minutes'] = Variable<int>(
        suppressionTimeMinutes.value,
      );
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
    return (StringBuffer('AlertRulesTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('type: $type, ')
          ..write('enabled: $enabled, ')
          ..write('severity: $severity, ')
          ..write('thresholds: $thresholds, ')
          ..write('actions: $actions, ')
          ..write('suppressionTimeMinutes: $suppressionTimeMinutes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PredictionsTableTable extends PredictionsTable
    with TableInfo<$PredictionsTableTable, PredictionData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PredictionsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _printerIdMeta = const VerificationMeta(
    'printerId',
  );
  @override
  late final GeneratedColumn<String> printerId = GeneratedColumn<String>(
    'printer_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<int> type = GeneratedColumn<int>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _predictedDateMeta = const VerificationMeta(
    'predictedDate',
  );
  @override
  late final GeneratedColumn<DateTime> predictedDate =
      GeneratedColumn<DateTime>(
        'predicted_date',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _confidenceMeta = const VerificationMeta(
    'confidence',
  );
  @override
  late final GeneratedColumn<double> confidence = GeneratedColumn<double>(
    'confidence',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _factorsMeta = const VerificationMeta(
    'factors',
  );
  @override
  late final GeneratedColumn<String> factors = GeneratedColumn<String>(
    'factors',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
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
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<int> status = GeneratedColumn<int>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    printerId,
    type,
    predictedDate,
    confidence,
    factors,
    createdAt,
    status,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'predictions_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<PredictionData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('printer_id')) {
      context.handle(
        _printerIdMeta,
        printerId.isAcceptableOrUnknown(data['printer_id']!, _printerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_printerIdMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('predicted_date')) {
      context.handle(
        _predictedDateMeta,
        predictedDate.isAcceptableOrUnknown(
          data['predicted_date']!,
          _predictedDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_predictedDateMeta);
    }
    if (data.containsKey('confidence')) {
      context.handle(
        _confidenceMeta,
        confidence.isAcceptableOrUnknown(data['confidence']!, _confidenceMeta),
      );
    } else if (isInserting) {
      context.missing(_confidenceMeta);
    }
    if (data.containsKey('factors')) {
      context.handle(
        _factorsMeta,
        factors.isAcceptableOrUnknown(data['factors']!, _factorsMeta),
      );
    } else if (isInserting) {
      context.missing(_factorsMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PredictionData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PredictionData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      printerId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}printer_id'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}type'],
      )!,
      predictedDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}predicted_date'],
      )!,
      confidence: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}confidence'],
      )!,
      factors: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}factors'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}status'],
      )!,
    );
  }

  @override
  $PredictionsTableTable createAlias(String alias) {
    return $PredictionsTableTable(attachedDatabase, alias);
  }
}

class PredictionData extends DataClass implements Insertable<PredictionData> {
  final String id;
  final String printerId;
  final int type;
  final DateTime predictedDate;
  final double confidence;
  final String factors;
  final DateTime createdAt;
  final int status;
  const PredictionData({
    required this.id,
    required this.printerId,
    required this.type,
    required this.predictedDate,
    required this.confidence,
    required this.factors,
    required this.createdAt,
    required this.status,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['printer_id'] = Variable<String>(printerId);
    map['type'] = Variable<int>(type);
    map['predicted_date'] = Variable<DateTime>(predictedDate);
    map['confidence'] = Variable<double>(confidence);
    map['factors'] = Variable<String>(factors);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['status'] = Variable<int>(status);
    return map;
  }

  PredictionsTableCompanion toCompanion(bool nullToAbsent) {
    return PredictionsTableCompanion(
      id: Value(id),
      printerId: Value(printerId),
      type: Value(type),
      predictedDate: Value(predictedDate),
      confidence: Value(confidence),
      factors: Value(factors),
      createdAt: Value(createdAt),
      status: Value(status),
    );
  }

  factory PredictionData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PredictionData(
      id: serializer.fromJson<String>(json['id']),
      printerId: serializer.fromJson<String>(json['printerId']),
      type: serializer.fromJson<int>(json['type']),
      predictedDate: serializer.fromJson<DateTime>(json['predictedDate']),
      confidence: serializer.fromJson<double>(json['confidence']),
      factors: serializer.fromJson<String>(json['factors']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      status: serializer.fromJson<int>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'printerId': serializer.toJson<String>(printerId),
      'type': serializer.toJson<int>(type),
      'predictedDate': serializer.toJson<DateTime>(predictedDate),
      'confidence': serializer.toJson<double>(confidence),
      'factors': serializer.toJson<String>(factors),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'status': serializer.toJson<int>(status),
    };
  }

  PredictionData copyWith({
    String? id,
    String? printerId,
    int? type,
    DateTime? predictedDate,
    double? confidence,
    String? factors,
    DateTime? createdAt,
    int? status,
  }) => PredictionData(
    id: id ?? this.id,
    printerId: printerId ?? this.printerId,
    type: type ?? this.type,
    predictedDate: predictedDate ?? this.predictedDate,
    confidence: confidence ?? this.confidence,
    factors: factors ?? this.factors,
    createdAt: createdAt ?? this.createdAt,
    status: status ?? this.status,
  );
  PredictionData copyWithCompanion(PredictionsTableCompanion data) {
    return PredictionData(
      id: data.id.present ? data.id.value : this.id,
      printerId: data.printerId.present ? data.printerId.value : this.printerId,
      type: data.type.present ? data.type.value : this.type,
      predictedDate: data.predictedDate.present
          ? data.predictedDate.value
          : this.predictedDate,
      confidence: data.confidence.present
          ? data.confidence.value
          : this.confidence,
      factors: data.factors.present ? data.factors.value : this.factors,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PredictionData(')
          ..write('id: $id, ')
          ..write('printerId: $printerId, ')
          ..write('type: $type, ')
          ..write('predictedDate: $predictedDate, ')
          ..write('confidence: $confidence, ')
          ..write('factors: $factors, ')
          ..write('createdAt: $createdAt, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    printerId,
    type,
    predictedDate,
    confidence,
    factors,
    createdAt,
    status,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PredictionData &&
          other.id == this.id &&
          other.printerId == this.printerId &&
          other.type == this.type &&
          other.predictedDate == this.predictedDate &&
          other.confidence == this.confidence &&
          other.factors == this.factors &&
          other.createdAt == this.createdAt &&
          other.status == this.status);
}

class PredictionsTableCompanion extends UpdateCompanion<PredictionData> {
  final Value<String> id;
  final Value<String> printerId;
  final Value<int> type;
  final Value<DateTime> predictedDate;
  final Value<double> confidence;
  final Value<String> factors;
  final Value<DateTime> createdAt;
  final Value<int> status;
  final Value<int> rowid;
  const PredictionsTableCompanion({
    this.id = const Value.absent(),
    this.printerId = const Value.absent(),
    this.type = const Value.absent(),
    this.predictedDate = const Value.absent(),
    this.confidence = const Value.absent(),
    this.factors = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.status = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PredictionsTableCompanion.insert({
    required String id,
    required String printerId,
    required int type,
    required DateTime predictedDate,
    required double confidence,
    required String factors,
    required DateTime createdAt,
    this.status = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       printerId = Value(printerId),
       type = Value(type),
       predictedDate = Value(predictedDate),
       confidence = Value(confidence),
       factors = Value(factors),
       createdAt = Value(createdAt);
  static Insertable<PredictionData> custom({
    Expression<String>? id,
    Expression<String>? printerId,
    Expression<int>? type,
    Expression<DateTime>? predictedDate,
    Expression<double>? confidence,
    Expression<String>? factors,
    Expression<DateTime>? createdAt,
    Expression<int>? status,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (printerId != null) 'printer_id': printerId,
      if (type != null) 'type': type,
      if (predictedDate != null) 'predicted_date': predictedDate,
      if (confidence != null) 'confidence': confidence,
      if (factors != null) 'factors': factors,
      if (createdAt != null) 'created_at': createdAt,
      if (status != null) 'status': status,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PredictionsTableCompanion copyWith({
    Value<String>? id,
    Value<String>? printerId,
    Value<int>? type,
    Value<DateTime>? predictedDate,
    Value<double>? confidence,
    Value<String>? factors,
    Value<DateTime>? createdAt,
    Value<int>? status,
    Value<int>? rowid,
  }) {
    return PredictionsTableCompanion(
      id: id ?? this.id,
      printerId: printerId ?? this.printerId,
      type: type ?? this.type,
      predictedDate: predictedDate ?? this.predictedDate,
      confidence: confidence ?? this.confidence,
      factors: factors ?? this.factors,
      createdAt: createdAt ?? this.createdAt,
      status: status ?? this.status,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (printerId.present) {
      map['printer_id'] = Variable<String>(printerId.value);
    }
    if (type.present) {
      map['type'] = Variable<int>(type.value);
    }
    if (predictedDate.present) {
      map['predicted_date'] = Variable<DateTime>(predictedDate.value);
    }
    if (confidence.present) {
      map['confidence'] = Variable<double>(confidence.value);
    }
    if (factors.present) {
      map['factors'] = Variable<String>(factors.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (status.present) {
      map['status'] = Variable<int>(status.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PredictionsTableCompanion(')
          ..write('id: $id, ')
          ..write('printerId: $printerId, ')
          ..write('type: $type, ')
          ..write('predictedDate: $predictedDate, ')
          ..write('confidence: $confidence, ')
          ..write('factors: $factors, ')
          ..write('createdAt: $createdAt, ')
          ..write('status: $status, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PatternsTableTable extends PatternsTable
    with TableInfo<$PatternsTableTable, PatternData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PatternsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _printerIdMeta = const VerificationMeta(
    'printerId',
  );
  @override
  late final GeneratedColumn<String> printerId = GeneratedColumn<String>(
    'printer_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _patternTypeMeta = const VerificationMeta(
    'patternType',
  );
  @override
  late final GeneratedColumn<int> patternType = GeneratedColumn<int>(
    'pattern_type',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _occurrenceCountMeta = const VerificationMeta(
    'occurrenceCount',
  );
  @override
  late final GeneratedColumn<int> occurrenceCount = GeneratedColumn<int>(
    'occurrence_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastOccurrenceMeta = const VerificationMeta(
    'lastOccurrence',
  );
  @override
  late final GeneratedColumn<DateTime> lastOccurrence =
      GeneratedColumn<DateTime>(
        'last_occurrence',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _confidenceMeta = const VerificationMeta(
    'confidence',
  );
  @override
  late final GeneratedColumn<double> confidence = GeneratedColumn<double>(
    'confidence',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
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
    printerId,
    patternType,
    description,
    occurrenceCount,
    lastOccurrence,
    confidence,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'patterns_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<PatternData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('printer_id')) {
      context.handle(
        _printerIdMeta,
        printerId.isAcceptableOrUnknown(data['printer_id']!, _printerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_printerIdMeta);
    }
    if (data.containsKey('pattern_type')) {
      context.handle(
        _patternTypeMeta,
        patternType.isAcceptableOrUnknown(
          data['pattern_type']!,
          _patternTypeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_patternTypeMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('occurrence_count')) {
      context.handle(
        _occurrenceCountMeta,
        occurrenceCount.isAcceptableOrUnknown(
          data['occurrence_count']!,
          _occurrenceCountMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_occurrenceCountMeta);
    }
    if (data.containsKey('last_occurrence')) {
      context.handle(
        _lastOccurrenceMeta,
        lastOccurrence.isAcceptableOrUnknown(
          data['last_occurrence']!,
          _lastOccurrenceMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_lastOccurrenceMeta);
    }
    if (data.containsKey('confidence')) {
      context.handle(
        _confidenceMeta,
        confidence.isAcceptableOrUnknown(data['confidence']!, _confidenceMeta),
      );
    } else if (isInserting) {
      context.missing(_confidenceMeta);
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
  PatternData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PatternData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      printerId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}printer_id'],
      )!,
      patternType: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}pattern_type'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      occurrenceCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}occurrence_count'],
      )!,
      lastOccurrence: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_occurrence'],
      )!,
      confidence: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}confidence'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $PatternsTableTable createAlias(String alias) {
    return $PatternsTableTable(attachedDatabase, alias);
  }
}

class PatternData extends DataClass implements Insertable<PatternData> {
  final String id;
  final String printerId;
  final int patternType;
  final String description;
  final int occurrenceCount;
  final DateTime lastOccurrence;
  final double confidence;
  final DateTime createdAt;
  const PatternData({
    required this.id,
    required this.printerId,
    required this.patternType,
    required this.description,
    required this.occurrenceCount,
    required this.lastOccurrence,
    required this.confidence,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['printer_id'] = Variable<String>(printerId);
    map['pattern_type'] = Variable<int>(patternType);
    map['description'] = Variable<String>(description);
    map['occurrence_count'] = Variable<int>(occurrenceCount);
    map['last_occurrence'] = Variable<DateTime>(lastOccurrence);
    map['confidence'] = Variable<double>(confidence);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  PatternsTableCompanion toCompanion(bool nullToAbsent) {
    return PatternsTableCompanion(
      id: Value(id),
      printerId: Value(printerId),
      patternType: Value(patternType),
      description: Value(description),
      occurrenceCount: Value(occurrenceCount),
      lastOccurrence: Value(lastOccurrence),
      confidence: Value(confidence),
      createdAt: Value(createdAt),
    );
  }

  factory PatternData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PatternData(
      id: serializer.fromJson<String>(json['id']),
      printerId: serializer.fromJson<String>(json['printerId']),
      patternType: serializer.fromJson<int>(json['patternType']),
      description: serializer.fromJson<String>(json['description']),
      occurrenceCount: serializer.fromJson<int>(json['occurrenceCount']),
      lastOccurrence: serializer.fromJson<DateTime>(json['lastOccurrence']),
      confidence: serializer.fromJson<double>(json['confidence']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'printerId': serializer.toJson<String>(printerId),
      'patternType': serializer.toJson<int>(patternType),
      'description': serializer.toJson<String>(description),
      'occurrenceCount': serializer.toJson<int>(occurrenceCount),
      'lastOccurrence': serializer.toJson<DateTime>(lastOccurrence),
      'confidence': serializer.toJson<double>(confidence),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  PatternData copyWith({
    String? id,
    String? printerId,
    int? patternType,
    String? description,
    int? occurrenceCount,
    DateTime? lastOccurrence,
    double? confidence,
    DateTime? createdAt,
  }) => PatternData(
    id: id ?? this.id,
    printerId: printerId ?? this.printerId,
    patternType: patternType ?? this.patternType,
    description: description ?? this.description,
    occurrenceCount: occurrenceCount ?? this.occurrenceCount,
    lastOccurrence: lastOccurrence ?? this.lastOccurrence,
    confidence: confidence ?? this.confidence,
    createdAt: createdAt ?? this.createdAt,
  );
  PatternData copyWithCompanion(PatternsTableCompanion data) {
    return PatternData(
      id: data.id.present ? data.id.value : this.id,
      printerId: data.printerId.present ? data.printerId.value : this.printerId,
      patternType: data.patternType.present
          ? data.patternType.value
          : this.patternType,
      description: data.description.present
          ? data.description.value
          : this.description,
      occurrenceCount: data.occurrenceCount.present
          ? data.occurrenceCount.value
          : this.occurrenceCount,
      lastOccurrence: data.lastOccurrence.present
          ? data.lastOccurrence.value
          : this.lastOccurrence,
      confidence: data.confidence.present
          ? data.confidence.value
          : this.confidence,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PatternData(')
          ..write('id: $id, ')
          ..write('printerId: $printerId, ')
          ..write('patternType: $patternType, ')
          ..write('description: $description, ')
          ..write('occurrenceCount: $occurrenceCount, ')
          ..write('lastOccurrence: $lastOccurrence, ')
          ..write('confidence: $confidence, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    printerId,
    patternType,
    description,
    occurrenceCount,
    lastOccurrence,
    confidence,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PatternData &&
          other.id == this.id &&
          other.printerId == this.printerId &&
          other.patternType == this.patternType &&
          other.description == this.description &&
          other.occurrenceCount == this.occurrenceCount &&
          other.lastOccurrence == this.lastOccurrence &&
          other.confidence == this.confidence &&
          other.createdAt == this.createdAt);
}

class PatternsTableCompanion extends UpdateCompanion<PatternData> {
  final Value<String> id;
  final Value<String> printerId;
  final Value<int> patternType;
  final Value<String> description;
  final Value<int> occurrenceCount;
  final Value<DateTime> lastOccurrence;
  final Value<double> confidence;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const PatternsTableCompanion({
    this.id = const Value.absent(),
    this.printerId = const Value.absent(),
    this.patternType = const Value.absent(),
    this.description = const Value.absent(),
    this.occurrenceCount = const Value.absent(),
    this.lastOccurrence = const Value.absent(),
    this.confidence = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PatternsTableCompanion.insert({
    required String id,
    required String printerId,
    required int patternType,
    required String description,
    required int occurrenceCount,
    required DateTime lastOccurrence,
    required double confidence,
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       printerId = Value(printerId),
       patternType = Value(patternType),
       description = Value(description),
       occurrenceCount = Value(occurrenceCount),
       lastOccurrence = Value(lastOccurrence),
       confidence = Value(confidence),
       createdAt = Value(createdAt);
  static Insertable<PatternData> custom({
    Expression<String>? id,
    Expression<String>? printerId,
    Expression<int>? patternType,
    Expression<String>? description,
    Expression<int>? occurrenceCount,
    Expression<DateTime>? lastOccurrence,
    Expression<double>? confidence,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (printerId != null) 'printer_id': printerId,
      if (patternType != null) 'pattern_type': patternType,
      if (description != null) 'description': description,
      if (occurrenceCount != null) 'occurrence_count': occurrenceCount,
      if (lastOccurrence != null) 'last_occurrence': lastOccurrence,
      if (confidence != null) 'confidence': confidence,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PatternsTableCompanion copyWith({
    Value<String>? id,
    Value<String>? printerId,
    Value<int>? patternType,
    Value<String>? description,
    Value<int>? occurrenceCount,
    Value<DateTime>? lastOccurrence,
    Value<double>? confidence,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return PatternsTableCompanion(
      id: id ?? this.id,
      printerId: printerId ?? this.printerId,
      patternType: patternType ?? this.patternType,
      description: description ?? this.description,
      occurrenceCount: occurrenceCount ?? this.occurrenceCount,
      lastOccurrence: lastOccurrence ?? this.lastOccurrence,
      confidence: confidence ?? this.confidence,
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
    if (printerId.present) {
      map['printer_id'] = Variable<String>(printerId.value);
    }
    if (patternType.present) {
      map['pattern_type'] = Variable<int>(patternType.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (occurrenceCount.present) {
      map['occurrence_count'] = Variable<int>(occurrenceCount.value);
    }
    if (lastOccurrence.present) {
      map['last_occurrence'] = Variable<DateTime>(lastOccurrence.value);
    }
    if (confidence.present) {
      map['confidence'] = Variable<double>(confidence.value);
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
    return (StringBuffer('PatternsTableCompanion(')
          ..write('id: $id, ')
          ..write('printerId: $printerId, ')
          ..write('patternType: $patternType, ')
          ..write('description: $description, ')
          ..write('occurrenceCount: $occurrenceCount, ')
          ..write('lastOccurrence: $lastOccurrence, ')
          ..write('confidence: $confidence, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ActionRulesTableTable extends ActionRulesTable
    with TableInfo<$ActionRulesTableTable, ActionRuleData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ActionRulesTableTable(this.attachedDatabase, [this._alias]);
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
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _triggerTypeMeta = const VerificationMeta(
    'triggerType',
  );
  @override
  late final GeneratedColumn<int> triggerType = GeneratedColumn<int>(
    'trigger_type',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _actionTypeMeta = const VerificationMeta(
    'actionType',
  );
  @override
  late final GeneratedColumn<int> actionType = GeneratedColumn<int>(
    'action_type',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _conditionsMeta = const VerificationMeta(
    'conditions',
  );
  @override
  late final GeneratedColumn<String> conditions = GeneratedColumn<String>(
    'conditions',
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
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _lastExecutedMeta = const VerificationMeta(
    'lastExecuted',
  );
  @override
  late final GeneratedColumn<DateTime> lastExecuted = GeneratedColumn<DateTime>(
    'last_executed',
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
    description,
    triggerType,
    actionType,
    conditions,
    enabled,
    lastExecuted,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'action_rules_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ActionRuleData> instance, {
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
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('trigger_type')) {
      context.handle(
        _triggerTypeMeta,
        triggerType.isAcceptableOrUnknown(
          data['trigger_type']!,
          _triggerTypeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_triggerTypeMeta);
    }
    if (data.containsKey('action_type')) {
      context.handle(
        _actionTypeMeta,
        actionType.isAcceptableOrUnknown(data['action_type']!, _actionTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_actionTypeMeta);
    }
    if (data.containsKey('conditions')) {
      context.handle(
        _conditionsMeta,
        conditions.isAcceptableOrUnknown(data['conditions']!, _conditionsMeta),
      );
    } else if (isInserting) {
      context.missing(_conditionsMeta);
    }
    if (data.containsKey('enabled')) {
      context.handle(
        _enabledMeta,
        enabled.isAcceptableOrUnknown(data['enabled']!, _enabledMeta),
      );
    }
    if (data.containsKey('last_executed')) {
      context.handle(
        _lastExecutedMeta,
        lastExecuted.isAcceptableOrUnknown(
          data['last_executed']!,
          _lastExecutedMeta,
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
  ActionRuleData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ActionRuleData(
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
      )!,
      triggerType: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}trigger_type'],
      )!,
      actionType: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}action_type'],
      )!,
      conditions: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}conditions'],
      )!,
      enabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}enabled'],
      )!,
      lastExecuted: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_executed'],
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
  $ActionRulesTableTable createAlias(String alias) {
    return $ActionRulesTableTable(attachedDatabase, alias);
  }
}

class ActionRuleData extends DataClass implements Insertable<ActionRuleData> {
  final String id;
  final String name;
  final String description;
  final int triggerType;
  final int actionType;
  final String conditions;
  final bool enabled;
  final DateTime? lastExecuted;
  final DateTime createdAt;
  final DateTime updatedAt;
  const ActionRuleData({
    required this.id,
    required this.name,
    required this.description,
    required this.triggerType,
    required this.actionType,
    required this.conditions,
    required this.enabled,
    this.lastExecuted,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    map['trigger_type'] = Variable<int>(triggerType);
    map['action_type'] = Variable<int>(actionType);
    map['conditions'] = Variable<String>(conditions);
    map['enabled'] = Variable<bool>(enabled);
    if (!nullToAbsent || lastExecuted != null) {
      map['last_executed'] = Variable<DateTime>(lastExecuted);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  ActionRulesTableCompanion toCompanion(bool nullToAbsent) {
    return ActionRulesTableCompanion(
      id: Value(id),
      name: Value(name),
      description: Value(description),
      triggerType: Value(triggerType),
      actionType: Value(actionType),
      conditions: Value(conditions),
      enabled: Value(enabled),
      lastExecuted: lastExecuted == null && nullToAbsent
          ? const Value.absent()
          : Value(lastExecuted),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory ActionRuleData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ActionRuleData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      triggerType: serializer.fromJson<int>(json['triggerType']),
      actionType: serializer.fromJson<int>(json['actionType']),
      conditions: serializer.fromJson<String>(json['conditions']),
      enabled: serializer.fromJson<bool>(json['enabled']),
      lastExecuted: serializer.fromJson<DateTime?>(json['lastExecuted']),
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
      'description': serializer.toJson<String>(description),
      'triggerType': serializer.toJson<int>(triggerType),
      'actionType': serializer.toJson<int>(actionType),
      'conditions': serializer.toJson<String>(conditions),
      'enabled': serializer.toJson<bool>(enabled),
      'lastExecuted': serializer.toJson<DateTime?>(lastExecuted),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  ActionRuleData copyWith({
    String? id,
    String? name,
    String? description,
    int? triggerType,
    int? actionType,
    String? conditions,
    bool? enabled,
    Value<DateTime?> lastExecuted = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => ActionRuleData(
    id: id ?? this.id,
    name: name ?? this.name,
    description: description ?? this.description,
    triggerType: triggerType ?? this.triggerType,
    actionType: actionType ?? this.actionType,
    conditions: conditions ?? this.conditions,
    enabled: enabled ?? this.enabled,
    lastExecuted: lastExecuted.present ? lastExecuted.value : this.lastExecuted,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  ActionRuleData copyWithCompanion(ActionRulesTableCompanion data) {
    return ActionRuleData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      triggerType: data.triggerType.present
          ? data.triggerType.value
          : this.triggerType,
      actionType: data.actionType.present
          ? data.actionType.value
          : this.actionType,
      conditions: data.conditions.present
          ? data.conditions.value
          : this.conditions,
      enabled: data.enabled.present ? data.enabled.value : this.enabled,
      lastExecuted: data.lastExecuted.present
          ? data.lastExecuted.value
          : this.lastExecuted,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ActionRuleData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('triggerType: $triggerType, ')
          ..write('actionType: $actionType, ')
          ..write('conditions: $conditions, ')
          ..write('enabled: $enabled, ')
          ..write('lastExecuted: $lastExecuted, ')
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
    triggerType,
    actionType,
    conditions,
    enabled,
    lastExecuted,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ActionRuleData &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.triggerType == this.triggerType &&
          other.actionType == this.actionType &&
          other.conditions == this.conditions &&
          other.enabled == this.enabled &&
          other.lastExecuted == this.lastExecuted &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class ActionRulesTableCompanion extends UpdateCompanion<ActionRuleData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> description;
  final Value<int> triggerType;
  final Value<int> actionType;
  final Value<String> conditions;
  final Value<bool> enabled;
  final Value<DateTime?> lastExecuted;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const ActionRulesTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.triggerType = const Value.absent(),
    this.actionType = const Value.absent(),
    this.conditions = const Value.absent(),
    this.enabled = const Value.absent(),
    this.lastExecuted = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ActionRulesTableCompanion.insert({
    required String id,
    required String name,
    required String description,
    required int triggerType,
    required int actionType,
    required String conditions,
    this.enabled = const Value.absent(),
    this.lastExecuted = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       description = Value(description),
       triggerType = Value(triggerType),
       actionType = Value(actionType),
       conditions = Value(conditions),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<ActionRuleData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<int>? triggerType,
    Expression<int>? actionType,
    Expression<String>? conditions,
    Expression<bool>? enabled,
    Expression<DateTime>? lastExecuted,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (triggerType != null) 'trigger_type': triggerType,
      if (actionType != null) 'action_type': actionType,
      if (conditions != null) 'conditions': conditions,
      if (enabled != null) 'enabled': enabled,
      if (lastExecuted != null) 'last_executed': lastExecuted,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ActionRulesTableCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? description,
    Value<int>? triggerType,
    Value<int>? actionType,
    Value<String>? conditions,
    Value<bool>? enabled,
    Value<DateTime?>? lastExecuted,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return ActionRulesTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      triggerType: triggerType ?? this.triggerType,
      actionType: actionType ?? this.actionType,
      conditions: conditions ?? this.conditions,
      enabled: enabled ?? this.enabled,
      lastExecuted: lastExecuted ?? this.lastExecuted,
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
    if (triggerType.present) {
      map['trigger_type'] = Variable<int>(triggerType.value);
    }
    if (actionType.present) {
      map['action_type'] = Variable<int>(actionType.value);
    }
    if (conditions.present) {
      map['conditions'] = Variable<String>(conditions.value);
    }
    if (enabled.present) {
      map['enabled'] = Variable<bool>(enabled.value);
    }
    if (lastExecuted.present) {
      map['last_executed'] = Variable<DateTime>(lastExecuted.value);
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
    return (StringBuffer('ActionRulesTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('triggerType: $triggerType, ')
          ..write('actionType: $actionType, ')
          ..write('conditions: $conditions, ')
          ..write('enabled: $enabled, ')
          ..write('lastExecuted: $lastExecuted, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AutomatedActionsTableTable extends AutomatedActionsTable
    with TableInfo<$AutomatedActionsTableTable, AutomatedActionData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AutomatedActionsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ruleIdMeta = const VerificationMeta('ruleId');
  @override
  late final GeneratedColumn<String> ruleId = GeneratedColumn<String>(
    'rule_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _printerIdMeta = const VerificationMeta(
    'printerId',
  );
  @override
  late final GeneratedColumn<String> printerId = GeneratedColumn<String>(
    'printer_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _actionTypeMeta = const VerificationMeta(
    'actionType',
  );
  @override
  late final GeneratedColumn<int> actionType = GeneratedColumn<int>(
    'action_type',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _parametersMeta = const VerificationMeta(
    'parameters',
  );
  @override
  late final GeneratedColumn<String> parameters = GeneratedColumn<String>(
    'parameters',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _resultMeta = const VerificationMeta('result');
  @override
  late final GeneratedColumn<int> result = GeneratedColumn<int>(
    'result',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
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
  static const VerificationMeta _executedAtMeta = const VerificationMeta(
    'executedAt',
  );
  @override
  late final GeneratedColumn<DateTime> executedAt = GeneratedColumn<DateTime>(
    'executed_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    ruleId,
    printerId,
    actionType,
    parameters,
    result,
    errorMessage,
    executedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'automated_actions_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<AutomatedActionData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('rule_id')) {
      context.handle(
        _ruleIdMeta,
        ruleId.isAcceptableOrUnknown(data['rule_id']!, _ruleIdMeta),
      );
    } else if (isInserting) {
      context.missing(_ruleIdMeta);
    }
    if (data.containsKey('printer_id')) {
      context.handle(
        _printerIdMeta,
        printerId.isAcceptableOrUnknown(data['printer_id']!, _printerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_printerIdMeta);
    }
    if (data.containsKey('action_type')) {
      context.handle(
        _actionTypeMeta,
        actionType.isAcceptableOrUnknown(data['action_type']!, _actionTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_actionTypeMeta);
    }
    if (data.containsKey('parameters')) {
      context.handle(
        _parametersMeta,
        parameters.isAcceptableOrUnknown(data['parameters']!, _parametersMeta),
      );
    } else if (isInserting) {
      context.missing(_parametersMeta);
    }
    if (data.containsKey('result')) {
      context.handle(
        _resultMeta,
        result.isAcceptableOrUnknown(data['result']!, _resultMeta),
      );
    } else if (isInserting) {
      context.missing(_resultMeta);
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
    if (data.containsKey('executed_at')) {
      context.handle(
        _executedAtMeta,
        executedAt.isAcceptableOrUnknown(data['executed_at']!, _executedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_executedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AutomatedActionData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AutomatedActionData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      ruleId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}rule_id'],
      )!,
      printerId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}printer_id'],
      )!,
      actionType: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}action_type'],
      )!,
      parameters: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}parameters'],
      )!,
      result: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}result'],
      )!,
      errorMessage: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}error_message'],
      ),
      executedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}executed_at'],
      )!,
    );
  }

  @override
  $AutomatedActionsTableTable createAlias(String alias) {
    return $AutomatedActionsTableTable(attachedDatabase, alias);
  }
}

class AutomatedActionData extends DataClass
    implements Insertable<AutomatedActionData> {
  final String id;
  final String ruleId;
  final String printerId;
  final int actionType;
  final String parameters;
  final int result;
  final String? errorMessage;
  final DateTime executedAt;
  const AutomatedActionData({
    required this.id,
    required this.ruleId,
    required this.printerId,
    required this.actionType,
    required this.parameters,
    required this.result,
    this.errorMessage,
    required this.executedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['rule_id'] = Variable<String>(ruleId);
    map['printer_id'] = Variable<String>(printerId);
    map['action_type'] = Variable<int>(actionType);
    map['parameters'] = Variable<String>(parameters);
    map['result'] = Variable<int>(result);
    if (!nullToAbsent || errorMessage != null) {
      map['error_message'] = Variable<String>(errorMessage);
    }
    map['executed_at'] = Variable<DateTime>(executedAt);
    return map;
  }

  AutomatedActionsTableCompanion toCompanion(bool nullToAbsent) {
    return AutomatedActionsTableCompanion(
      id: Value(id),
      ruleId: Value(ruleId),
      printerId: Value(printerId),
      actionType: Value(actionType),
      parameters: Value(parameters),
      result: Value(result),
      errorMessage: errorMessage == null && nullToAbsent
          ? const Value.absent()
          : Value(errorMessage),
      executedAt: Value(executedAt),
    );
  }

  factory AutomatedActionData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AutomatedActionData(
      id: serializer.fromJson<String>(json['id']),
      ruleId: serializer.fromJson<String>(json['ruleId']),
      printerId: serializer.fromJson<String>(json['printerId']),
      actionType: serializer.fromJson<int>(json['actionType']),
      parameters: serializer.fromJson<String>(json['parameters']),
      result: serializer.fromJson<int>(json['result']),
      errorMessage: serializer.fromJson<String?>(json['errorMessage']),
      executedAt: serializer.fromJson<DateTime>(json['executedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'ruleId': serializer.toJson<String>(ruleId),
      'printerId': serializer.toJson<String>(printerId),
      'actionType': serializer.toJson<int>(actionType),
      'parameters': serializer.toJson<String>(parameters),
      'result': serializer.toJson<int>(result),
      'errorMessage': serializer.toJson<String?>(errorMessage),
      'executedAt': serializer.toJson<DateTime>(executedAt),
    };
  }

  AutomatedActionData copyWith({
    String? id,
    String? ruleId,
    String? printerId,
    int? actionType,
    String? parameters,
    int? result,
    Value<String?> errorMessage = const Value.absent(),
    DateTime? executedAt,
  }) => AutomatedActionData(
    id: id ?? this.id,
    ruleId: ruleId ?? this.ruleId,
    printerId: printerId ?? this.printerId,
    actionType: actionType ?? this.actionType,
    parameters: parameters ?? this.parameters,
    result: result ?? this.result,
    errorMessage: errorMessage.present ? errorMessage.value : this.errorMessage,
    executedAt: executedAt ?? this.executedAt,
  );
  AutomatedActionData copyWithCompanion(AutomatedActionsTableCompanion data) {
    return AutomatedActionData(
      id: data.id.present ? data.id.value : this.id,
      ruleId: data.ruleId.present ? data.ruleId.value : this.ruleId,
      printerId: data.printerId.present ? data.printerId.value : this.printerId,
      actionType: data.actionType.present
          ? data.actionType.value
          : this.actionType,
      parameters: data.parameters.present
          ? data.parameters.value
          : this.parameters,
      result: data.result.present ? data.result.value : this.result,
      errorMessage: data.errorMessage.present
          ? data.errorMessage.value
          : this.errorMessage,
      executedAt: data.executedAt.present
          ? data.executedAt.value
          : this.executedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AutomatedActionData(')
          ..write('id: $id, ')
          ..write('ruleId: $ruleId, ')
          ..write('printerId: $printerId, ')
          ..write('actionType: $actionType, ')
          ..write('parameters: $parameters, ')
          ..write('result: $result, ')
          ..write('errorMessage: $errorMessage, ')
          ..write('executedAt: $executedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    ruleId,
    printerId,
    actionType,
    parameters,
    result,
    errorMessage,
    executedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AutomatedActionData &&
          other.id == this.id &&
          other.ruleId == this.ruleId &&
          other.printerId == this.printerId &&
          other.actionType == this.actionType &&
          other.parameters == this.parameters &&
          other.result == this.result &&
          other.errorMessage == this.errorMessage &&
          other.executedAt == this.executedAt);
}

class AutomatedActionsTableCompanion
    extends UpdateCompanion<AutomatedActionData> {
  final Value<String> id;
  final Value<String> ruleId;
  final Value<String> printerId;
  final Value<int> actionType;
  final Value<String> parameters;
  final Value<int> result;
  final Value<String?> errorMessage;
  final Value<DateTime> executedAt;
  final Value<int> rowid;
  const AutomatedActionsTableCompanion({
    this.id = const Value.absent(),
    this.ruleId = const Value.absent(),
    this.printerId = const Value.absent(),
    this.actionType = const Value.absent(),
    this.parameters = const Value.absent(),
    this.result = const Value.absent(),
    this.errorMessage = const Value.absent(),
    this.executedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AutomatedActionsTableCompanion.insert({
    required String id,
    required String ruleId,
    required String printerId,
    required int actionType,
    required String parameters,
    required int result,
    this.errorMessage = const Value.absent(),
    required DateTime executedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       ruleId = Value(ruleId),
       printerId = Value(printerId),
       actionType = Value(actionType),
       parameters = Value(parameters),
       result = Value(result),
       executedAt = Value(executedAt);
  static Insertable<AutomatedActionData> custom({
    Expression<String>? id,
    Expression<String>? ruleId,
    Expression<String>? printerId,
    Expression<int>? actionType,
    Expression<String>? parameters,
    Expression<int>? result,
    Expression<String>? errorMessage,
    Expression<DateTime>? executedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (ruleId != null) 'rule_id': ruleId,
      if (printerId != null) 'printer_id': printerId,
      if (actionType != null) 'action_type': actionType,
      if (parameters != null) 'parameters': parameters,
      if (result != null) 'result': result,
      if (errorMessage != null) 'error_message': errorMessage,
      if (executedAt != null) 'executed_at': executedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AutomatedActionsTableCompanion copyWith({
    Value<String>? id,
    Value<String>? ruleId,
    Value<String>? printerId,
    Value<int>? actionType,
    Value<String>? parameters,
    Value<int>? result,
    Value<String?>? errorMessage,
    Value<DateTime>? executedAt,
    Value<int>? rowid,
  }) {
    return AutomatedActionsTableCompanion(
      id: id ?? this.id,
      ruleId: ruleId ?? this.ruleId,
      printerId: printerId ?? this.printerId,
      actionType: actionType ?? this.actionType,
      parameters: parameters ?? this.parameters,
      result: result ?? this.result,
      errorMessage: errorMessage ?? this.errorMessage,
      executedAt: executedAt ?? this.executedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (ruleId.present) {
      map['rule_id'] = Variable<String>(ruleId.value);
    }
    if (printerId.present) {
      map['printer_id'] = Variable<String>(printerId.value);
    }
    if (actionType.present) {
      map['action_type'] = Variable<int>(actionType.value);
    }
    if (parameters.present) {
      map['parameters'] = Variable<String>(parameters.value);
    }
    if (result.present) {
      map['result'] = Variable<int>(result.value);
    }
    if (errorMessage.present) {
      map['error_message'] = Variable<String>(errorMessage.value);
    }
    if (executedAt.present) {
      map['executed_at'] = Variable<DateTime>(executedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AutomatedActionsTableCompanion(')
          ..write('id: $id, ')
          ..write('ruleId: $ruleId, ')
          ..write('printerId: $printerId, ')
          ..write('actionType: $actionType, ')
          ..write('parameters: $parameters, ')
          ..write('result: $result, ')
          ..write('errorMessage: $errorMessage, ')
          ..write('executedAt: $executedAt, ')
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
  late final $UsersTable users = $UsersTable(this);
  late final $PrinterSuppliesTable printerSupplies = $PrinterSuppliesTable(
    this,
  );
  late final $PrinterMaintenancesTable printerMaintenances =
      $PrinterMaintenancesTable(this);
  late final $PrinterCountersTable printerCounters = $PrinterCountersTable(
    this,
  );
  late final $PrinterHealthTableTable printerHealthTable =
      $PrinterHealthTableTable(this);
  late final $AlertRulesTableTable alertRulesTable = $AlertRulesTableTable(
    this,
  );
  late final $PredictionsTableTable predictionsTable = $PredictionsTableTable(
    this,
  );
  late final $PatternsTableTable patternsTable = $PatternsTableTable(this);
  late final $ActionRulesTableTable actionRulesTable = $ActionRulesTableTable(
    this,
  );
  late final $AutomatedActionsTableTable automatedActionsTable =
      $AutomatedActionsTableTable(this);
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
    users,
    printerSupplies,
    printerMaintenances,
    printerCounters,
    printerHealthTable,
    alertRulesTable,
    predictionsTable,
    patternsTable,
    actionRulesTable,
    automatedActionsTable,
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
      Value<int> totalPagesPrinted,
      Value<String> tonerLevel,
      Value<String> paperLevel,
      Value<DateTime?> lastMaintenanceDate,
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
      Value<int> totalPagesPrinted,
      Value<String> tonerLevel,
      Value<String> paperLevel,
      Value<DateTime?> lastMaintenanceDate,
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

  ColumnFilters<int> get totalPagesPrinted => $composableBuilder(
    column: $table.totalPagesPrinted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tonerLevel => $composableBuilder(
    column: $table.tonerLevel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get paperLevel => $composableBuilder(
    column: $table.paperLevel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastMaintenanceDate => $composableBuilder(
    column: $table.lastMaintenanceDate,
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

  ColumnOrderings<int> get totalPagesPrinted => $composableBuilder(
    column: $table.totalPagesPrinted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tonerLevel => $composableBuilder(
    column: $table.tonerLevel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get paperLevel => $composableBuilder(
    column: $table.paperLevel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastMaintenanceDate => $composableBuilder(
    column: $table.lastMaintenanceDate,
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

  GeneratedColumn<int> get totalPagesPrinted => $composableBuilder(
    column: $table.totalPagesPrinted,
    builder: (column) => column,
  );

  GeneratedColumn<String> get tonerLevel => $composableBuilder(
    column: $table.tonerLevel,
    builder: (column) => column,
  );

  GeneratedColumn<String> get paperLevel => $composableBuilder(
    column: $table.paperLevel,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastMaintenanceDate => $composableBuilder(
    column: $table.lastMaintenanceDate,
    builder: (column) => column,
  );

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
                Value<int> totalPagesPrinted = const Value.absent(),
                Value<String> tonerLevel = const Value.absent(),
                Value<String> paperLevel = const Value.absent(),
                Value<DateTime?> lastMaintenanceDate = const Value.absent(),
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
                totalPagesPrinted: totalPagesPrinted,
                tonerLevel: tonerLevel,
                paperLevel: paperLevel,
                lastMaintenanceDate: lastMaintenanceDate,
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
                Value<int> totalPagesPrinted = const Value.absent(),
                Value<String> tonerLevel = const Value.absent(),
                Value<String> paperLevel = const Value.absent(),
                Value<DateTime?> lastMaintenanceDate = const Value.absent(),
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
                totalPagesPrinted: totalPagesPrinted,
                tonerLevel: tonerLevel,
                paperLevel: paperLevel,
                lastMaintenanceDate: lastMaintenanceDate,
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
      Value<String?> userId,
      Value<String?> username,
      Value<String?> documentType,
      Value<String?> department,
      Value<int?> estimatedCost,
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
      Value<String?> userId,
      Value<String?> username,
      Value<String?> documentType,
      Value<String?> department,
      Value<int?> estimatedCost,
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

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get username => $composableBuilder(
    column: $table.username,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get documentType => $composableBuilder(
    column: $table.documentType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get department => $composableBuilder(
    column: $table.department,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get estimatedCost => $composableBuilder(
    column: $table.estimatedCost,
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

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get username => $composableBuilder(
    column: $table.username,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get documentType => $composableBuilder(
    column: $table.documentType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get department => $composableBuilder(
    column: $table.department,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get estimatedCost => $composableBuilder(
    column: $table.estimatedCost,
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

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get username =>
      $composableBuilder(column: $table.username, builder: (column) => column);

  GeneratedColumn<String> get documentType => $composableBuilder(
    column: $table.documentType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get department => $composableBuilder(
    column: $table.department,
    builder: (column) => column,
  );

  GeneratedColumn<int> get estimatedCost => $composableBuilder(
    column: $table.estimatedCost,
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
                Value<String?> userId = const Value.absent(),
                Value<String?> username = const Value.absent(),
                Value<String?> documentType = const Value.absent(),
                Value<String?> department = const Value.absent(),
                Value<int?> estimatedCost = const Value.absent(),
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
                userId: userId,
                username: username,
                documentType: documentType,
                department: department,
                estimatedCost: estimatedCost,
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
                Value<String?> userId = const Value.absent(),
                Value<String?> username = const Value.absent(),
                Value<String?> documentType = const Value.absent(),
                Value<String?> department = const Value.absent(),
                Value<int?> estimatedCost = const Value.absent(),
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
                userId: userId,
                username: username,
                documentType: documentType,
                department: department,
                estimatedCost: estimatedCost,
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
typedef $$UsersTableCreateCompanionBuilder =
    UsersCompanion Function({
      required String id,
      required String username,
      Value<String?> displayName,
      Value<String?> department,
      Value<String?> email,
      Value<String> groupIds,
      required DateTime createdAt,
      Value<DateTime?> lastSeen,
      Value<int> rowid,
    });
typedef $$UsersTableUpdateCompanionBuilder =
    UsersCompanion Function({
      Value<String> id,
      Value<String> username,
      Value<String?> displayName,
      Value<String?> department,
      Value<String?> email,
      Value<String> groupIds,
      Value<DateTime> createdAt,
      Value<DateTime?> lastSeen,
      Value<int> rowid,
    });

class $$UsersTableFilterComposer extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableFilterComposer({
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

  ColumnFilters<String> get username => $composableBuilder(
    column: $table.username,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get department => $composableBuilder(
    column: $table.department,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get groupIds => $composableBuilder(
    column: $table.groupIds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastSeen => $composableBuilder(
    column: $table.lastSeen,
    builder: (column) => ColumnFilters(column),
  );
}

class $$UsersTableOrderingComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableOrderingComposer({
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

  ColumnOrderings<String> get username => $composableBuilder(
    column: $table.username,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get department => $composableBuilder(
    column: $table.department,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get groupIds => $composableBuilder(
    column: $table.groupIds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastSeen => $composableBuilder(
    column: $table.lastSeen,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UsersTableAnnotationComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get username =>
      $composableBuilder(column: $table.username, builder: (column) => column);

  GeneratedColumn<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get department => $composableBuilder(
    column: $table.department,
    builder: (column) => column,
  );

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get groupIds =>
      $composableBuilder(column: $table.groupIds, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get lastSeen =>
      $composableBuilder(column: $table.lastSeen, builder: (column) => column);
}

class $$UsersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UsersTable,
          UserData,
          $$UsersTableFilterComposer,
          $$UsersTableOrderingComposer,
          $$UsersTableAnnotationComposer,
          $$UsersTableCreateCompanionBuilder,
          $$UsersTableUpdateCompanionBuilder,
          (UserData, BaseReferences<_$AppDatabase, $UsersTable, UserData>),
          UserData,
          PrefetchHooks Function()
        > {
  $$UsersTableTableManager(_$AppDatabase db, $UsersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> username = const Value.absent(),
                Value<String?> displayName = const Value.absent(),
                Value<String?> department = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String> groupIds = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> lastSeen = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UsersCompanion(
                id: id,
                username: username,
                displayName: displayName,
                department: department,
                email: email,
                groupIds: groupIds,
                createdAt: createdAt,
                lastSeen: lastSeen,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String username,
                Value<String?> displayName = const Value.absent(),
                Value<String?> department = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String> groupIds = const Value.absent(),
                required DateTime createdAt,
                Value<DateTime?> lastSeen = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UsersCompanion.insert(
                id: id,
                username: username,
                displayName: displayName,
                department: department,
                email: email,
                groupIds: groupIds,
                createdAt: createdAt,
                lastSeen: lastSeen,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$UsersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UsersTable,
      UserData,
      $$UsersTableFilterComposer,
      $$UsersTableOrderingComposer,
      $$UsersTableAnnotationComposer,
      $$UsersTableCreateCompanionBuilder,
      $$UsersTableUpdateCompanionBuilder,
      (UserData, BaseReferences<_$AppDatabase, $UsersTable, UserData>),
      UserData,
      PrefetchHooks Function()
    >;
typedef $$PrinterSuppliesTableCreateCompanionBuilder =
    PrinterSuppliesCompanion Function({
      required String id,
      required String printerId,
      required String supplyType,
      required int level,
      required String unit,
      required DateTime lastChecked,
      Value<int> rowid,
    });
typedef $$PrinterSuppliesTableUpdateCompanionBuilder =
    PrinterSuppliesCompanion Function({
      Value<String> id,
      Value<String> printerId,
      Value<String> supplyType,
      Value<int> level,
      Value<String> unit,
      Value<DateTime> lastChecked,
      Value<int> rowid,
    });

class $$PrinterSuppliesTableFilterComposer
    extends Composer<_$AppDatabase, $PrinterSuppliesTable> {
  $$PrinterSuppliesTableFilterComposer({
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

  ColumnFilters<String> get printerId => $composableBuilder(
    column: $table.printerId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get supplyType => $composableBuilder(
    column: $table.supplyType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get level => $composableBuilder(
    column: $table.level,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastChecked => $composableBuilder(
    column: $table.lastChecked,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PrinterSuppliesTableOrderingComposer
    extends Composer<_$AppDatabase, $PrinterSuppliesTable> {
  $$PrinterSuppliesTableOrderingComposer({
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

  ColumnOrderings<String> get printerId => $composableBuilder(
    column: $table.printerId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get supplyType => $composableBuilder(
    column: $table.supplyType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get level => $composableBuilder(
    column: $table.level,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastChecked => $composableBuilder(
    column: $table.lastChecked,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PrinterSuppliesTableAnnotationComposer
    extends Composer<_$AppDatabase, $PrinterSuppliesTable> {
  $$PrinterSuppliesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get printerId =>
      $composableBuilder(column: $table.printerId, builder: (column) => column);

  GeneratedColumn<String> get supplyType => $composableBuilder(
    column: $table.supplyType,
    builder: (column) => column,
  );

  GeneratedColumn<int> get level =>
      $composableBuilder(column: $table.level, builder: (column) => column);

  GeneratedColumn<String> get unit =>
      $composableBuilder(column: $table.unit, builder: (column) => column);

  GeneratedColumn<DateTime> get lastChecked => $composableBuilder(
    column: $table.lastChecked,
    builder: (column) => column,
  );
}

class $$PrinterSuppliesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PrinterSuppliesTable,
          PrinterSupplyData,
          $$PrinterSuppliesTableFilterComposer,
          $$PrinterSuppliesTableOrderingComposer,
          $$PrinterSuppliesTableAnnotationComposer,
          $$PrinterSuppliesTableCreateCompanionBuilder,
          $$PrinterSuppliesTableUpdateCompanionBuilder,
          (
            PrinterSupplyData,
            BaseReferences<
              _$AppDatabase,
              $PrinterSuppliesTable,
              PrinterSupplyData
            >,
          ),
          PrinterSupplyData,
          PrefetchHooks Function()
        > {
  $$PrinterSuppliesTableTableManager(
    _$AppDatabase db,
    $PrinterSuppliesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PrinterSuppliesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PrinterSuppliesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PrinterSuppliesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> printerId = const Value.absent(),
                Value<String> supplyType = const Value.absent(),
                Value<int> level = const Value.absent(),
                Value<String> unit = const Value.absent(),
                Value<DateTime> lastChecked = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PrinterSuppliesCompanion(
                id: id,
                printerId: printerId,
                supplyType: supplyType,
                level: level,
                unit: unit,
                lastChecked: lastChecked,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String printerId,
                required String supplyType,
                required int level,
                required String unit,
                required DateTime lastChecked,
                Value<int> rowid = const Value.absent(),
              }) => PrinterSuppliesCompanion.insert(
                id: id,
                printerId: printerId,
                supplyType: supplyType,
                level: level,
                unit: unit,
                lastChecked: lastChecked,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PrinterSuppliesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PrinterSuppliesTable,
      PrinterSupplyData,
      $$PrinterSuppliesTableFilterComposer,
      $$PrinterSuppliesTableOrderingComposer,
      $$PrinterSuppliesTableAnnotationComposer,
      $$PrinterSuppliesTableCreateCompanionBuilder,
      $$PrinterSuppliesTableUpdateCompanionBuilder,
      (
        PrinterSupplyData,
        BaseReferences<_$AppDatabase, $PrinterSuppliesTable, PrinterSupplyData>,
      ),
      PrinterSupplyData,
      PrefetchHooks Function()
    >;
typedef $$PrinterMaintenancesTableCreateCompanionBuilder =
    PrinterMaintenancesCompanion Function({
      required String id,
      required String printerId,
      required String maintenanceType,
      Value<String?> description,
      Value<String?> performedBy,
      required DateTime performedAt,
      Value<String?> notes,
      Value<int> rowid,
    });
typedef $$PrinterMaintenancesTableUpdateCompanionBuilder =
    PrinterMaintenancesCompanion Function({
      Value<String> id,
      Value<String> printerId,
      Value<String> maintenanceType,
      Value<String?> description,
      Value<String?> performedBy,
      Value<DateTime> performedAt,
      Value<String?> notes,
      Value<int> rowid,
    });

class $$PrinterMaintenancesTableFilterComposer
    extends Composer<_$AppDatabase, $PrinterMaintenancesTable> {
  $$PrinterMaintenancesTableFilterComposer({
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

  ColumnFilters<String> get printerId => $composableBuilder(
    column: $table.printerId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get maintenanceType => $composableBuilder(
    column: $table.maintenanceType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get performedBy => $composableBuilder(
    column: $table.performedBy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get performedAt => $composableBuilder(
    column: $table.performedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PrinterMaintenancesTableOrderingComposer
    extends Composer<_$AppDatabase, $PrinterMaintenancesTable> {
  $$PrinterMaintenancesTableOrderingComposer({
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

  ColumnOrderings<String> get printerId => $composableBuilder(
    column: $table.printerId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get maintenanceType => $composableBuilder(
    column: $table.maintenanceType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get performedBy => $composableBuilder(
    column: $table.performedBy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get performedAt => $composableBuilder(
    column: $table.performedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PrinterMaintenancesTableAnnotationComposer
    extends Composer<_$AppDatabase, $PrinterMaintenancesTable> {
  $$PrinterMaintenancesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get printerId =>
      $composableBuilder(column: $table.printerId, builder: (column) => column);

  GeneratedColumn<String> get maintenanceType => $composableBuilder(
    column: $table.maintenanceType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get performedBy => $composableBuilder(
    column: $table.performedBy,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get performedAt => $composableBuilder(
    column: $table.performedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);
}

class $$PrinterMaintenancesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PrinterMaintenancesTable,
          PrinterMaintenanceData,
          $$PrinterMaintenancesTableFilterComposer,
          $$PrinterMaintenancesTableOrderingComposer,
          $$PrinterMaintenancesTableAnnotationComposer,
          $$PrinterMaintenancesTableCreateCompanionBuilder,
          $$PrinterMaintenancesTableUpdateCompanionBuilder,
          (
            PrinterMaintenanceData,
            BaseReferences<
              _$AppDatabase,
              $PrinterMaintenancesTable,
              PrinterMaintenanceData
            >,
          ),
          PrinterMaintenanceData,
          PrefetchHooks Function()
        > {
  $$PrinterMaintenancesTableTableManager(
    _$AppDatabase db,
    $PrinterMaintenancesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PrinterMaintenancesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PrinterMaintenancesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$PrinterMaintenancesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> printerId = const Value.absent(),
                Value<String> maintenanceType = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> performedBy = const Value.absent(),
                Value<DateTime> performedAt = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PrinterMaintenancesCompanion(
                id: id,
                printerId: printerId,
                maintenanceType: maintenanceType,
                description: description,
                performedBy: performedBy,
                performedAt: performedAt,
                notes: notes,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String printerId,
                required String maintenanceType,
                Value<String?> description = const Value.absent(),
                Value<String?> performedBy = const Value.absent(),
                required DateTime performedAt,
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PrinterMaintenancesCompanion.insert(
                id: id,
                printerId: printerId,
                maintenanceType: maintenanceType,
                description: description,
                performedBy: performedBy,
                performedAt: performedAt,
                notes: notes,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PrinterMaintenancesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PrinterMaintenancesTable,
      PrinterMaintenanceData,
      $$PrinterMaintenancesTableFilterComposer,
      $$PrinterMaintenancesTableOrderingComposer,
      $$PrinterMaintenancesTableAnnotationComposer,
      $$PrinterMaintenancesTableCreateCompanionBuilder,
      $$PrinterMaintenancesTableUpdateCompanionBuilder,
      (
        PrinterMaintenanceData,
        BaseReferences<
          _$AppDatabase,
          $PrinterMaintenancesTable,
          PrinterMaintenanceData
        >,
      ),
      PrinterMaintenanceData,
      PrefetchHooks Function()
    >;
typedef $$PrinterCountersTableCreateCompanionBuilder =
    PrinterCountersCompanion Function({
      required String id,
      required String printerId,
      Value<int> totalPagesPrinted,
      Value<int> totalJobsProcessed,
      Value<int> totalBytesPrinted,
      Value<DateTime?> lastReset,
      Value<int> rowid,
    });
typedef $$PrinterCountersTableUpdateCompanionBuilder =
    PrinterCountersCompanion Function({
      Value<String> id,
      Value<String> printerId,
      Value<int> totalPagesPrinted,
      Value<int> totalJobsProcessed,
      Value<int> totalBytesPrinted,
      Value<DateTime?> lastReset,
      Value<int> rowid,
    });

class $$PrinterCountersTableFilterComposer
    extends Composer<_$AppDatabase, $PrinterCountersTable> {
  $$PrinterCountersTableFilterComposer({
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

  ColumnFilters<String> get printerId => $composableBuilder(
    column: $table.printerId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalPagesPrinted => $composableBuilder(
    column: $table.totalPagesPrinted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalJobsProcessed => $composableBuilder(
    column: $table.totalJobsProcessed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalBytesPrinted => $composableBuilder(
    column: $table.totalBytesPrinted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastReset => $composableBuilder(
    column: $table.lastReset,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PrinterCountersTableOrderingComposer
    extends Composer<_$AppDatabase, $PrinterCountersTable> {
  $$PrinterCountersTableOrderingComposer({
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

  ColumnOrderings<String> get printerId => $composableBuilder(
    column: $table.printerId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalPagesPrinted => $composableBuilder(
    column: $table.totalPagesPrinted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalJobsProcessed => $composableBuilder(
    column: $table.totalJobsProcessed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalBytesPrinted => $composableBuilder(
    column: $table.totalBytesPrinted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastReset => $composableBuilder(
    column: $table.lastReset,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PrinterCountersTableAnnotationComposer
    extends Composer<_$AppDatabase, $PrinterCountersTable> {
  $$PrinterCountersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get printerId =>
      $composableBuilder(column: $table.printerId, builder: (column) => column);

  GeneratedColumn<int> get totalPagesPrinted => $composableBuilder(
    column: $table.totalPagesPrinted,
    builder: (column) => column,
  );

  GeneratedColumn<int> get totalJobsProcessed => $composableBuilder(
    column: $table.totalJobsProcessed,
    builder: (column) => column,
  );

  GeneratedColumn<int> get totalBytesPrinted => $composableBuilder(
    column: $table.totalBytesPrinted,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastReset =>
      $composableBuilder(column: $table.lastReset, builder: (column) => column);
}

class $$PrinterCountersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PrinterCountersTable,
          PrinterCounterData,
          $$PrinterCountersTableFilterComposer,
          $$PrinterCountersTableOrderingComposer,
          $$PrinterCountersTableAnnotationComposer,
          $$PrinterCountersTableCreateCompanionBuilder,
          $$PrinterCountersTableUpdateCompanionBuilder,
          (
            PrinterCounterData,
            BaseReferences<
              _$AppDatabase,
              $PrinterCountersTable,
              PrinterCounterData
            >,
          ),
          PrinterCounterData,
          PrefetchHooks Function()
        > {
  $$PrinterCountersTableTableManager(
    _$AppDatabase db,
    $PrinterCountersTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PrinterCountersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PrinterCountersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PrinterCountersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> printerId = const Value.absent(),
                Value<int> totalPagesPrinted = const Value.absent(),
                Value<int> totalJobsProcessed = const Value.absent(),
                Value<int> totalBytesPrinted = const Value.absent(),
                Value<DateTime?> lastReset = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PrinterCountersCompanion(
                id: id,
                printerId: printerId,
                totalPagesPrinted: totalPagesPrinted,
                totalJobsProcessed: totalJobsProcessed,
                totalBytesPrinted: totalBytesPrinted,
                lastReset: lastReset,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String printerId,
                Value<int> totalPagesPrinted = const Value.absent(),
                Value<int> totalJobsProcessed = const Value.absent(),
                Value<int> totalBytesPrinted = const Value.absent(),
                Value<DateTime?> lastReset = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PrinterCountersCompanion.insert(
                id: id,
                printerId: printerId,
                totalPagesPrinted: totalPagesPrinted,
                totalJobsProcessed: totalJobsProcessed,
                totalBytesPrinted: totalBytesPrinted,
                lastReset: lastReset,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PrinterCountersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PrinterCountersTable,
      PrinterCounterData,
      $$PrinterCountersTableFilterComposer,
      $$PrinterCountersTableOrderingComposer,
      $$PrinterCountersTableAnnotationComposer,
      $$PrinterCountersTableCreateCompanionBuilder,
      $$PrinterCountersTableUpdateCompanionBuilder,
      (
        PrinterCounterData,
        BaseReferences<
          _$AppDatabase,
          $PrinterCountersTable,
          PrinterCounterData
        >,
      ),
      PrinterCounterData,
      PrefetchHooks Function()
    >;
typedef $$PrinterHealthTableTableCreateCompanionBuilder =
    PrinterHealthTableCompanion Function({
      required String printerId,
      required int healthScore,
      required double errorRate,
      required double availability,
      required int avgResponseTimeMs,
      required int supplyScore,
      required DateTime lastCheck,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$PrinterHealthTableTableUpdateCompanionBuilder =
    PrinterHealthTableCompanion Function({
      Value<String> printerId,
      Value<int> healthScore,
      Value<double> errorRate,
      Value<double> availability,
      Value<int> avgResponseTimeMs,
      Value<int> supplyScore,
      Value<DateTime> lastCheck,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$PrinterHealthTableTableFilterComposer
    extends Composer<_$AppDatabase, $PrinterHealthTableTable> {
  $$PrinterHealthTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get printerId => $composableBuilder(
    column: $table.printerId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get healthScore => $composableBuilder(
    column: $table.healthScore,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get errorRate => $composableBuilder(
    column: $table.errorRate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get availability => $composableBuilder(
    column: $table.availability,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get avgResponseTimeMs => $composableBuilder(
    column: $table.avgResponseTimeMs,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get supplyScore => $composableBuilder(
    column: $table.supplyScore,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastCheck => $composableBuilder(
    column: $table.lastCheck,
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

class $$PrinterHealthTableTableOrderingComposer
    extends Composer<_$AppDatabase, $PrinterHealthTableTable> {
  $$PrinterHealthTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get printerId => $composableBuilder(
    column: $table.printerId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get healthScore => $composableBuilder(
    column: $table.healthScore,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get errorRate => $composableBuilder(
    column: $table.errorRate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get availability => $composableBuilder(
    column: $table.availability,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get avgResponseTimeMs => $composableBuilder(
    column: $table.avgResponseTimeMs,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get supplyScore => $composableBuilder(
    column: $table.supplyScore,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastCheck => $composableBuilder(
    column: $table.lastCheck,
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

class $$PrinterHealthTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $PrinterHealthTableTable> {
  $$PrinterHealthTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get printerId =>
      $composableBuilder(column: $table.printerId, builder: (column) => column);

  GeneratedColumn<int> get healthScore => $composableBuilder(
    column: $table.healthScore,
    builder: (column) => column,
  );

  GeneratedColumn<double> get errorRate =>
      $composableBuilder(column: $table.errorRate, builder: (column) => column);

  GeneratedColumn<double> get availability => $composableBuilder(
    column: $table.availability,
    builder: (column) => column,
  );

  GeneratedColumn<int> get avgResponseTimeMs => $composableBuilder(
    column: $table.avgResponseTimeMs,
    builder: (column) => column,
  );

  GeneratedColumn<int> get supplyScore => $composableBuilder(
    column: $table.supplyScore,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastCheck =>
      $composableBuilder(column: $table.lastCheck, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$PrinterHealthTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PrinterHealthTableTable,
          PrinterHealthData,
          $$PrinterHealthTableTableFilterComposer,
          $$PrinterHealthTableTableOrderingComposer,
          $$PrinterHealthTableTableAnnotationComposer,
          $$PrinterHealthTableTableCreateCompanionBuilder,
          $$PrinterHealthTableTableUpdateCompanionBuilder,
          (
            PrinterHealthData,
            BaseReferences<
              _$AppDatabase,
              $PrinterHealthTableTable,
              PrinterHealthData
            >,
          ),
          PrinterHealthData,
          PrefetchHooks Function()
        > {
  $$PrinterHealthTableTableTableManager(
    _$AppDatabase db,
    $PrinterHealthTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PrinterHealthTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PrinterHealthTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PrinterHealthTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> printerId = const Value.absent(),
                Value<int> healthScore = const Value.absent(),
                Value<double> errorRate = const Value.absent(),
                Value<double> availability = const Value.absent(),
                Value<int> avgResponseTimeMs = const Value.absent(),
                Value<int> supplyScore = const Value.absent(),
                Value<DateTime> lastCheck = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PrinterHealthTableCompanion(
                printerId: printerId,
                healthScore: healthScore,
                errorRate: errorRate,
                availability: availability,
                avgResponseTimeMs: avgResponseTimeMs,
                supplyScore: supplyScore,
                lastCheck: lastCheck,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String printerId,
                required int healthScore,
                required double errorRate,
                required double availability,
                required int avgResponseTimeMs,
                required int supplyScore,
                required DateTime lastCheck,
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => PrinterHealthTableCompanion.insert(
                printerId: printerId,
                healthScore: healthScore,
                errorRate: errorRate,
                availability: availability,
                avgResponseTimeMs: avgResponseTimeMs,
                supplyScore: supplyScore,
                lastCheck: lastCheck,
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

typedef $$PrinterHealthTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PrinterHealthTableTable,
      PrinterHealthData,
      $$PrinterHealthTableTableFilterComposer,
      $$PrinterHealthTableTableOrderingComposer,
      $$PrinterHealthTableTableAnnotationComposer,
      $$PrinterHealthTableTableCreateCompanionBuilder,
      $$PrinterHealthTableTableUpdateCompanionBuilder,
      (
        PrinterHealthData,
        BaseReferences<
          _$AppDatabase,
          $PrinterHealthTableTable,
          PrinterHealthData
        >,
      ),
      PrinterHealthData,
      PrefetchHooks Function()
    >;
typedef $$AlertRulesTableTableCreateCompanionBuilder =
    AlertRulesTableCompanion Function({
      required String id,
      required String name,
      required String description,
      required int type,
      Value<bool> enabled,
      required int severity,
      required String thresholds,
      required String actions,
      Value<int?> suppressionTimeMinutes,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$AlertRulesTableTableUpdateCompanionBuilder =
    AlertRulesTableCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> description,
      Value<int> type,
      Value<bool> enabled,
      Value<int> severity,
      Value<String> thresholds,
      Value<String> actions,
      Value<int?> suppressionTimeMinutes,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$AlertRulesTableTableFilterComposer
    extends Composer<_$AppDatabase, $AlertRulesTableTable> {
  $$AlertRulesTableTableFilterComposer({
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

  ColumnFilters<int> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get enabled => $composableBuilder(
    column: $table.enabled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get severity => $composableBuilder(
    column: $table.severity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get thresholds => $composableBuilder(
    column: $table.thresholds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get actions => $composableBuilder(
    column: $table.actions,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get suppressionTimeMinutes => $composableBuilder(
    column: $table.suppressionTimeMinutes,
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

class $$AlertRulesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $AlertRulesTableTable> {
  $$AlertRulesTableTableOrderingComposer({
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

  ColumnOrderings<int> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get enabled => $composableBuilder(
    column: $table.enabled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get severity => $composableBuilder(
    column: $table.severity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get thresholds => $composableBuilder(
    column: $table.thresholds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get actions => $composableBuilder(
    column: $table.actions,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get suppressionTimeMinutes => $composableBuilder(
    column: $table.suppressionTimeMinutes,
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

class $$AlertRulesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $AlertRulesTableTable> {
  $$AlertRulesTableTableAnnotationComposer({
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

  GeneratedColumn<int> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<bool> get enabled =>
      $composableBuilder(column: $table.enabled, builder: (column) => column);

  GeneratedColumn<int> get severity =>
      $composableBuilder(column: $table.severity, builder: (column) => column);

  GeneratedColumn<String> get thresholds => $composableBuilder(
    column: $table.thresholds,
    builder: (column) => column,
  );

  GeneratedColumn<String> get actions =>
      $composableBuilder(column: $table.actions, builder: (column) => column);

  GeneratedColumn<int> get suppressionTimeMinutes => $composableBuilder(
    column: $table.suppressionTimeMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$AlertRulesTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AlertRulesTableTable,
          AlertRuleData,
          $$AlertRulesTableTableFilterComposer,
          $$AlertRulesTableTableOrderingComposer,
          $$AlertRulesTableTableAnnotationComposer,
          $$AlertRulesTableTableCreateCompanionBuilder,
          $$AlertRulesTableTableUpdateCompanionBuilder,
          (
            AlertRuleData,
            BaseReferences<_$AppDatabase, $AlertRulesTableTable, AlertRuleData>,
          ),
          AlertRuleData,
          PrefetchHooks Function()
        > {
  $$AlertRulesTableTableTableManager(
    _$AppDatabase db,
    $AlertRulesTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AlertRulesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AlertRulesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AlertRulesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<int> type = const Value.absent(),
                Value<bool> enabled = const Value.absent(),
                Value<int> severity = const Value.absent(),
                Value<String> thresholds = const Value.absent(),
                Value<String> actions = const Value.absent(),
                Value<int?> suppressionTimeMinutes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AlertRulesTableCompanion(
                id: id,
                name: name,
                description: description,
                type: type,
                enabled: enabled,
                severity: severity,
                thresholds: thresholds,
                actions: actions,
                suppressionTimeMinutes: suppressionTimeMinutes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String description,
                required int type,
                Value<bool> enabled = const Value.absent(),
                required int severity,
                required String thresholds,
                required String actions,
                Value<int?> suppressionTimeMinutes = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => AlertRulesTableCompanion.insert(
                id: id,
                name: name,
                description: description,
                type: type,
                enabled: enabled,
                severity: severity,
                thresholds: thresholds,
                actions: actions,
                suppressionTimeMinutes: suppressionTimeMinutes,
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

typedef $$AlertRulesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AlertRulesTableTable,
      AlertRuleData,
      $$AlertRulesTableTableFilterComposer,
      $$AlertRulesTableTableOrderingComposer,
      $$AlertRulesTableTableAnnotationComposer,
      $$AlertRulesTableTableCreateCompanionBuilder,
      $$AlertRulesTableTableUpdateCompanionBuilder,
      (
        AlertRuleData,
        BaseReferences<_$AppDatabase, $AlertRulesTableTable, AlertRuleData>,
      ),
      AlertRuleData,
      PrefetchHooks Function()
    >;
typedef $$PredictionsTableTableCreateCompanionBuilder =
    PredictionsTableCompanion Function({
      required String id,
      required String printerId,
      required int type,
      required DateTime predictedDate,
      required double confidence,
      required String factors,
      required DateTime createdAt,
      Value<int> status,
      Value<int> rowid,
    });
typedef $$PredictionsTableTableUpdateCompanionBuilder =
    PredictionsTableCompanion Function({
      Value<String> id,
      Value<String> printerId,
      Value<int> type,
      Value<DateTime> predictedDate,
      Value<double> confidence,
      Value<String> factors,
      Value<DateTime> createdAt,
      Value<int> status,
      Value<int> rowid,
    });

class $$PredictionsTableTableFilterComposer
    extends Composer<_$AppDatabase, $PredictionsTableTable> {
  $$PredictionsTableTableFilterComposer({
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

  ColumnFilters<String> get printerId => $composableBuilder(
    column: $table.printerId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get predictedDate => $composableBuilder(
    column: $table.predictedDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get confidence => $composableBuilder(
    column: $table.confidence,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get factors => $composableBuilder(
    column: $table.factors,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PredictionsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $PredictionsTableTable> {
  $$PredictionsTableTableOrderingComposer({
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

  ColumnOrderings<String> get printerId => $composableBuilder(
    column: $table.printerId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get predictedDate => $composableBuilder(
    column: $table.predictedDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get confidence => $composableBuilder(
    column: $table.confidence,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get factors => $composableBuilder(
    column: $table.factors,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PredictionsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $PredictionsTableTable> {
  $$PredictionsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get printerId =>
      $composableBuilder(column: $table.printerId, builder: (column) => column);

  GeneratedColumn<int> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<DateTime> get predictedDate => $composableBuilder(
    column: $table.predictedDate,
    builder: (column) => column,
  );

  GeneratedColumn<double> get confidence => $composableBuilder(
    column: $table.confidence,
    builder: (column) => column,
  );

  GeneratedColumn<String> get factors =>
      $composableBuilder(column: $table.factors, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);
}

class $$PredictionsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PredictionsTableTable,
          PredictionData,
          $$PredictionsTableTableFilterComposer,
          $$PredictionsTableTableOrderingComposer,
          $$PredictionsTableTableAnnotationComposer,
          $$PredictionsTableTableCreateCompanionBuilder,
          $$PredictionsTableTableUpdateCompanionBuilder,
          (
            PredictionData,
            BaseReferences<
              _$AppDatabase,
              $PredictionsTableTable,
              PredictionData
            >,
          ),
          PredictionData,
          PrefetchHooks Function()
        > {
  $$PredictionsTableTableTableManager(
    _$AppDatabase db,
    $PredictionsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PredictionsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PredictionsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PredictionsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> printerId = const Value.absent(),
                Value<int> type = const Value.absent(),
                Value<DateTime> predictedDate = const Value.absent(),
                Value<double> confidence = const Value.absent(),
                Value<String> factors = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> status = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PredictionsTableCompanion(
                id: id,
                printerId: printerId,
                type: type,
                predictedDate: predictedDate,
                confidence: confidence,
                factors: factors,
                createdAt: createdAt,
                status: status,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String printerId,
                required int type,
                required DateTime predictedDate,
                required double confidence,
                required String factors,
                required DateTime createdAt,
                Value<int> status = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PredictionsTableCompanion.insert(
                id: id,
                printerId: printerId,
                type: type,
                predictedDate: predictedDate,
                confidence: confidence,
                factors: factors,
                createdAt: createdAt,
                status: status,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PredictionsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PredictionsTableTable,
      PredictionData,
      $$PredictionsTableTableFilterComposer,
      $$PredictionsTableTableOrderingComposer,
      $$PredictionsTableTableAnnotationComposer,
      $$PredictionsTableTableCreateCompanionBuilder,
      $$PredictionsTableTableUpdateCompanionBuilder,
      (
        PredictionData,
        BaseReferences<_$AppDatabase, $PredictionsTableTable, PredictionData>,
      ),
      PredictionData,
      PrefetchHooks Function()
    >;
typedef $$PatternsTableTableCreateCompanionBuilder =
    PatternsTableCompanion Function({
      required String id,
      required String printerId,
      required int patternType,
      required String description,
      required int occurrenceCount,
      required DateTime lastOccurrence,
      required double confidence,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$PatternsTableTableUpdateCompanionBuilder =
    PatternsTableCompanion Function({
      Value<String> id,
      Value<String> printerId,
      Value<int> patternType,
      Value<String> description,
      Value<int> occurrenceCount,
      Value<DateTime> lastOccurrence,
      Value<double> confidence,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$PatternsTableTableFilterComposer
    extends Composer<_$AppDatabase, $PatternsTableTable> {
  $$PatternsTableTableFilterComposer({
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

  ColumnFilters<String> get printerId => $composableBuilder(
    column: $table.printerId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get patternType => $composableBuilder(
    column: $table.patternType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get occurrenceCount => $composableBuilder(
    column: $table.occurrenceCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastOccurrence => $composableBuilder(
    column: $table.lastOccurrence,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get confidence => $composableBuilder(
    column: $table.confidence,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PatternsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $PatternsTableTable> {
  $$PatternsTableTableOrderingComposer({
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

  ColumnOrderings<String> get printerId => $composableBuilder(
    column: $table.printerId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get patternType => $composableBuilder(
    column: $table.patternType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get occurrenceCount => $composableBuilder(
    column: $table.occurrenceCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastOccurrence => $composableBuilder(
    column: $table.lastOccurrence,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get confidence => $composableBuilder(
    column: $table.confidence,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PatternsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $PatternsTableTable> {
  $$PatternsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get printerId =>
      $composableBuilder(column: $table.printerId, builder: (column) => column);

  GeneratedColumn<int> get patternType => $composableBuilder(
    column: $table.patternType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<int> get occurrenceCount => $composableBuilder(
    column: $table.occurrenceCount,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastOccurrence => $composableBuilder(
    column: $table.lastOccurrence,
    builder: (column) => column,
  );

  GeneratedColumn<double> get confidence => $composableBuilder(
    column: $table.confidence,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$PatternsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PatternsTableTable,
          PatternData,
          $$PatternsTableTableFilterComposer,
          $$PatternsTableTableOrderingComposer,
          $$PatternsTableTableAnnotationComposer,
          $$PatternsTableTableCreateCompanionBuilder,
          $$PatternsTableTableUpdateCompanionBuilder,
          (
            PatternData,
            BaseReferences<_$AppDatabase, $PatternsTableTable, PatternData>,
          ),
          PatternData,
          PrefetchHooks Function()
        > {
  $$PatternsTableTableTableManager(_$AppDatabase db, $PatternsTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PatternsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PatternsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PatternsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> printerId = const Value.absent(),
                Value<int> patternType = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<int> occurrenceCount = const Value.absent(),
                Value<DateTime> lastOccurrence = const Value.absent(),
                Value<double> confidence = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PatternsTableCompanion(
                id: id,
                printerId: printerId,
                patternType: patternType,
                description: description,
                occurrenceCount: occurrenceCount,
                lastOccurrence: lastOccurrence,
                confidence: confidence,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String printerId,
                required int patternType,
                required String description,
                required int occurrenceCount,
                required DateTime lastOccurrence,
                required double confidence,
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => PatternsTableCompanion.insert(
                id: id,
                printerId: printerId,
                patternType: patternType,
                description: description,
                occurrenceCount: occurrenceCount,
                lastOccurrence: lastOccurrence,
                confidence: confidence,
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

typedef $$PatternsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PatternsTableTable,
      PatternData,
      $$PatternsTableTableFilterComposer,
      $$PatternsTableTableOrderingComposer,
      $$PatternsTableTableAnnotationComposer,
      $$PatternsTableTableCreateCompanionBuilder,
      $$PatternsTableTableUpdateCompanionBuilder,
      (
        PatternData,
        BaseReferences<_$AppDatabase, $PatternsTableTable, PatternData>,
      ),
      PatternData,
      PrefetchHooks Function()
    >;
typedef $$ActionRulesTableTableCreateCompanionBuilder =
    ActionRulesTableCompanion Function({
      required String id,
      required String name,
      required String description,
      required int triggerType,
      required int actionType,
      required String conditions,
      Value<bool> enabled,
      Value<DateTime?> lastExecuted,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$ActionRulesTableTableUpdateCompanionBuilder =
    ActionRulesTableCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> description,
      Value<int> triggerType,
      Value<int> actionType,
      Value<String> conditions,
      Value<bool> enabled,
      Value<DateTime?> lastExecuted,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$ActionRulesTableTableFilterComposer
    extends Composer<_$AppDatabase, $ActionRulesTableTable> {
  $$ActionRulesTableTableFilterComposer({
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

  ColumnFilters<int> get triggerType => $composableBuilder(
    column: $table.triggerType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get actionType => $composableBuilder(
    column: $table.actionType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get conditions => $composableBuilder(
    column: $table.conditions,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get enabled => $composableBuilder(
    column: $table.enabled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastExecuted => $composableBuilder(
    column: $table.lastExecuted,
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

class $$ActionRulesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ActionRulesTableTable> {
  $$ActionRulesTableTableOrderingComposer({
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

  ColumnOrderings<int> get triggerType => $composableBuilder(
    column: $table.triggerType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get actionType => $composableBuilder(
    column: $table.actionType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get conditions => $composableBuilder(
    column: $table.conditions,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get enabled => $composableBuilder(
    column: $table.enabled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastExecuted => $composableBuilder(
    column: $table.lastExecuted,
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

class $$ActionRulesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ActionRulesTableTable> {
  $$ActionRulesTableTableAnnotationComposer({
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

  GeneratedColumn<int> get triggerType => $composableBuilder(
    column: $table.triggerType,
    builder: (column) => column,
  );

  GeneratedColumn<int> get actionType => $composableBuilder(
    column: $table.actionType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get conditions => $composableBuilder(
    column: $table.conditions,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get enabled =>
      $composableBuilder(column: $table.enabled, builder: (column) => column);

  GeneratedColumn<DateTime> get lastExecuted => $composableBuilder(
    column: $table.lastExecuted,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$ActionRulesTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ActionRulesTableTable,
          ActionRuleData,
          $$ActionRulesTableTableFilterComposer,
          $$ActionRulesTableTableOrderingComposer,
          $$ActionRulesTableTableAnnotationComposer,
          $$ActionRulesTableTableCreateCompanionBuilder,
          $$ActionRulesTableTableUpdateCompanionBuilder,
          (
            ActionRuleData,
            BaseReferences<
              _$AppDatabase,
              $ActionRulesTableTable,
              ActionRuleData
            >,
          ),
          ActionRuleData,
          PrefetchHooks Function()
        > {
  $$ActionRulesTableTableTableManager(
    _$AppDatabase db,
    $ActionRulesTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ActionRulesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ActionRulesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ActionRulesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<int> triggerType = const Value.absent(),
                Value<int> actionType = const Value.absent(),
                Value<String> conditions = const Value.absent(),
                Value<bool> enabled = const Value.absent(),
                Value<DateTime?> lastExecuted = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ActionRulesTableCompanion(
                id: id,
                name: name,
                description: description,
                triggerType: triggerType,
                actionType: actionType,
                conditions: conditions,
                enabled: enabled,
                lastExecuted: lastExecuted,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String description,
                required int triggerType,
                required int actionType,
                required String conditions,
                Value<bool> enabled = const Value.absent(),
                Value<DateTime?> lastExecuted = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => ActionRulesTableCompanion.insert(
                id: id,
                name: name,
                description: description,
                triggerType: triggerType,
                actionType: actionType,
                conditions: conditions,
                enabled: enabled,
                lastExecuted: lastExecuted,
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

typedef $$ActionRulesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ActionRulesTableTable,
      ActionRuleData,
      $$ActionRulesTableTableFilterComposer,
      $$ActionRulesTableTableOrderingComposer,
      $$ActionRulesTableTableAnnotationComposer,
      $$ActionRulesTableTableCreateCompanionBuilder,
      $$ActionRulesTableTableUpdateCompanionBuilder,
      (
        ActionRuleData,
        BaseReferences<_$AppDatabase, $ActionRulesTableTable, ActionRuleData>,
      ),
      ActionRuleData,
      PrefetchHooks Function()
    >;
typedef $$AutomatedActionsTableTableCreateCompanionBuilder =
    AutomatedActionsTableCompanion Function({
      required String id,
      required String ruleId,
      required String printerId,
      required int actionType,
      required String parameters,
      required int result,
      Value<String?> errorMessage,
      required DateTime executedAt,
      Value<int> rowid,
    });
typedef $$AutomatedActionsTableTableUpdateCompanionBuilder =
    AutomatedActionsTableCompanion Function({
      Value<String> id,
      Value<String> ruleId,
      Value<String> printerId,
      Value<int> actionType,
      Value<String> parameters,
      Value<int> result,
      Value<String?> errorMessage,
      Value<DateTime> executedAt,
      Value<int> rowid,
    });

class $$AutomatedActionsTableTableFilterComposer
    extends Composer<_$AppDatabase, $AutomatedActionsTableTable> {
  $$AutomatedActionsTableTableFilterComposer({
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

  ColumnFilters<String> get ruleId => $composableBuilder(
    column: $table.ruleId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get printerId => $composableBuilder(
    column: $table.printerId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get actionType => $composableBuilder(
    column: $table.actionType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get parameters => $composableBuilder(
    column: $table.parameters,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get result => $composableBuilder(
    column: $table.result,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get errorMessage => $composableBuilder(
    column: $table.errorMessage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get executedAt => $composableBuilder(
    column: $table.executedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AutomatedActionsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $AutomatedActionsTableTable> {
  $$AutomatedActionsTableTableOrderingComposer({
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

  ColumnOrderings<String> get ruleId => $composableBuilder(
    column: $table.ruleId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get printerId => $composableBuilder(
    column: $table.printerId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get actionType => $composableBuilder(
    column: $table.actionType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get parameters => $composableBuilder(
    column: $table.parameters,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get result => $composableBuilder(
    column: $table.result,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get errorMessage => $composableBuilder(
    column: $table.errorMessage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get executedAt => $composableBuilder(
    column: $table.executedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AutomatedActionsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $AutomatedActionsTableTable> {
  $$AutomatedActionsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get ruleId =>
      $composableBuilder(column: $table.ruleId, builder: (column) => column);

  GeneratedColumn<String> get printerId =>
      $composableBuilder(column: $table.printerId, builder: (column) => column);

  GeneratedColumn<int> get actionType => $composableBuilder(
    column: $table.actionType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get parameters => $composableBuilder(
    column: $table.parameters,
    builder: (column) => column,
  );

  GeneratedColumn<int> get result =>
      $composableBuilder(column: $table.result, builder: (column) => column);

  GeneratedColumn<String> get errorMessage => $composableBuilder(
    column: $table.errorMessage,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get executedAt => $composableBuilder(
    column: $table.executedAt,
    builder: (column) => column,
  );
}

class $$AutomatedActionsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AutomatedActionsTableTable,
          AutomatedActionData,
          $$AutomatedActionsTableTableFilterComposer,
          $$AutomatedActionsTableTableOrderingComposer,
          $$AutomatedActionsTableTableAnnotationComposer,
          $$AutomatedActionsTableTableCreateCompanionBuilder,
          $$AutomatedActionsTableTableUpdateCompanionBuilder,
          (
            AutomatedActionData,
            BaseReferences<
              _$AppDatabase,
              $AutomatedActionsTableTable,
              AutomatedActionData
            >,
          ),
          AutomatedActionData,
          PrefetchHooks Function()
        > {
  $$AutomatedActionsTableTableTableManager(
    _$AppDatabase db,
    $AutomatedActionsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AutomatedActionsTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$AutomatedActionsTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$AutomatedActionsTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> ruleId = const Value.absent(),
                Value<String> printerId = const Value.absent(),
                Value<int> actionType = const Value.absent(),
                Value<String> parameters = const Value.absent(),
                Value<int> result = const Value.absent(),
                Value<String?> errorMessage = const Value.absent(),
                Value<DateTime> executedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AutomatedActionsTableCompanion(
                id: id,
                ruleId: ruleId,
                printerId: printerId,
                actionType: actionType,
                parameters: parameters,
                result: result,
                errorMessage: errorMessage,
                executedAt: executedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String ruleId,
                required String printerId,
                required int actionType,
                required String parameters,
                required int result,
                Value<String?> errorMessage = const Value.absent(),
                required DateTime executedAt,
                Value<int> rowid = const Value.absent(),
              }) => AutomatedActionsTableCompanion.insert(
                id: id,
                ruleId: ruleId,
                printerId: printerId,
                actionType: actionType,
                parameters: parameters,
                result: result,
                errorMessage: errorMessage,
                executedAt: executedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AutomatedActionsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AutomatedActionsTableTable,
      AutomatedActionData,
      $$AutomatedActionsTableTableFilterComposer,
      $$AutomatedActionsTableTableOrderingComposer,
      $$AutomatedActionsTableTableAnnotationComposer,
      $$AutomatedActionsTableTableCreateCompanionBuilder,
      $$AutomatedActionsTableTableUpdateCompanionBuilder,
      (
        AutomatedActionData,
        BaseReferences<
          _$AppDatabase,
          $AutomatedActionsTableTable,
          AutomatedActionData
        >,
      ),
      AutomatedActionData,
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
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
  $$PrinterSuppliesTableTableManager get printerSupplies =>
      $$PrinterSuppliesTableTableManager(_db, _db.printerSupplies);
  $$PrinterMaintenancesTableTableManager get printerMaintenances =>
      $$PrinterMaintenancesTableTableManager(_db, _db.printerMaintenances);
  $$PrinterCountersTableTableManager get printerCounters =>
      $$PrinterCountersTableTableManager(_db, _db.printerCounters);
  $$PrinterHealthTableTableTableManager get printerHealthTable =>
      $$PrinterHealthTableTableTableManager(_db, _db.printerHealthTable);
  $$AlertRulesTableTableTableManager get alertRulesTable =>
      $$AlertRulesTableTableTableManager(_db, _db.alertRulesTable);
  $$PredictionsTableTableTableManager get predictionsTable =>
      $$PredictionsTableTableTableManager(_db, _db.predictionsTable);
  $$PatternsTableTableTableManager get patternsTable =>
      $$PatternsTableTableTableManager(_db, _db.patternsTable);
  $$ActionRulesTableTableTableManager get actionRulesTable =>
      $$ActionRulesTableTableTableManager(_db, _db.actionRulesTable);
  $$AutomatedActionsTableTableTableManager get automatedActionsTable =>
      $$AutomatedActionsTableTableTableManager(_db, _db.automatedActionsTable);
}
