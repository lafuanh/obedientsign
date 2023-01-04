// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// ignore_for_file: type=lint
class Setting extends DataClass implements Insertable<Setting> {
  final String value;
  final String name;
  const Setting({required this.value, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['settings_value'] = Variable<String>(value);
    map['name'] = Variable<String>(name);
    return map;
  }

  SettingsCompanion toCompanion(bool nullToAbsent) {
    return SettingsCompanion(
      value: Value(value),
      name: Value(name),
    );
  }

  factory Setting.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Setting(
      value: serializer.fromJson<String>(json['value']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'value': serializer.toJson<String>(value),
      'name': serializer.toJson<String>(name),
    };
  }

  Setting copyWith({String? value, String? name}) => Setting(
        value: value ?? this.value,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('Setting(')
          ..write('value: $value, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(value, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Setting &&
          other.value == this.value &&
          other.name == this.name);
}

class SettingsCompanion extends UpdateCompanion<Setting> {
  final Value<String> value;
  final Value<String> name;
  const SettingsCompanion({
    this.value = const Value.absent(),
    this.name = const Value.absent(),
  });
  SettingsCompanion.insert({
    required String value,
    required String name,
  })  : value = Value(value),
        name = Value(name);
  static Insertable<Setting> custom({
    Expression<String>? value,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (value != null) 'settings_value': value,
      if (name != null) 'name': name,
    });
  }

  SettingsCompanion copyWith({Value<String>? value, Value<String>? name}) {
    return SettingsCompanion(
      value: value ?? this.value,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (value.present) {
      map['settings_value'] = Variable<String>(value.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SettingsCompanion(')
          ..write('value: $value, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $SettingsTable extends Settings with TableInfo<$SettingsTable, Setting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
      'settings_value', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [value, name];
  @override
  String get aliasedName => _alias ?? 'settings';
  @override
  String get actualTableName => 'settings';
  @override
  VerificationContext validateIntegrity(Insertable<Setting> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('settings_value')) {
      context.handle(_valueMeta,
          value.isAcceptableOrUnknown(data['settings_value']!, _valueMeta));
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Setting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Setting(
      value: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}settings_value'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $SettingsTable createAlias(String alias) {
    return $SettingsTable(attachedDatabase, alias);
  }
}

class JadwalData extends DataClass implements Insertable<JadwalData> {
  final int tanggalasId;
  final DateTime tanggalSholat;
  final String imsak;
  final String subuh;
  final String terbit;
  final String dhuha;
  final String dzuhur;
  final String ashar;
  final String maghrib;
  final String isya;
  const JadwalData(
      {required this.tanggalasId,
      required this.tanggalSholat,
      required this.imsak,
      required this.subuh,
      required this.terbit,
      required this.dhuha,
      required this.dzuhur,
      required this.ashar,
      required this.maghrib,
      required this.isya});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['tanggalas_id'] = Variable<int>(tanggalasId);
    map['date_of_sholat'] = Variable<DateTime>(tanggalSholat);
    map['imsak_time'] = Variable<String>(imsak);
    map['shubuh_time'] = Variable<String>(subuh);
    map['terbit_time'] = Variable<String>(terbit);
    map['dhuha_time'] = Variable<String>(dhuha);
    map['dhuhur_time'] = Variable<String>(dzuhur);
    map['ashar_time'] = Variable<String>(ashar);
    map['maghrib_time'] = Variable<String>(maghrib);
    map['isya_time'] = Variable<String>(isya);
    return map;
  }

  JadwalCompanion toCompanion(bool nullToAbsent) {
    return JadwalCompanion(
      tanggalasId: Value(tanggalasId),
      tanggalSholat: Value(tanggalSholat),
      imsak: Value(imsak),
      subuh: Value(subuh),
      terbit: Value(terbit),
      dhuha: Value(dhuha),
      dzuhur: Value(dzuhur),
      ashar: Value(ashar),
      maghrib: Value(maghrib),
      isya: Value(isya),
    );
  }

  factory JadwalData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return JadwalData(
      tanggalasId: serializer.fromJson<int>(json['tanggalasId']),
      tanggalSholat: serializer.fromJson<DateTime>(json['tanggalSholat']),
      imsak: serializer.fromJson<String>(json['imsak']),
      subuh: serializer.fromJson<String>(json['subuh']),
      terbit: serializer.fromJson<String>(json['terbit']),
      dhuha: serializer.fromJson<String>(json['dhuha']),
      dzuhur: serializer.fromJson<String>(json['dzuhur']),
      ashar: serializer.fromJson<String>(json['ashar']),
      maghrib: serializer.fromJson<String>(json['maghrib']),
      isya: serializer.fromJson<String>(json['isya']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'tanggalasId': serializer.toJson<int>(tanggalasId),
      'tanggalSholat': serializer.toJson<DateTime>(tanggalSholat),
      'imsak': serializer.toJson<String>(imsak),
      'subuh': serializer.toJson<String>(subuh),
      'terbit': serializer.toJson<String>(terbit),
      'dhuha': serializer.toJson<String>(dhuha),
      'dzuhur': serializer.toJson<String>(dzuhur),
      'ashar': serializer.toJson<String>(ashar),
      'maghrib': serializer.toJson<String>(maghrib),
      'isya': serializer.toJson<String>(isya),
    };
  }

  JadwalData copyWith(
          {int? tanggalasId,
          DateTime? tanggalSholat,
          String? imsak,
          String? subuh,
          String? terbit,
          String? dhuha,
          String? dzuhur,
          String? ashar,
          String? maghrib,
          String? isya}) =>
      JadwalData(
        tanggalasId: tanggalasId ?? this.tanggalasId,
        tanggalSholat: tanggalSholat ?? this.tanggalSholat,
        imsak: imsak ?? this.imsak,
        subuh: subuh ?? this.subuh,
        terbit: terbit ?? this.terbit,
        dhuha: dhuha ?? this.dhuha,
        dzuhur: dzuhur ?? this.dzuhur,
        ashar: ashar ?? this.ashar,
        maghrib: maghrib ?? this.maghrib,
        isya: isya ?? this.isya,
      );
  @override
  String toString() {
    return (StringBuffer('JadwalData(')
          ..write('tanggalasId: $tanggalasId, ')
          ..write('tanggalSholat: $tanggalSholat, ')
          ..write('imsak: $imsak, ')
          ..write('subuh: $subuh, ')
          ..write('terbit: $terbit, ')
          ..write('dhuha: $dhuha, ')
          ..write('dzuhur: $dzuhur, ')
          ..write('ashar: $ashar, ')
          ..write('maghrib: $maghrib, ')
          ..write('isya: $isya')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(tanggalasId, tanggalSholat, imsak, subuh,
      terbit, dhuha, dzuhur, ashar, maghrib, isya);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is JadwalData &&
          other.tanggalasId == this.tanggalasId &&
          other.tanggalSholat == this.tanggalSholat &&
          other.imsak == this.imsak &&
          other.subuh == this.subuh &&
          other.terbit == this.terbit &&
          other.dhuha == this.dhuha &&
          other.dzuhur == this.dzuhur &&
          other.ashar == this.ashar &&
          other.maghrib == this.maghrib &&
          other.isya == this.isya);
}

class JadwalCompanion extends UpdateCompanion<JadwalData> {
  final Value<int> tanggalasId;
  final Value<DateTime> tanggalSholat;
  final Value<String> imsak;
  final Value<String> subuh;
  final Value<String> terbit;
  final Value<String> dhuha;
  final Value<String> dzuhur;
  final Value<String> ashar;
  final Value<String> maghrib;
  final Value<String> isya;
  const JadwalCompanion({
    this.tanggalasId = const Value.absent(),
    this.tanggalSholat = const Value.absent(),
    this.imsak = const Value.absent(),
    this.subuh = const Value.absent(),
    this.terbit = const Value.absent(),
    this.dhuha = const Value.absent(),
    this.dzuhur = const Value.absent(),
    this.ashar = const Value.absent(),
    this.maghrib = const Value.absent(),
    this.isya = const Value.absent(),
  });
  JadwalCompanion.insert({
    this.tanggalasId = const Value.absent(),
    required DateTime tanggalSholat,
    required String imsak,
    required String subuh,
    required String terbit,
    required String dhuha,
    required String dzuhur,
    required String ashar,
    required String maghrib,
    required String isya,
  })  : tanggalSholat = Value(tanggalSholat),
        imsak = Value(imsak),
        subuh = Value(subuh),
        terbit = Value(terbit),
        dhuha = Value(dhuha),
        dzuhur = Value(dzuhur),
        ashar = Value(ashar),
        maghrib = Value(maghrib),
        isya = Value(isya);
  static Insertable<JadwalData> custom({
    Expression<int>? tanggalasId,
    Expression<DateTime>? tanggalSholat,
    Expression<String>? imsak,
    Expression<String>? subuh,
    Expression<String>? terbit,
    Expression<String>? dhuha,
    Expression<String>? dzuhur,
    Expression<String>? ashar,
    Expression<String>? maghrib,
    Expression<String>? isya,
  }) {
    return RawValuesInsertable({
      if (tanggalasId != null) 'tanggalas_id': tanggalasId,
      if (tanggalSholat != null) 'date_of_sholat': tanggalSholat,
      if (imsak != null) 'imsak_time': imsak,
      if (subuh != null) 'shubuh_time': subuh,
      if (terbit != null) 'terbit_time': terbit,
      if (dhuha != null) 'dhuha_time': dhuha,
      if (dzuhur != null) 'dhuhur_time': dzuhur,
      if (ashar != null) 'ashar_time': ashar,
      if (maghrib != null) 'maghrib_time': maghrib,
      if (isya != null) 'isya_time': isya,
    });
  }

  JadwalCompanion copyWith(
      {Value<int>? tanggalasId,
      Value<DateTime>? tanggalSholat,
      Value<String>? imsak,
      Value<String>? subuh,
      Value<String>? terbit,
      Value<String>? dhuha,
      Value<String>? dzuhur,
      Value<String>? ashar,
      Value<String>? maghrib,
      Value<String>? isya}) {
    return JadwalCompanion(
      tanggalasId: tanggalasId ?? this.tanggalasId,
      tanggalSholat: tanggalSholat ?? this.tanggalSholat,
      imsak: imsak ?? this.imsak,
      subuh: subuh ?? this.subuh,
      terbit: terbit ?? this.terbit,
      dhuha: dhuha ?? this.dhuha,
      dzuhur: dzuhur ?? this.dzuhur,
      ashar: ashar ?? this.ashar,
      maghrib: maghrib ?? this.maghrib,
      isya: isya ?? this.isya,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (tanggalasId.present) {
      map['tanggalas_id'] = Variable<int>(tanggalasId.value);
    }
    if (tanggalSholat.present) {
      map['date_of_sholat'] = Variable<DateTime>(tanggalSholat.value);
    }
    if (imsak.present) {
      map['imsak_time'] = Variable<String>(imsak.value);
    }
    if (subuh.present) {
      map['shubuh_time'] = Variable<String>(subuh.value);
    }
    if (terbit.present) {
      map['terbit_time'] = Variable<String>(terbit.value);
    }
    if (dhuha.present) {
      map['dhuha_time'] = Variable<String>(dhuha.value);
    }
    if (dzuhur.present) {
      map['dhuhur_time'] = Variable<String>(dzuhur.value);
    }
    if (ashar.present) {
      map['ashar_time'] = Variable<String>(ashar.value);
    }
    if (maghrib.present) {
      map['maghrib_time'] = Variable<String>(maghrib.value);
    }
    if (isya.present) {
      map['isya_time'] = Variable<String>(isya.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('JadwalCompanion(')
          ..write('tanggalasId: $tanggalasId, ')
          ..write('tanggalSholat: $tanggalSholat, ')
          ..write('imsak: $imsak, ')
          ..write('subuh: $subuh, ')
          ..write('terbit: $terbit, ')
          ..write('dhuha: $dhuha, ')
          ..write('dzuhur: $dzuhur, ')
          ..write('ashar: $ashar, ')
          ..write('maghrib: $maghrib, ')
          ..write('isya: $isya')
          ..write(')'))
        .toString();
  }
}

class $JadwalTable extends Jadwal with TableInfo<$JadwalTable, JadwalData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $JadwalTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _tanggalasIdMeta =
      const VerificationMeta('tanggalasId');
  @override
  late final GeneratedColumn<int> tanggalasId = GeneratedColumn<int>(
      'tanggalas_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _tanggalSholatMeta =
      const VerificationMeta('tanggalSholat');
  @override
  late final GeneratedColumn<DateTime> tanggalSholat =
      GeneratedColumn<DateTime>('date_of_sholat', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _imsakMeta = const VerificationMeta('imsak');
  @override
  late final GeneratedColumn<String> imsak = GeneratedColumn<String>(
      'imsak_time', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _subuhMeta = const VerificationMeta('subuh');
  @override
  late final GeneratedColumn<String> subuh = GeneratedColumn<String>(
      'shubuh_time', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _terbitMeta = const VerificationMeta('terbit');
  @override
  late final GeneratedColumn<String> terbit = GeneratedColumn<String>(
      'terbit_time', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dhuhaMeta = const VerificationMeta('dhuha');
  @override
  late final GeneratedColumn<String> dhuha = GeneratedColumn<String>(
      'dhuha_time', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dzuhurMeta = const VerificationMeta('dzuhur');
  @override
  late final GeneratedColumn<String> dzuhur = GeneratedColumn<String>(
      'dhuhur_time', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _asharMeta = const VerificationMeta('ashar');
  @override
  late final GeneratedColumn<String> ashar = GeneratedColumn<String>(
      'ashar_time', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _maghribMeta =
      const VerificationMeta('maghrib');
  @override
  late final GeneratedColumn<String> maghrib = GeneratedColumn<String>(
      'maghrib_time', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isyaMeta = const VerificationMeta('isya');
  @override
  late final GeneratedColumn<String> isya = GeneratedColumn<String>(
      'isya_time', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        tanggalasId,
        tanggalSholat,
        imsak,
        subuh,
        terbit,
        dhuha,
        dzuhur,
        ashar,
        maghrib,
        isya
      ];
  @override
  String get aliasedName => _alias ?? 'jadwal';
  @override
  String get actualTableName => 'jadwal';
  @override
  VerificationContext validateIntegrity(Insertable<JadwalData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('tanggalas_id')) {
      context.handle(
          _tanggalasIdMeta,
          tanggalasId.isAcceptableOrUnknown(
              data['tanggalas_id']!, _tanggalasIdMeta));
    }
    if (data.containsKey('date_of_sholat')) {
      context.handle(
          _tanggalSholatMeta,
          tanggalSholat.isAcceptableOrUnknown(
              data['date_of_sholat']!, _tanggalSholatMeta));
    } else if (isInserting) {
      context.missing(_tanggalSholatMeta);
    }
    if (data.containsKey('imsak_time')) {
      context.handle(_imsakMeta,
          imsak.isAcceptableOrUnknown(data['imsak_time']!, _imsakMeta));
    } else if (isInserting) {
      context.missing(_imsakMeta);
    }
    if (data.containsKey('shubuh_time')) {
      context.handle(_subuhMeta,
          subuh.isAcceptableOrUnknown(data['shubuh_time']!, _subuhMeta));
    } else if (isInserting) {
      context.missing(_subuhMeta);
    }
    if (data.containsKey('terbit_time')) {
      context.handle(_terbitMeta,
          terbit.isAcceptableOrUnknown(data['terbit_time']!, _terbitMeta));
    } else if (isInserting) {
      context.missing(_terbitMeta);
    }
    if (data.containsKey('dhuha_time')) {
      context.handle(_dhuhaMeta,
          dhuha.isAcceptableOrUnknown(data['dhuha_time']!, _dhuhaMeta));
    } else if (isInserting) {
      context.missing(_dhuhaMeta);
    }
    if (data.containsKey('dhuhur_time')) {
      context.handle(_dzuhurMeta,
          dzuhur.isAcceptableOrUnknown(data['dhuhur_time']!, _dzuhurMeta));
    } else if (isInserting) {
      context.missing(_dzuhurMeta);
    }
    if (data.containsKey('ashar_time')) {
      context.handle(_asharMeta,
          ashar.isAcceptableOrUnknown(data['ashar_time']!, _asharMeta));
    } else if (isInserting) {
      context.missing(_asharMeta);
    }
    if (data.containsKey('maghrib_time')) {
      context.handle(_maghribMeta,
          maghrib.isAcceptableOrUnknown(data['maghrib_time']!, _maghribMeta));
    } else if (isInserting) {
      context.missing(_maghribMeta);
    }
    if (data.containsKey('isya_time')) {
      context.handle(
          _isyaMeta, isya.isAcceptableOrUnknown(data['isya_time']!, _isyaMeta));
    } else if (isInserting) {
      context.missing(_isyaMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {tanggalasId};
  @override
  JadwalData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return JadwalData(
      tanggalasId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}tanggalas_id'])!,
      tanggalSholat: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}date_of_sholat'])!,
      imsak: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}imsak_time'])!,
      subuh: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}shubuh_time'])!,
      terbit: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}terbit_time'])!,
      dhuha: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}dhuha_time'])!,
      dzuhur: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}dhuhur_time'])!,
      ashar: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}ashar_time'])!,
      maghrib: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}maghrib_time'])!,
      isya: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}isya_time'])!,
    );
  }

  @override
  $JadwalTable createAlias(String alias) {
    return $JadwalTable(attachedDatabase, alias);
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  late final $SettingsTable settings = $SettingsTable(this);
  late final $JadwalTable jadwal = $JadwalTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [settings, jadwal];
}
