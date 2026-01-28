// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'membre.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMembreCollection on Isar {
  IsarCollection<Membre> get membres => this.collection();
}

const MembreSchema = CollectionSchema(
  name: r'Membre',
  id: 6210858870183803143,
  properties: {
    r'adresse': PropertySchema(id: 0, name: r'adresse', type: IsarType.string),
    r'age': PropertySchema(id: 1, name: r'age', type: IsarType.string),
    r'allergies': PropertySchema(
      id: 2,
      name: r'allergies',
      type: IsarType.string,
    ),
    r'categorie': PropertySchema(
      id: 3,
      name: r'categorie',
      type: IsarType.string,
    ),
    r'classe': PropertySchema(id: 4, name: r'classe', type: IsarType.string),
    r'contactResponsable': PropertySchema(
      id: 5,
      name: r'contactResponsable',
      type: IsarType.string,
    ),
    r'contactUrgente': PropertySchema(
      id: 6,
      name: r'contactUrgente',
      type: IsarType.string,
    ),
    r'dateInscription': PropertySchema(
      id: 7,
      name: r'dateInscription',
      type: IsarType.dateTime,
    ),
    r'dateNaissance': PropertySchema(
      id: 8,
      name: r'dateNaissance',
      type: IsarType.string,
    ),
    r'groupeSanguin': PropertySchema(
      id: 9,
      name: r'groupeSanguin',
      type: IsarType.string,
    ),
    r'lieuNaissance': PropertySchema(
      id: 10,
      name: r'lieuNaissance',
      type: IsarType.string,
    ),
    r'nom': PropertySchema(id: 11, name: r'nom', type: IsarType.string),
    r'nomResponsable': PropertySchema(
      id: 12,
      name: r'nomResponsable',
      type: IsarType.string,
    ),
    r'personneUrgence': PropertySchema(
      id: 13,
      name: r'personneUrgence',
      type: IsarType.string,
    ),
    r'photoBytes': PropertySchema(
      id: 14,
      name: r'photoBytes',
      type: IsarType.byteList,
    ),
    r'prenom': PropertySchema(id: 15, name: r'prenom', type: IsarType.string),
    r'sexe': PropertySchema(id: 16, name: r'sexe', type: IsarType.string),
    r'typeResponsable': PropertySchema(
      id: 17,
      name: r'typeResponsable',
      type: IsarType.string,
    ),
  },

  estimateSize: _membreEstimateSize,
  serialize: _membreSerialize,
  deserialize: _membreDeserialize,
  deserializeProp: _membreDeserializeProp,
  idName: r'id',
  indexes: {
    r'nom': IndexSchema(
      id: 1809533539974316007,
      name: r'nom',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'nom',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _membreGetId,
  getLinks: _membreGetLinks,
  attach: _membreAttach,
  version: '3.3.0',
);

int _membreEstimateSize(
  Membre object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.adresse;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.age;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.allergies;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.categorie;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.classe;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.contactResponsable;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.contactUrgente;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.dateNaissance;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.groupeSanguin;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.lieuNaissance;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.nom;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.nomResponsable;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.personneUrgence;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.photoBytes;
    if (value != null) {
      bytesCount += 3 + value.length;
    }
  }
  {
    final value = object.prenom;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.sexe;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.typeResponsable;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _membreSerialize(
  Membre object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.adresse);
  writer.writeString(offsets[1], object.age);
  writer.writeString(offsets[2], object.allergies);
  writer.writeString(offsets[3], object.categorie);
  writer.writeString(offsets[4], object.classe);
  writer.writeString(offsets[5], object.contactResponsable);
  writer.writeString(offsets[6], object.contactUrgente);
  writer.writeDateTime(offsets[7], object.dateInscription);
  writer.writeString(offsets[8], object.dateNaissance);
  writer.writeString(offsets[9], object.groupeSanguin);
  writer.writeString(offsets[10], object.lieuNaissance);
  writer.writeString(offsets[11], object.nom);
  writer.writeString(offsets[12], object.nomResponsable);
  writer.writeString(offsets[13], object.personneUrgence);
  writer.writeByteList(offsets[14], object.photoBytes);
  writer.writeString(offsets[15], object.prenom);
  writer.writeString(offsets[16], object.sexe);
  writer.writeString(offsets[17], object.typeResponsable);
}

Membre _membreDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Membre();
  object.adresse = reader.readStringOrNull(offsets[0]);
  object.age = reader.readStringOrNull(offsets[1]);
  object.allergies = reader.readStringOrNull(offsets[2]);
  object.categorie = reader.readStringOrNull(offsets[3]);
  object.classe = reader.readStringOrNull(offsets[4]);
  object.contactResponsable = reader.readStringOrNull(offsets[5]);
  object.contactUrgente = reader.readStringOrNull(offsets[6]);
  object.dateInscription = reader.readDateTime(offsets[7]);
  object.dateNaissance = reader.readStringOrNull(offsets[8]);
  object.groupeSanguin = reader.readStringOrNull(offsets[9]);
  object.id = id;
  object.lieuNaissance = reader.readStringOrNull(offsets[10]);
  object.nom = reader.readStringOrNull(offsets[11]);
  object.nomResponsable = reader.readStringOrNull(offsets[12]);
  object.personneUrgence = reader.readStringOrNull(offsets[13]);
  object.photoBytes = reader.readByteList(offsets[14]);
  object.prenom = reader.readStringOrNull(offsets[15]);
  object.sexe = reader.readStringOrNull(offsets[16]);
  object.typeResponsable = reader.readStringOrNull(offsets[17]);
  return object;
}

P _membreDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readDateTime(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    case 14:
      return (reader.readByteList(offset)) as P;
    case 15:
      return (reader.readStringOrNull(offset)) as P;
    case 16:
      return (reader.readStringOrNull(offset)) as P;
    case 17:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _membreGetId(Membre object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _membreGetLinks(Membre object) {
  return [];
}

void _membreAttach(IsarCollection<dynamic> col, Id id, Membre object) {
  object.id = id;
}

extension MembreQueryWhereSort on QueryBuilder<Membre, Membre, QWhere> {
  QueryBuilder<Membre, Membre, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MembreQueryWhere on QueryBuilder<Membre, Membre, QWhereClause> {
  QueryBuilder<Membre, Membre, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<Membre, Membre, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Membre, Membre, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterWhereClause> nomIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'nom', value: [null]),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterWhereClause> nomIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'nom',
          lower: [null],
          includeLower: false,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterWhereClause> nomEqualTo(String? nom) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'nom', value: [nom]),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterWhereClause> nomNotEqualTo(String? nom) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'nom',
                lower: [],
                upper: [nom],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'nom',
                lower: [nom],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'nom',
                lower: [nom],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'nom',
                lower: [],
                upper: [nom],
                includeUpper: false,
              ),
            );
      }
    });
  }
}

extension MembreQueryFilter on QueryBuilder<Membre, Membre, QFilterCondition> {
  QueryBuilder<Membre, Membre, QAfterFilterCondition> adresseIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'adresse'),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> adresseIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'adresse'),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> adresseEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'adresse',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> adresseGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'adresse',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> adresseLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'adresse',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> adresseBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'adresse',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> adresseStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'adresse',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> adresseEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'adresse',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> adresseContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'adresse',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> adresseMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'adresse',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> adresseIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'adresse', value: ''),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> adresseIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'adresse', value: ''),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> ageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'age'),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> ageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'age'),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> ageEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'age',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> ageGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'age',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> ageLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'age',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> ageBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'age',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> ageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'age',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> ageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'age',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> ageContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'age',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> ageMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'age',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> ageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'age', value: ''),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> ageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'age', value: ''),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> allergiesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'allergies'),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> allergiesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'allergies'),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> allergiesEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'allergies',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> allergiesGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'allergies',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> allergiesLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'allergies',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> allergiesBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'allergies',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> allergiesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'allergies',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> allergiesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'allergies',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> allergiesContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'allergies',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> allergiesMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'allergies',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> allergiesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'allergies', value: ''),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> allergiesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'allergies', value: ''),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> categorieIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'categorie'),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> categorieIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'categorie'),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> categorieEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'categorie',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> categorieGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'categorie',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> categorieLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'categorie',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> categorieBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'categorie',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> categorieStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'categorie',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> categorieEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'categorie',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> categorieContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'categorie',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> categorieMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'categorie',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> categorieIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'categorie', value: ''),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> categorieIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'categorie', value: ''),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> classeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'classe'),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> classeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'classe'),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> classeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'classe',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> classeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'classe',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> classeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'classe',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> classeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'classe',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> classeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'classe',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> classeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'classe',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> classeContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'classe',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> classeMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'classe',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> classeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'classe', value: ''),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> classeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'classe', value: ''),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition>
  contactResponsableIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'contactResponsable'),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition>
  contactResponsableIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'contactResponsable'),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> contactResponsableEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'contactResponsable',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition>
  contactResponsableGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'contactResponsable',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition>
  contactResponsableLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'contactResponsable',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> contactResponsableBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'contactResponsable',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition>
  contactResponsableStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'contactResponsable',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition>
  contactResponsableEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'contactResponsable',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition>
  contactResponsableContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'contactResponsable',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> contactResponsableMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'contactResponsable',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition>
  contactResponsableIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'contactResponsable', value: ''),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition>
  contactResponsableIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'contactResponsable', value: ''),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> contactUrgenteIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'contactUrgente'),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition>
  contactUrgenteIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'contactUrgente'),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> contactUrgenteEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'contactUrgente',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> contactUrgenteGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'contactUrgente',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> contactUrgenteLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'contactUrgente',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> contactUrgenteBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'contactUrgente',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> contactUrgenteStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'contactUrgente',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> contactUrgenteEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'contactUrgente',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> contactUrgenteContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'contactUrgente',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> contactUrgenteMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'contactUrgente',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> contactUrgenteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'contactUrgente', value: ''),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition>
  contactUrgenteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'contactUrgente', value: ''),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> dateInscriptionEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'dateInscription', value: value),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition>
  dateInscriptionGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'dateInscription',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> dateInscriptionLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'dateInscription',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> dateInscriptionBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'dateInscription',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> dateNaissanceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'dateNaissance'),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> dateNaissanceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'dateNaissance'),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> dateNaissanceEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'dateNaissance',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> dateNaissanceGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'dateNaissance',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> dateNaissanceLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'dateNaissance',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> dateNaissanceBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'dateNaissance',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> dateNaissanceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'dateNaissance',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> dateNaissanceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'dateNaissance',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> dateNaissanceContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'dateNaissance',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> dateNaissanceMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'dateNaissance',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> dateNaissanceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'dateNaissance', value: ''),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition>
  dateNaissanceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'dateNaissance', value: ''),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> groupeSanguinIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'groupeSanguin'),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> groupeSanguinIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'groupeSanguin'),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> groupeSanguinEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'groupeSanguin',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> groupeSanguinGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'groupeSanguin',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> groupeSanguinLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'groupeSanguin',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> groupeSanguinBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'groupeSanguin',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> groupeSanguinStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'groupeSanguin',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> groupeSanguinEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'groupeSanguin',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> groupeSanguinContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'groupeSanguin',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> groupeSanguinMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'groupeSanguin',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> groupeSanguinIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'groupeSanguin', value: ''),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition>
  groupeSanguinIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'groupeSanguin', value: ''),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> lieuNaissanceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'lieuNaissance'),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> lieuNaissanceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'lieuNaissance'),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> lieuNaissanceEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'lieuNaissance',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> lieuNaissanceGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'lieuNaissance',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> lieuNaissanceLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'lieuNaissance',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> lieuNaissanceBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'lieuNaissance',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> lieuNaissanceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'lieuNaissance',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> lieuNaissanceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'lieuNaissance',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> lieuNaissanceContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'lieuNaissance',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> lieuNaissanceMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'lieuNaissance',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> lieuNaissanceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'lieuNaissance', value: ''),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition>
  lieuNaissanceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'lieuNaissance', value: ''),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> nomIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'nom'),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> nomIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'nom'),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> nomEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'nom',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> nomGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'nom',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> nomLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'nom',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> nomBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'nom',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> nomStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'nom',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> nomEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'nom',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> nomContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'nom',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> nomMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'nom',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> nomIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'nom', value: ''),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> nomIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'nom', value: ''),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> nomResponsableIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'nomResponsable'),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition>
  nomResponsableIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'nomResponsable'),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> nomResponsableEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'nomResponsable',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> nomResponsableGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'nomResponsable',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> nomResponsableLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'nomResponsable',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> nomResponsableBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'nomResponsable',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> nomResponsableStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'nomResponsable',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> nomResponsableEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'nomResponsable',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> nomResponsableContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'nomResponsable',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> nomResponsableMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'nomResponsable',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> nomResponsableIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'nomResponsable', value: ''),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition>
  nomResponsableIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'nomResponsable', value: ''),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> personneUrgenceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'personneUrgence'),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition>
  personneUrgenceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'personneUrgence'),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> personneUrgenceEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'personneUrgence',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition>
  personneUrgenceGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'personneUrgence',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> personneUrgenceLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'personneUrgence',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> personneUrgenceBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'personneUrgence',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> personneUrgenceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'personneUrgence',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> personneUrgenceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'personneUrgence',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> personneUrgenceContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'personneUrgence',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> personneUrgenceMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'personneUrgence',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> personneUrgenceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'personneUrgence', value: ''),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition>
  personneUrgenceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'personneUrgence', value: ''),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> photoBytesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'photoBytes'),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> photoBytesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'photoBytes'),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> photoBytesElementEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'photoBytes', value: value),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition>
  photoBytesElementGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'photoBytes',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> photoBytesElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'photoBytes',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> photoBytesElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'photoBytes',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> photoBytesLengthEqualTo(
    int length,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'photoBytes', length, true, length, true);
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> photoBytesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'photoBytes', 0, true, 0, true);
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> photoBytesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'photoBytes', 0, false, 999999, true);
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> photoBytesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'photoBytes', 0, true, length, include);
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition>
  photoBytesLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'photoBytes', length, include, 999999, true);
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> photoBytesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'photoBytes',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> prenomIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'prenom'),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> prenomIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'prenom'),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> prenomEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'prenom',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> prenomGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'prenom',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> prenomLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'prenom',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> prenomBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'prenom',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> prenomStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'prenom',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> prenomEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'prenom',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> prenomContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'prenom',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> prenomMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'prenom',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> prenomIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'prenom', value: ''),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> prenomIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'prenom', value: ''),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> sexeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'sexe'),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> sexeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'sexe'),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> sexeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'sexe',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> sexeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'sexe',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> sexeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'sexe',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> sexeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'sexe',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> sexeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'sexe',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> sexeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'sexe',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> sexeContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'sexe',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> sexeMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'sexe',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> sexeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'sexe', value: ''),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> sexeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'sexe', value: ''),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> typeResponsableIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'typeResponsable'),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition>
  typeResponsableIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'typeResponsable'),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> typeResponsableEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'typeResponsable',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition>
  typeResponsableGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'typeResponsable',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> typeResponsableLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'typeResponsable',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> typeResponsableBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'typeResponsable',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> typeResponsableStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'typeResponsable',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> typeResponsableEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'typeResponsable',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> typeResponsableContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'typeResponsable',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> typeResponsableMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'typeResponsable',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition> typeResponsableIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'typeResponsable', value: ''),
      );
    });
  }

  QueryBuilder<Membre, Membre, QAfterFilterCondition>
  typeResponsableIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'typeResponsable', value: ''),
      );
    });
  }
}

extension MembreQueryObject on QueryBuilder<Membre, Membre, QFilterCondition> {}

extension MembreQueryLinks on QueryBuilder<Membre, Membre, QFilterCondition> {}

extension MembreQuerySortBy on QueryBuilder<Membre, Membre, QSortBy> {
  QueryBuilder<Membre, Membre, QAfterSortBy> sortByAdresse() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adresse', Sort.asc);
    });
  }

  QueryBuilder<Membre, Membre, QAfterSortBy> sortByAdresseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adresse', Sort.desc);
    });
  }

  QueryBuilder<Membre, Membre, QAfterSortBy> sortByAge() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'age', Sort.asc);
    });
  }

  QueryBuilder<Membre, Membre, QAfterSortBy> sortByAgeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'age', Sort.desc);
    });
  }

  QueryBuilder<Membre, Membre, QAfterSortBy> sortByAllergies() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allergies', Sort.asc);
    });
  }

  QueryBuilder<Membre, Membre, QAfterSortBy> sortByAllergiesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allergies', Sort.desc);
    });
  }

  QueryBuilder<Membre, Membre, QAfterSortBy> sortByCategorie() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categorie', Sort.asc);
    });
  }

  QueryBuilder<Membre, Membre, QAfterSortBy> sortByCategorieDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categorie', Sort.desc);
    });
  }

  QueryBuilder<Membre, Membre, QAfterSortBy> sortByClasse() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'classe', Sort.asc);
    });
  }

  QueryBuilder<Membre, Membre, QAfterSortBy> sortByClasseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'classe', Sort.desc);
    });
  }

  QueryBuilder<Membre, Membre, QAfterSortBy> sortByContactResponsable() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactResponsable', Sort.asc);
    });
  }

  QueryBuilder<Membre, Membre, QAfterSortBy> sortByContactResponsableDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactResponsable', Sort.desc);
    });
  }

  QueryBuilder<Membre, Membre, QAfterSortBy> sortByContactUrgente() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactUrgente', Sort.asc);
    });
  }

  QueryBuilder<Membre, Membre, QAfterSortBy> sortByContactUrgenteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactUrgente', Sort.desc);
    });
  }

  QueryBuilder<Membre, Membre, QAfterSortBy> sortByDateInscription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateInscription', Sort.asc);
    });
  }

  QueryBuilder<Membre, Membre, QAfterSortBy> sortByDateInscriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateInscription', Sort.desc);
    });
  }

  QueryBuilder<Membre, Membre, QAfterSortBy> sortByDateNaissance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateNaissance', Sort.asc);
    });
  }

  QueryBuilder<Membre, Membre, QAfterSortBy> sortByDateNaissanceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateNaissance', Sort.desc);
    });
  }

  QueryBuilder<Membre, Membre, QAfterSortBy> sortByGroupeSanguin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupeSanguin', Sort.asc);
    });
  }

  QueryBuilder<Membre, Membre, QAfterSortBy> sortByGroupeSanguinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupeSanguin', Sort.desc);
    });
  }

  QueryBuilder<Membre, Membre, QAfterSortBy> sortByLieuNaissance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lieuNaissance', Sort.asc);
    });
  }

  QueryBuilder<Membre, Membre, QAfterSortBy> sortByLieuNaissanceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lieuNaissance', Sort.desc);
    });
  }

  QueryBuilder<Membre, Membre, QAfterSortBy> sortByNom() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nom', Sort.asc);
    });
  }

  QueryBuilder<Membre, Membre, QAfterSortBy> sortByNomDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nom', Sort.desc);
    });
  }

  QueryBuilder<Membre, Membre, QAfterSortBy> sortByNomResponsable() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nomResponsable', Sort.asc);
    });
  }

  QueryBuilder<Membre, Membre, QAfterSortBy> sortByNomResponsableDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nomResponsable', Sort.desc);
    });
  }

  QueryBuilder<Membre, Membre, QAfterSortBy> sortByPersonneUrgence() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'personneUrgence', Sort.asc);
    });
  }

  QueryBuilder<Membre, Membre, QAfterSortBy> sortByPersonneUrgenceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'personneUrgence', Sort.desc);
    });
  }

  QueryBuilder<Membre, Membre, QAfterSortBy> sortByPrenom() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prenom', Sort.asc);
    });
  }

  QueryBuilder<Membre, Membre, QAfterSortBy> sortByPrenomDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prenom', Sort.desc);
    });
  }

  QueryBuilder<Membre, Membre, QAfterSortBy> sortBySexe() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sexe', Sort.asc);
    });
  }

  QueryBuilder<Membre, Membre, QAfterSortBy> sortBySexeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sexe', Sort.desc);
    });
  }

  QueryBuilder<Membre, Membre, QAfterSortBy> sortByTypeResponsable() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'typeResponsable', Sort.asc);
    });
  }

  QueryBuilder<Membre, Membre, QAfterSortBy> sortByTypeResponsableDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'typeResponsable', Sort.desc);
    });
  }
}

extension MembreQuerySortThenBy on QueryBuilder<Membre, Membre, QSortThenBy> {
  QueryBuilder<Membre, Membre, QAfterSortBy> thenByAdresse() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adresse', Sort.asc);
    });
  }

  QueryBuilder<Membre, Membre, QAfterSortBy> thenByAdresseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adresse', Sort.desc);
    });
  }

  QueryBuilder<Membre, Membre, QAfterSortBy> thenByAge() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'age', Sort.asc);
    });
  }

  QueryBuilder<Membre, Membre, QAfterSortBy> thenByAgeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'age', Sort.desc);
    });
  }

  QueryBuilder<Membre, Membre, QAfterSortBy> thenByAllergies() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allergies', Sort.asc);
    });
  }

  QueryBuilder<Membre, Membre, QAfterSortBy> thenByAllergiesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allergies', Sort.desc);
    });
  }

  QueryBuilder<Membre, Membre, QAfterSortBy> thenByCategorie() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categorie', Sort.asc);
    });
  }

  QueryBuilder<Membre, Membre, QAfterSortBy> thenByCategorieDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categorie', Sort.desc);
    });
  }

  QueryBuilder<Membre, Membre, QAfterSortBy> thenByClasse() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'classe', Sort.asc);
    });
  }

  QueryBuilder<Membre, Membre, QAfterSortBy> thenByClasseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'classe', Sort.desc);
    });
  }

  QueryBuilder<Membre, Membre, QAfterSortBy> thenByContactResponsable() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactResponsable', Sort.asc);
    });
  }

  QueryBuilder<Membre, Membre, QAfterSortBy> thenByContactResponsableDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactResponsable', Sort.desc);
    });
  }

  QueryBuilder<Membre, Membre, QAfterSortBy> thenByContactUrgente() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactUrgente', Sort.asc);
    });
  }

  QueryBuilder<Membre, Membre, QAfterSortBy> thenByContactUrgenteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactUrgente', Sort.desc);
    });
  }

  QueryBuilder<Membre, Membre, QAfterSortBy> thenByDateInscription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateInscription', Sort.asc);
    });
  }

  QueryBuilder<Membre, Membre, QAfterSortBy> thenByDateInscriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateInscription', Sort.desc);
    });
  }

  QueryBuilder<Membre, Membre, QAfterSortBy> thenByDateNaissance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateNaissance', Sort.asc);
    });
  }

  QueryBuilder<Membre, Membre, QAfterSortBy> thenByDateNaissanceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateNaissance', Sort.desc);
    });
  }

  QueryBuilder<Membre, Membre, QAfterSortBy> thenByGroupeSanguin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupeSanguin', Sort.asc);
    });
  }

  QueryBuilder<Membre, Membre, QAfterSortBy> thenByGroupeSanguinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupeSanguin', Sort.desc);
    });
  }

  QueryBuilder<Membre, Membre, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Membre, Membre, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Membre, Membre, QAfterSortBy> thenByLieuNaissance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lieuNaissance', Sort.asc);
    });
  }

  QueryBuilder<Membre, Membre, QAfterSortBy> thenByLieuNaissanceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lieuNaissance', Sort.desc);
    });
  }

  QueryBuilder<Membre, Membre, QAfterSortBy> thenByNom() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nom', Sort.asc);
    });
  }

  QueryBuilder<Membre, Membre, QAfterSortBy> thenByNomDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nom', Sort.desc);
    });
  }

  QueryBuilder<Membre, Membre, QAfterSortBy> thenByNomResponsable() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nomResponsable', Sort.asc);
    });
  }

  QueryBuilder<Membre, Membre, QAfterSortBy> thenByNomResponsableDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nomResponsable', Sort.desc);
    });
  }

  QueryBuilder<Membre, Membre, QAfterSortBy> thenByPersonneUrgence() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'personneUrgence', Sort.asc);
    });
  }

  QueryBuilder<Membre, Membre, QAfterSortBy> thenByPersonneUrgenceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'personneUrgence', Sort.desc);
    });
  }

  QueryBuilder<Membre, Membre, QAfterSortBy> thenByPrenom() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prenom', Sort.asc);
    });
  }

  QueryBuilder<Membre, Membre, QAfterSortBy> thenByPrenomDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prenom', Sort.desc);
    });
  }

  QueryBuilder<Membre, Membre, QAfterSortBy> thenBySexe() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sexe', Sort.asc);
    });
  }

  QueryBuilder<Membre, Membre, QAfterSortBy> thenBySexeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sexe', Sort.desc);
    });
  }

  QueryBuilder<Membre, Membre, QAfterSortBy> thenByTypeResponsable() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'typeResponsable', Sort.asc);
    });
  }

  QueryBuilder<Membre, Membre, QAfterSortBy> thenByTypeResponsableDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'typeResponsable', Sort.desc);
    });
  }
}

extension MembreQueryWhereDistinct on QueryBuilder<Membre, Membre, QDistinct> {
  QueryBuilder<Membre, Membre, QDistinct> distinctByAdresse({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'adresse', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Membre, Membre, QDistinct> distinctByAge({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'age', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Membre, Membre, QDistinct> distinctByAllergies({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'allergies', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Membre, Membre, QDistinct> distinctByCategorie({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'categorie', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Membre, Membre, QDistinct> distinctByClasse({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'classe', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Membre, Membre, QDistinct> distinctByContactResponsable({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'contactResponsable',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Membre, Membre, QDistinct> distinctByContactUrgente({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'contactUrgente',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Membre, Membre, QDistinct> distinctByDateInscription() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dateInscription');
    });
  }

  QueryBuilder<Membre, Membre, QDistinct> distinctByDateNaissance({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'dateNaissance',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Membre, Membre, QDistinct> distinctByGroupeSanguin({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'groupeSanguin',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Membre, Membre, QDistinct> distinctByLieuNaissance({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'lieuNaissance',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Membre, Membre, QDistinct> distinctByNom({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nom', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Membre, Membre, QDistinct> distinctByNomResponsable({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'nomResponsable',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Membre, Membre, QDistinct> distinctByPersonneUrgence({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'personneUrgence',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Membre, Membre, QDistinct> distinctByPhotoBytes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'photoBytes');
    });
  }

  QueryBuilder<Membre, Membre, QDistinct> distinctByPrenom({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'prenom', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Membre, Membre, QDistinct> distinctBySexe({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sexe', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Membre, Membre, QDistinct> distinctByTypeResponsable({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'typeResponsable',
        caseSensitive: caseSensitive,
      );
    });
  }
}

extension MembreQueryProperty on QueryBuilder<Membre, Membre, QQueryProperty> {
  QueryBuilder<Membre, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Membre, String?, QQueryOperations> adresseProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'adresse');
    });
  }

  QueryBuilder<Membre, String?, QQueryOperations> ageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'age');
    });
  }

  QueryBuilder<Membre, String?, QQueryOperations> allergiesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'allergies');
    });
  }

  QueryBuilder<Membre, String?, QQueryOperations> categorieProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'categorie');
    });
  }

  QueryBuilder<Membre, String?, QQueryOperations> classeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'classe');
    });
  }

  QueryBuilder<Membre, String?, QQueryOperations> contactResponsableProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'contactResponsable');
    });
  }

  QueryBuilder<Membre, String?, QQueryOperations> contactUrgenteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'contactUrgente');
    });
  }

  QueryBuilder<Membre, DateTime, QQueryOperations> dateInscriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dateInscription');
    });
  }

  QueryBuilder<Membre, String?, QQueryOperations> dateNaissanceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dateNaissance');
    });
  }

  QueryBuilder<Membre, String?, QQueryOperations> groupeSanguinProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'groupeSanguin');
    });
  }

  QueryBuilder<Membre, String?, QQueryOperations> lieuNaissanceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lieuNaissance');
    });
  }

  QueryBuilder<Membre, String?, QQueryOperations> nomProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nom');
    });
  }

  QueryBuilder<Membre, String?, QQueryOperations> nomResponsableProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nomResponsable');
    });
  }

  QueryBuilder<Membre, String?, QQueryOperations> personneUrgenceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'personneUrgence');
    });
  }

  QueryBuilder<Membre, List<int>?, QQueryOperations> photoBytesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'photoBytes');
    });
  }

  QueryBuilder<Membre, String?, QQueryOperations> prenomProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'prenom');
    });
  }

  QueryBuilder<Membre, String?, QQueryOperations> sexeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sexe');
    });
  }

  QueryBuilder<Membre, String?, QQueryOperations> typeResponsableProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'typeResponsable');
    });
  }
}
