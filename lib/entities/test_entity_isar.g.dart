// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_entity_isar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetTestEntityIsarCollection on Isar {
  IsarCollection<TestEntityIsar> get testEntityIsars => this.collection();
}

const TestEntityIsarSchema = CollectionSchema(
  name: r'TestEntityIsar',
  id: 2038307866744159520,
  properties: {
    r'dateTime': PropertySchema(
      id: 0,
      name: r'dateTime',
      type: IsarType.dateTime,
    ),
    r'houseId': PropertySchema(
      id: 1,
      name: r'houseId',
      type: IsarType.string,
    )
  },
  estimateSize: _testEntityIsarEstimateSize,
  serialize: _testEntityIsarSerialize,
  deserialize: _testEntityIsarDeserialize,
  deserializeProp: _testEntityIsarDeserializeProp,
  idName: r'id',
  indexes: {
    r'houseId': IndexSchema(
      id: 6513155272577299900,
      name: r'houseId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'houseId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _testEntityIsarGetId,
  getLinks: _testEntityIsarGetLinks,
  attach: _testEntityIsarAttach,
  version: '3.1.0+1',
);

int _testEntityIsarEstimateSize(
  TestEntityIsar object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.houseId.length * 3;
  return bytesCount;
}

void _testEntityIsarSerialize(
  TestEntityIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.dateTime);
  writer.writeString(offsets[1], object.houseId);
}

TestEntityIsar _testEntityIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TestEntityIsar(
    dateTime: reader.readDateTime(offsets[0]),
    houseId: reader.readString(offsets[1]),
  );
  object.id = id;
  return object;
}

P _testEntityIsarDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _testEntityIsarGetId(TestEntityIsar object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _testEntityIsarGetLinks(TestEntityIsar object) {
  return [];
}

void _testEntityIsarAttach(
    IsarCollection<dynamic> col, Id id, TestEntityIsar object) {
  object.id = id;
}

extension TestEntityIsarQueryWhereSort
    on QueryBuilder<TestEntityIsar, TestEntityIsar, QWhere> {
  QueryBuilder<TestEntityIsar, TestEntityIsar, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension TestEntityIsarQueryWhere
    on QueryBuilder<TestEntityIsar, TestEntityIsar, QWhereClause> {
  QueryBuilder<TestEntityIsar, TestEntityIsar, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<TestEntityIsar, TestEntityIsar, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<TestEntityIsar, TestEntityIsar, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<TestEntityIsar, TestEntityIsar, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<TestEntityIsar, TestEntityIsar, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TestEntityIsar, TestEntityIsar, QAfterWhereClause>
      houseIdEqualTo(String houseId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'houseId',
        value: [houseId],
      ));
    });
  }

  QueryBuilder<TestEntityIsar, TestEntityIsar, QAfterWhereClause>
      houseIdNotEqualTo(String houseId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'houseId',
              lower: [],
              upper: [houseId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'houseId',
              lower: [houseId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'houseId',
              lower: [houseId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'houseId',
              lower: [],
              upper: [houseId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension TestEntityIsarQueryFilter
    on QueryBuilder<TestEntityIsar, TestEntityIsar, QFilterCondition> {
  QueryBuilder<TestEntityIsar, TestEntityIsar, QAfterFilterCondition>
      dateTimeEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateTime',
        value: value,
      ));
    });
  }

  QueryBuilder<TestEntityIsar, TestEntityIsar, QAfterFilterCondition>
      dateTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dateTime',
        value: value,
      ));
    });
  }

  QueryBuilder<TestEntityIsar, TestEntityIsar, QAfterFilterCondition>
      dateTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dateTime',
        value: value,
      ));
    });
  }

  QueryBuilder<TestEntityIsar, TestEntityIsar, QAfterFilterCondition>
      dateTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dateTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TestEntityIsar, TestEntityIsar, QAfterFilterCondition>
      houseIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'houseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TestEntityIsar, TestEntityIsar, QAfterFilterCondition>
      houseIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'houseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TestEntityIsar, TestEntityIsar, QAfterFilterCondition>
      houseIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'houseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TestEntityIsar, TestEntityIsar, QAfterFilterCondition>
      houseIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'houseId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TestEntityIsar, TestEntityIsar, QAfterFilterCondition>
      houseIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'houseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TestEntityIsar, TestEntityIsar, QAfterFilterCondition>
      houseIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'houseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TestEntityIsar, TestEntityIsar, QAfterFilterCondition>
      houseIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'houseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TestEntityIsar, TestEntityIsar, QAfterFilterCondition>
      houseIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'houseId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TestEntityIsar, TestEntityIsar, QAfterFilterCondition>
      houseIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'houseId',
        value: '',
      ));
    });
  }

  QueryBuilder<TestEntityIsar, TestEntityIsar, QAfterFilterCondition>
      houseIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'houseId',
        value: '',
      ));
    });
  }

  QueryBuilder<TestEntityIsar, TestEntityIsar, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TestEntityIsar, TestEntityIsar, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TestEntityIsar, TestEntityIsar, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TestEntityIsar, TestEntityIsar, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension TestEntityIsarQueryObject
    on QueryBuilder<TestEntityIsar, TestEntityIsar, QFilterCondition> {}

extension TestEntityIsarQueryLinks
    on QueryBuilder<TestEntityIsar, TestEntityIsar, QFilterCondition> {}

extension TestEntityIsarQuerySortBy
    on QueryBuilder<TestEntityIsar, TestEntityIsar, QSortBy> {
  QueryBuilder<TestEntityIsar, TestEntityIsar, QAfterSortBy> sortByDateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateTime', Sort.asc);
    });
  }

  QueryBuilder<TestEntityIsar, TestEntityIsar, QAfterSortBy>
      sortByDateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateTime', Sort.desc);
    });
  }

  QueryBuilder<TestEntityIsar, TestEntityIsar, QAfterSortBy> sortByHouseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'houseId', Sort.asc);
    });
  }

  QueryBuilder<TestEntityIsar, TestEntityIsar, QAfterSortBy>
      sortByHouseIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'houseId', Sort.desc);
    });
  }
}

extension TestEntityIsarQuerySortThenBy
    on QueryBuilder<TestEntityIsar, TestEntityIsar, QSortThenBy> {
  QueryBuilder<TestEntityIsar, TestEntityIsar, QAfterSortBy> thenByDateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateTime', Sort.asc);
    });
  }

  QueryBuilder<TestEntityIsar, TestEntityIsar, QAfterSortBy>
      thenByDateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateTime', Sort.desc);
    });
  }

  QueryBuilder<TestEntityIsar, TestEntityIsar, QAfterSortBy> thenByHouseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'houseId', Sort.asc);
    });
  }

  QueryBuilder<TestEntityIsar, TestEntityIsar, QAfterSortBy>
      thenByHouseIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'houseId', Sort.desc);
    });
  }

  QueryBuilder<TestEntityIsar, TestEntityIsar, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<TestEntityIsar, TestEntityIsar, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension TestEntityIsarQueryWhereDistinct
    on QueryBuilder<TestEntityIsar, TestEntityIsar, QDistinct> {
  QueryBuilder<TestEntityIsar, TestEntityIsar, QDistinct> distinctByDateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dateTime');
    });
  }

  QueryBuilder<TestEntityIsar, TestEntityIsar, QDistinct> distinctByHouseId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'houseId', caseSensitive: caseSensitive);
    });
  }
}

extension TestEntityIsarQueryProperty
    on QueryBuilder<TestEntityIsar, TestEntityIsar, QQueryProperty> {
  QueryBuilder<TestEntityIsar, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<TestEntityIsar, DateTime, QQueryOperations> dateTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dateTime');
    });
  }

  QueryBuilder<TestEntityIsar, String, QQueryOperations> houseIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'houseId');
    });
  }
}
