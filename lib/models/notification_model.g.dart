// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetNotificationModelCollection on Isar {
  IsarCollection<NotificationModel> get notificationModels => this.collection();
}

const NotificationModelSchema = CollectionSchema(
  name: r'NotificationModel',
  id: 1422516433030028244,
  properties: {
    r'ageMembre': PropertySchema(
      id: 0,
      name: r'ageMembre',
      type: IsarType.string,
    ),
    r'categorie': PropertySchema(
      id: 1,
      name: r'categorie',
      type: IsarType.string,
    ),
    r'classeMembre': PropertySchema(
      id: 2,
      name: r'classeMembre',
      type: IsarType.string,
    ),
    r'contactResponsable': PropertySchema(
      id: 3,
      name: r'contactResponsable',
      type: IsarType.string,
    ),
    r'contactUrgence': PropertySchema(
      id: 4,
      name: r'contactUrgence',
      type: IsarType.string,
    ),
    r'dateCreation': PropertySchema(
      id: 5,
      name: r'dateCreation',
      type: IsarType.dateTime,
    ),
    r'estLue': PropertySchema(id: 6, name: r'estLue', type: IsarType.bool),
    r'message': PropertySchema(id: 7, name: r'message', type: IsarType.string),
    r'nomMembre': PropertySchema(
      id: 8,
      name: r'nomMembre',
      type: IsarType.string,
    ),
    r'nomResponsable': PropertySchema(
      id: 9,
      name: r'nomResponsable',
      type: IsarType.string,
    ),
    r'personneUrgence': PropertySchema(
      id: 10,
      name: r'personneUrgence',
      type: IsarType.string,
    ),
    r'photoBytes': PropertySchema(
      id: 11,
      name: r'photoBytes',
      type: IsarType.byteList,
    ),
    r'prenomMembre': PropertySchema(
      id: 12,
      name: r'prenomMembre',
      type: IsarType.string,
    ),
    r'sexeMembre': PropertySchema(
      id: 13,
      name: r'sexeMembre',
      type: IsarType.string,
    ),
    r'titre': PropertySchema(id: 14, name: r'titre', type: IsarType.string),
    r'typeResponsable': PropertySchema(
      id: 15,
      name: r'typeResponsable',
      type: IsarType.string,
    ),
  },

  estimateSize: _notificationModelEstimateSize,
  serialize: _notificationModelSerialize,
  deserialize: _notificationModelDeserialize,
  deserializeProp: _notificationModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'categorie': IndexSchema(
      id: 4376325832736545818,
      name: r'categorie',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'categorie',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _notificationModelGetId,
  getLinks: _notificationModelGetLinks,
  attach: _notificationModelAttach,
  version: '3.3.0',
);

int _notificationModelEstimateSize(
  NotificationModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.ageMembre.length * 3;
  bytesCount += 3 + object.categorie.length * 3;
  bytesCount += 3 + object.classeMembre.length * 3;
  bytesCount += 3 + object.contactResponsable.length * 3;
  bytesCount += 3 + object.contactUrgence.length * 3;
  bytesCount += 3 + object.message.length * 3;
  bytesCount += 3 + object.nomMembre.length * 3;
  bytesCount += 3 + object.nomResponsable.length * 3;
  bytesCount += 3 + object.personneUrgence.length * 3;
  {
    final value = object.photoBytes;
    if (value != null) {
      bytesCount += 3 + value.length;
    }
  }
  bytesCount += 3 + object.prenomMembre.length * 3;
  bytesCount += 3 + object.sexeMembre.length * 3;
  bytesCount += 3 + object.titre.length * 3;
  bytesCount += 3 + object.typeResponsable.length * 3;
  return bytesCount;
}

void _notificationModelSerialize(
  NotificationModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.ageMembre);
  writer.writeString(offsets[1], object.categorie);
  writer.writeString(offsets[2], object.classeMembre);
  writer.writeString(offsets[3], object.contactResponsable);
  writer.writeString(offsets[4], object.contactUrgence);
  writer.writeDateTime(offsets[5], object.dateCreation);
  writer.writeBool(offsets[6], object.estLue);
  writer.writeString(offsets[7], object.message);
  writer.writeString(offsets[8], object.nomMembre);
  writer.writeString(offsets[9], object.nomResponsable);
  writer.writeString(offsets[10], object.personneUrgence);
  writer.writeByteList(offsets[11], object.photoBytes);
  writer.writeString(offsets[12], object.prenomMembre);
  writer.writeString(offsets[13], object.sexeMembre);
  writer.writeString(offsets[14], object.titre);
  writer.writeString(offsets[15], object.typeResponsable);
}

NotificationModel _notificationModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = NotificationModel();
  object.ageMembre = reader.readString(offsets[0]);
  object.categorie = reader.readString(offsets[1]);
  object.classeMembre = reader.readString(offsets[2]);
  object.contactResponsable = reader.readString(offsets[3]);
  object.contactUrgence = reader.readString(offsets[4]);
  object.dateCreation = reader.readDateTime(offsets[5]);
  object.estLue = reader.readBool(offsets[6]);
  object.id = id;
  object.message = reader.readString(offsets[7]);
  object.nomMembre = reader.readString(offsets[8]);
  object.nomResponsable = reader.readString(offsets[9]);
  object.personneUrgence = reader.readString(offsets[10]);
  object.photoBytes = reader.readByteList(offsets[11]);
  object.prenomMembre = reader.readString(offsets[12]);
  object.sexeMembre = reader.readString(offsets[13]);
  object.titre = reader.readString(offsets[14]);
  object.typeResponsable = reader.readString(offsets[15]);
  return object;
}

P _notificationModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readDateTime(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    case 11:
      return (reader.readByteList(offset)) as P;
    case 12:
      return (reader.readString(offset)) as P;
    case 13:
      return (reader.readString(offset)) as P;
    case 14:
      return (reader.readString(offset)) as P;
    case 15:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _notificationModelGetId(NotificationModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _notificationModelGetLinks(
  NotificationModel object,
) {
  return [];
}

void _notificationModelAttach(
  IsarCollection<dynamic> col,
  Id id,
  NotificationModel object,
) {
  object.id = id;
}

extension NotificationModelQueryWhereSort
    on QueryBuilder<NotificationModel, NotificationModel, QWhere> {
  QueryBuilder<NotificationModel, NotificationModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension NotificationModelQueryWhere
    on QueryBuilder<NotificationModel, NotificationModel, QWhereClause> {
  QueryBuilder<NotificationModel, NotificationModel, QAfterWhereClause>
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterWhereClause>
  idNotEqualTo(Id id) {
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

  QueryBuilder<NotificationModel, NotificationModel, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterWhereClause>
  idBetween(
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

  QueryBuilder<NotificationModel, NotificationModel, QAfterWhereClause>
  categorieEqualTo(String categorie) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'categorie', value: [categorie]),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterWhereClause>
  categorieNotEqualTo(String categorie) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'categorie',
                lower: [],
                upper: [categorie],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'categorie',
                lower: [categorie],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'categorie',
                lower: [categorie],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'categorie',
                lower: [],
                upper: [categorie],
                includeUpper: false,
              ),
            );
      }
    });
  }
}

extension NotificationModelQueryFilter
    on QueryBuilder<NotificationModel, NotificationModel, QFilterCondition> {
  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  ageMembreEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'ageMembre',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  ageMembreGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'ageMembre',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  ageMembreLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'ageMembre',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  ageMembreBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'ageMembre',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  ageMembreStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'ageMembre',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  ageMembreEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'ageMembre',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  ageMembreContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'ageMembre',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  ageMembreMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'ageMembre',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  ageMembreIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'ageMembre', value: ''),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  ageMembreIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'ageMembre', value: ''),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  categorieEqualTo(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  categorieGreaterThan(
    String value, {
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

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  categorieLessThan(
    String value, {
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

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  categorieBetween(
    String lower,
    String upper, {
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

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  categorieStartsWith(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  categorieEndsWith(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  categorieContains(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  categorieMatches(String pattern, {bool caseSensitive = true}) {
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

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  categorieIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'categorie', value: ''),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  categorieIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'categorie', value: ''),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  classeMembreEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'classeMembre',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  classeMembreGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'classeMembre',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  classeMembreLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'classeMembre',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  classeMembreBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'classeMembre',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  classeMembreStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'classeMembre',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  classeMembreEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'classeMembre',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  classeMembreContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'classeMembre',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  classeMembreMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'classeMembre',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  classeMembreIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'classeMembre', value: ''),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  classeMembreIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'classeMembre', value: ''),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  contactResponsableEqualTo(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  contactResponsableGreaterThan(
    String value, {
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

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  contactResponsableLessThan(
    String value, {
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

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  contactResponsableBetween(
    String lower,
    String upper, {
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

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
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

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
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

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
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

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  contactResponsableMatches(String pattern, {bool caseSensitive = true}) {
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

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  contactResponsableIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'contactResponsable', value: ''),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  contactResponsableIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'contactResponsable', value: ''),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  contactUrgenceEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'contactUrgence',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  contactUrgenceGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'contactUrgence',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  contactUrgenceLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'contactUrgence',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  contactUrgenceBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'contactUrgence',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  contactUrgenceStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'contactUrgence',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  contactUrgenceEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'contactUrgence',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  contactUrgenceContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'contactUrgence',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  contactUrgenceMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'contactUrgence',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  contactUrgenceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'contactUrgence', value: ''),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  contactUrgenceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'contactUrgence', value: ''),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  dateCreationEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'dateCreation', value: value),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  dateCreationGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'dateCreation',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  dateCreationLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'dateCreation',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  dateCreationBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'dateCreation',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  estLueEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'estLue', value: value),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  idGreaterThan(Id value, {bool include = false}) {
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

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  idLessThan(Id value, {bool include = false}) {
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

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  idBetween(
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

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  messageEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'message',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  messageGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'message',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  messageLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'message',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  messageBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'message',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  messageStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'message',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  messageEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'message',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  messageContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'message',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  messageMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'message',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  messageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'message', value: ''),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  messageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'message', value: ''),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  nomMembreEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'nomMembre',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  nomMembreGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'nomMembre',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  nomMembreLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'nomMembre',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  nomMembreBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'nomMembre',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  nomMembreStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'nomMembre',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  nomMembreEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'nomMembre',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  nomMembreContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'nomMembre',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  nomMembreMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'nomMembre',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  nomMembreIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'nomMembre', value: ''),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  nomMembreIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'nomMembre', value: ''),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  nomResponsableEqualTo(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  nomResponsableGreaterThan(
    String value, {
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

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  nomResponsableLessThan(
    String value, {
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

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  nomResponsableBetween(
    String lower,
    String upper, {
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

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  nomResponsableStartsWith(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  nomResponsableEndsWith(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  nomResponsableContains(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  nomResponsableMatches(String pattern, {bool caseSensitive = true}) {
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

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  nomResponsableIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'nomResponsable', value: ''),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  nomResponsableIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'nomResponsable', value: ''),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  personneUrgenceEqualTo(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  personneUrgenceGreaterThan(
    String value, {
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

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  personneUrgenceLessThan(
    String value, {
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

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  personneUrgenceBetween(
    String lower,
    String upper, {
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

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  personneUrgenceStartsWith(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  personneUrgenceEndsWith(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  personneUrgenceContains(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  personneUrgenceMatches(String pattern, {bool caseSensitive = true}) {
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

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  personneUrgenceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'personneUrgence', value: ''),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  personneUrgenceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'personneUrgence', value: ''),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  photoBytesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'photoBytes'),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  photoBytesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'photoBytes'),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  photoBytesElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'photoBytes', value: value),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
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

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  photoBytesElementLessThan(int value, {bool include = false}) {
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

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  photoBytesElementBetween(
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

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  photoBytesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'photoBytes', length, true, length, true);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  photoBytesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'photoBytes', 0, true, 0, true);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  photoBytesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'photoBytes', 0, false, 999999, true);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  photoBytesLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'photoBytes', 0, true, length, include);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  photoBytesLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'photoBytes', length, include, 999999, true);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  photoBytesLengthBetween(
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

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  prenomMembreEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'prenomMembre',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  prenomMembreGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'prenomMembre',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  prenomMembreLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'prenomMembre',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  prenomMembreBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'prenomMembre',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  prenomMembreStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'prenomMembre',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  prenomMembreEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'prenomMembre',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  prenomMembreContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'prenomMembre',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  prenomMembreMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'prenomMembre',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  prenomMembreIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'prenomMembre', value: ''),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  prenomMembreIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'prenomMembre', value: ''),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  sexeMembreEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'sexeMembre',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  sexeMembreGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'sexeMembre',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  sexeMembreLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'sexeMembre',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  sexeMembreBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'sexeMembre',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  sexeMembreStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'sexeMembre',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  sexeMembreEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'sexeMembre',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  sexeMembreContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'sexeMembre',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  sexeMembreMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'sexeMembre',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  sexeMembreIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'sexeMembre', value: ''),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  sexeMembreIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'sexeMembre', value: ''),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  titreEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'titre',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  titreGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'titre',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  titreLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'titre',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  titreBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'titre',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  titreStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'titre',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  titreEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'titre',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  titreContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'titre',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  titreMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'titre',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  titreIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'titre', value: ''),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  titreIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'titre', value: ''),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  typeResponsableEqualTo(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  typeResponsableGreaterThan(
    String value, {
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

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  typeResponsableLessThan(
    String value, {
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

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  typeResponsableBetween(
    String lower,
    String upper, {
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

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  typeResponsableStartsWith(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  typeResponsableEndsWith(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  typeResponsableContains(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  typeResponsableMatches(String pattern, {bool caseSensitive = true}) {
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

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  typeResponsableIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'typeResponsable', value: ''),
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterFilterCondition>
  typeResponsableIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'typeResponsable', value: ''),
      );
    });
  }
}

extension NotificationModelQueryObject
    on QueryBuilder<NotificationModel, NotificationModel, QFilterCondition> {}

extension NotificationModelQueryLinks
    on QueryBuilder<NotificationModel, NotificationModel, QFilterCondition> {}

extension NotificationModelQuerySortBy
    on QueryBuilder<NotificationModel, NotificationModel, QSortBy> {
  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
  sortByAgeMembre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ageMembre', Sort.asc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
  sortByAgeMembreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ageMembre', Sort.desc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
  sortByCategorie() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categorie', Sort.asc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
  sortByCategorieDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categorie', Sort.desc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
  sortByClasseMembre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'classeMembre', Sort.asc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
  sortByClasseMembreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'classeMembre', Sort.desc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
  sortByContactResponsable() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactResponsable', Sort.asc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
  sortByContactResponsableDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactResponsable', Sort.desc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
  sortByContactUrgence() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactUrgence', Sort.asc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
  sortByContactUrgenceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactUrgence', Sort.desc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
  sortByDateCreation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateCreation', Sort.asc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
  sortByDateCreationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateCreation', Sort.desc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
  sortByEstLue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estLue', Sort.asc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
  sortByEstLueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estLue', Sort.desc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
  sortByMessage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'message', Sort.asc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
  sortByMessageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'message', Sort.desc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
  sortByNomMembre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nomMembre', Sort.asc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
  sortByNomMembreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nomMembre', Sort.desc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
  sortByNomResponsable() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nomResponsable', Sort.asc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
  sortByNomResponsableDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nomResponsable', Sort.desc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
  sortByPersonneUrgence() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'personneUrgence', Sort.asc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
  sortByPersonneUrgenceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'personneUrgence', Sort.desc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
  sortByPrenomMembre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prenomMembre', Sort.asc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
  sortByPrenomMembreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prenomMembre', Sort.desc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
  sortBySexeMembre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sexeMembre', Sort.asc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
  sortBySexeMembreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sexeMembre', Sort.desc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
  sortByTitre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titre', Sort.asc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
  sortByTitreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titre', Sort.desc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
  sortByTypeResponsable() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'typeResponsable', Sort.asc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
  sortByTypeResponsableDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'typeResponsable', Sort.desc);
    });
  }
}

extension NotificationModelQuerySortThenBy
    on QueryBuilder<NotificationModel, NotificationModel, QSortThenBy> {
  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
  thenByAgeMembre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ageMembre', Sort.asc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
  thenByAgeMembreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ageMembre', Sort.desc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
  thenByCategorie() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categorie', Sort.asc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
  thenByCategorieDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categorie', Sort.desc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
  thenByClasseMembre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'classeMembre', Sort.asc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
  thenByClasseMembreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'classeMembre', Sort.desc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
  thenByContactResponsable() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactResponsable', Sort.asc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
  thenByContactResponsableDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactResponsable', Sort.desc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
  thenByContactUrgence() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactUrgence', Sort.asc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
  thenByContactUrgenceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactUrgence', Sort.desc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
  thenByDateCreation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateCreation', Sort.asc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
  thenByDateCreationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateCreation', Sort.desc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
  thenByEstLue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estLue', Sort.asc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
  thenByEstLueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estLue', Sort.desc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
  thenByMessage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'message', Sort.asc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
  thenByMessageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'message', Sort.desc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
  thenByNomMembre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nomMembre', Sort.asc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
  thenByNomMembreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nomMembre', Sort.desc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
  thenByNomResponsable() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nomResponsable', Sort.asc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
  thenByNomResponsableDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nomResponsable', Sort.desc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
  thenByPersonneUrgence() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'personneUrgence', Sort.asc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
  thenByPersonneUrgenceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'personneUrgence', Sort.desc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
  thenByPrenomMembre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prenomMembre', Sort.asc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
  thenByPrenomMembreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prenomMembre', Sort.desc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
  thenBySexeMembre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sexeMembre', Sort.asc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
  thenBySexeMembreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sexeMembre', Sort.desc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
  thenByTitre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titre', Sort.asc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
  thenByTitreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titre', Sort.desc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
  thenByTypeResponsable() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'typeResponsable', Sort.asc);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QAfterSortBy>
  thenByTypeResponsableDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'typeResponsable', Sort.desc);
    });
  }
}

extension NotificationModelQueryWhereDistinct
    on QueryBuilder<NotificationModel, NotificationModel, QDistinct> {
  QueryBuilder<NotificationModel, NotificationModel, QDistinct>
  distinctByAgeMembre({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ageMembre', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QDistinct>
  distinctByCategorie({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'categorie', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QDistinct>
  distinctByClasseMembre({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'classeMembre', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QDistinct>
  distinctByContactResponsable({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'contactResponsable',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QDistinct>
  distinctByContactUrgence({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'contactUrgence',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QDistinct>
  distinctByDateCreation() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dateCreation');
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QDistinct>
  distinctByEstLue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estLue');
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QDistinct>
  distinctByMessage({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'message', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QDistinct>
  distinctByNomMembre({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nomMembre', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QDistinct>
  distinctByNomResponsable({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'nomResponsable',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QDistinct>
  distinctByPersonneUrgence({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'personneUrgence',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QDistinct>
  distinctByPhotoBytes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'photoBytes');
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QDistinct>
  distinctByPrenomMembre({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'prenomMembre', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QDistinct>
  distinctBySexeMembre({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sexeMembre', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QDistinct>
  distinctByTitre({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'titre', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NotificationModel, NotificationModel, QDistinct>
  distinctByTypeResponsable({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'typeResponsable',
        caseSensitive: caseSensitive,
      );
    });
  }
}

extension NotificationModelQueryProperty
    on QueryBuilder<NotificationModel, NotificationModel, QQueryProperty> {
  QueryBuilder<NotificationModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<NotificationModel, String, QQueryOperations>
  ageMembreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ageMembre');
    });
  }

  QueryBuilder<NotificationModel, String, QQueryOperations>
  categorieProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'categorie');
    });
  }

  QueryBuilder<NotificationModel, String, QQueryOperations>
  classeMembreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'classeMembre');
    });
  }

  QueryBuilder<NotificationModel, String, QQueryOperations>
  contactResponsableProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'contactResponsable');
    });
  }

  QueryBuilder<NotificationModel, String, QQueryOperations>
  contactUrgenceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'contactUrgence');
    });
  }

  QueryBuilder<NotificationModel, DateTime, QQueryOperations>
  dateCreationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dateCreation');
    });
  }

  QueryBuilder<NotificationModel, bool, QQueryOperations> estLueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estLue');
    });
  }

  QueryBuilder<NotificationModel, String, QQueryOperations> messageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'message');
    });
  }

  QueryBuilder<NotificationModel, String, QQueryOperations>
  nomMembreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nomMembre');
    });
  }

  QueryBuilder<NotificationModel, String, QQueryOperations>
  nomResponsableProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nomResponsable');
    });
  }

  QueryBuilder<NotificationModel, String, QQueryOperations>
  personneUrgenceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'personneUrgence');
    });
  }

  QueryBuilder<NotificationModel, List<int>?, QQueryOperations>
  photoBytesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'photoBytes');
    });
  }

  QueryBuilder<NotificationModel, String, QQueryOperations>
  prenomMembreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'prenomMembre');
    });
  }

  QueryBuilder<NotificationModel, String, QQueryOperations>
  sexeMembreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sexeMembre');
    });
  }

  QueryBuilder<NotificationModel, String, QQueryOperations> titreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'titre');
    });
  }

  QueryBuilder<NotificationModel, String, QQueryOperations>
  typeResponsableProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'typeResponsable');
    });
  }
}
