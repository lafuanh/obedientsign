// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// ignore_for_file: type=lint
class JadwalData extends DataClass implements Insertable<JadwalData> {
  final int id;
  final String waktuNama;
  final String alarmMode;
  final String waktuSholat;
  final DateTime tanggalSholat;
  const JadwalData(
      {required this.id,
      required this.waktuNama,
      required this.alarmMode,
      required this.waktuSholat,
      required this.tanggalSholat});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_name'] = Variable<String>(waktuNama);
    map['user_name'] = Variable<String>(alarmMode);
    map['user_name'] = Variable<String>(waktuSholat);
    map['date_of_sholat'] = Variable<DateTime>(tanggalSholat);
    return map;
  }

  JadwalCompanion toCompanion(bool nullToAbsent) {
    return JadwalCompanion(
      id: Value(id),
      waktuNama: Value(waktuNama),
      alarmMode: Value(alarmMode),
      waktuSholat: Value(waktuSholat),
      tanggalSholat: Value(tanggalSholat),
    );
  }

  factory JadwalData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return JadwalData(
      id: serializer.fromJson<int>(json['id']),
      waktuNama: serializer.fromJson<String>(json['waktuNama']),
      alarmMode: serializer.fromJson<String>(json['alarmMode']),
      waktuSholat: serializer.fromJson<String>(json['waktuSholat']),
      tanggalSholat: serializer.fromJson<DateTime>(json['tanggalSholat']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'waktuNama': serializer.toJson<String>(waktuNama),
      'alarmMode': serializer.toJson<String>(alarmMode),
      'waktuSholat': serializer.toJson<String>(waktuSholat),
      'tanggalSholat': serializer.toJson<DateTime>(tanggalSholat),
    };
  }

  JadwalData copyWith(
          {int? id,
          String? waktuNama,
          String? alarmMode,
          String? waktuSholat,
          DateTime? tanggalSholat}) =>
      JadwalData(
        id: id ?? this.id,
        waktuNama: waktuNama ?? this.waktuNama,
        alarmMode: alarmMode ?? this.alarmMode,
        waktuSholat: waktuSholat ?? this.waktuSholat,
        tanggalSholat: tanggalSholat ?? this.tanggalSholat,
      );
  @override
  String toString() {
    return (StringBuffer('JadwalData(')
          ..write('id: $id, ')
          ..write('waktuNama: $waktuNama, ')
          ..write('alarmMode: $alarmMode, ')
          ..write('waktuSholat: $waktuSholat, ')
          ..write('tanggalSholat: $tanggalSholat')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, waktuNama, alarmMode, waktuSholat, tanggalSholat);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is JadwalData &&
          other.id == this.id &&
          other.waktuNama == this.waktuNama &&
          other.alarmMode == this.alarmMode &&
          other.waktuSholat == this.waktuSholat &&
          other.tanggalSholat == this.tanggalSholat);
}

class JadwalCompanion extends UpdateCompanion<JadwalData> {
  final Value<int> id;
  final Value<String> waktuNama;
  final Value<String> alarmMode;
  final Value<String> waktuSholat;
  final Value<DateTime> tanggalSholat;
  const JadwalCompanion({
    this.id = const Value.absent(),
    this.waktuNama = const Value.absent(),
    this.alarmMode = const Value.absent(),
    this.waktuSholat = const Value.absent(),
    this.tanggalSholat = const Value.absent(),
  });
  JadwalCompanion.insert({
    this.id = const Value.absent(),
    required String waktuNama,
    required String alarmMode,
    required String waktuSholat,
    required DateTime tanggalSholat,
  })  : waktuNama = Value(waktuNama),
        alarmMode = Value(alarmMode),
        waktuSholat = Value(waktuSholat),
        tanggalSholat = Value(tanggalSholat);
  static Insertable<JadwalData> custom({
    Expression<int>? id,
    Expression<String>? waktuNama,
    Expression<String>? alarmMode,
    Expression<String>? waktuSholat,
    Expression<DateTime>? tanggalSholat,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (waktuNama != null) 'user_name': waktuNama,
      if (alarmMode != null) 'user_name': alarmMode,
      if (waktuSholat != null) 'user_name': waktuSholat,
      if (tanggalSholat != null) 'date_of_sholat': tanggalSholat,
    });
  }

  JadwalCompanion copyWith(
      {Value<int>? id,
      Value<String>? waktuNama,
      Value<String>? alarmMode,
      Value<String>? waktuSholat,
      Value<DateTime>? tanggalSholat}) {
    return JadwalCompanion(
      id: id ?? this.id,
      waktuNama: waktuNama ?? this.waktuNama,
      alarmMode: alarmMode ?? this.alarmMode,
      waktuSholat: waktuSholat ?? this.waktuSholat,
      tanggalSholat: tanggalSholat ?? this.tanggalSholat,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (waktuNama.present) {
      map['user_name'] = Variable<String>(waktuNama.value);
    }
    if (alarmMode.present) {
      map['user_name'] = Variable<String>(alarmMode.value);
    }
    if (waktuSholat.present) {
      map['user_name'] = Variable<String>(waktuSholat.value);
    }
    if (tanggalSholat.present) {
      map['date_of_sholat'] = Variable<DateTime>(tanggalSholat.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('JadwalCompanion(')
          ..write('id: $id, ')
          ..write('waktuNama: $waktuNama, ')
          ..write('alarmMode: $alarmMode, ')
          ..write('waktuSholat: $waktuSholat, ')
          ..write('tanggalSholat: $tanggalSholat')
          ..write(')'))
        .toString();
  }
}

class $JadwalTable extends Jadwal with TableInfo<$JadwalTable, JadwalData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $JadwalTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _waktuNamaMeta =
      const VerificationMeta('waktuNama');
  @override
  late final GeneratedColumn<String> waktuNama = GeneratedColumn<String>(
      'user_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _alarmModeMeta =
      const VerificationMeta('alarmMode');
  @override
  late final GeneratedColumn<String> alarmMode = GeneratedColumn<String>(
      'user_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _waktuSholatMeta =
      const VerificationMeta('waktuSholat');
  @override
  late final GeneratedColumn<String> waktuSholat = GeneratedColumn<String>(
      'user_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _tanggalSholatMeta =
      const VerificationMeta('tanggalSholat');
  @override
  late final GeneratedColumn<DateTime> tanggalSholat =
      GeneratedColumn<DateTime>('date_of_sholat', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, waktuNama, alarmMode, waktuSholat, tanggalSholat];
  @override
  String get aliasedName => _alias ?? 'jadwal';
  @override
  String get actualTableName => 'jadwal';
  @override
  VerificationContext validateIntegrity(Insertable<JadwalData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_name')) {
      context.handle(_waktuNamaMeta,
          waktuNama.isAcceptableOrUnknown(data['user_name']!, _waktuNamaMeta));
    } else if (isInserting) {
      context.missing(_waktuNamaMeta);
    }
    if (data.containsKey('user_name')) {
      context.handle(_alarmModeMeta,
          alarmMode.isAcceptableOrUnknown(data['user_name']!, _alarmModeMeta));
    } else if (isInserting) {
      context.missing(_alarmModeMeta);
    }
    if (data.containsKey('user_name')) {
      context.handle(
          _waktuSholatMeta,
          waktuSholat.isAcceptableOrUnknown(
              data['user_name']!, _waktuSholatMeta));
    } else if (isInserting) {
      context.missing(_waktuSholatMeta);
    }
    if (data.containsKey('date_of_sholat')) {
      context.handle(
          _tanggalSholatMeta,
          tanggalSholat.isAcceptableOrUnknown(
              data['date_of_sholat']!, _tanggalSholatMeta));
    } else if (isInserting) {
      context.missing(_tanggalSholatMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  JadwalData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return JadwalData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      waktuNama: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_name'])!,
      alarmMode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_name'])!,
      waktuSholat: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_name'])!,
      tanggalSholat: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}date_of_sholat'])!,
    );
  }

  @override
  $JadwalTable createAlias(String alias) {
    return $JadwalTable(attachedDatabase, alias);
  }
}

class Setting extends DataClass implements Insertable<Setting> {
  final int id;
  final String value;
  final String description;
  const Setting(
      {required this.id, required this.value, required this.description});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_value'] = Variable<String>(value);
    map['description'] = Variable<String>(description);
    return map;
  }

  SettingsCompanion toCompanion(bool nullToAbsent) {
    return SettingsCompanion(
      id: Value(id),
      value: Value(value),
      description: Value(description),
    );
  }

  factory Setting.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Setting(
      id: serializer.fromJson<int>(json['id']),
      value: serializer.fromJson<String>(json['value']),
      description: serializer.fromJson<String>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'value': serializer.toJson<String>(value),
      'description': serializer.toJson<String>(description),
    };
  }

  Setting copyWith({int? id, String? value, String? description}) => Setting(
        id: id ?? this.id,
        value: value ?? this.value,
        description: description ?? this.description,
      );
  @override
  String toString() {
    return (StringBuffer('Setting(')
          ..write('id: $id, ')
          ..write('value: $value, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, value, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Setting &&
          other.id == this.id &&
          other.value == this.value &&
          other.description == this.description);
}

class SettingsCompanion extends UpdateCompanion<Setting> {
  final Value<int> id;
  final Value<String> value;
  final Value<String> description;
  const SettingsCompanion({
    this.id = const Value.absent(),
    this.value = const Value.absent(),
    this.description = const Value.absent(),
  });
  SettingsCompanion.insert({
    this.id = const Value.absent(),
    required String value,
    required String description,
  })  : value = Value(value),
        description = Value(description);
  static Insertable<Setting> custom({
    Expression<int>? id,
    Expression<String>? value,
    Expression<String>? description,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (value != null) 'user_value': value,
      if (description != null) 'description': description,
    });
  }

  SettingsCompanion copyWith(
      {Value<int>? id, Value<String>? value, Value<String>? description}) {
    return SettingsCompanion(
      id: id ?? this.id,
      value: value ?? this.value,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (value.present) {
      map['user_value'] = Variable<String>(value.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SettingsCompanion(')
          ..write('id: $id, ')
          ..write('value: $value, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }
}

class $SettingsTable extends Settings with TableInfo<$SettingsTable, Setting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
      'user_value', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, value, description];
  @override
  String get aliasedName => _alias ?? 'settings';
  @override
  String get actualTableName => 'settings';
  @override
  VerificationContext validateIntegrity(Insertable<Setting> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_value')) {
      context.handle(_valueMeta,
          value.isAcceptableOrUnknown(data['user_value']!, _valueMeta));
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Setting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Setting(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      value: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_value'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
    );
  }

  @override
  $SettingsTable createAlias(String alias) {
    return $SettingsTable(attachedDatabase, alias);
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  late final $JadwalTable jadwal = $JadwalTable(this);
  late final $SettingsTable settings = $SettingsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [jadwal, settings];
}
