import 'dart:async';

import 'package:from_css_color/from_css_color.dart';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'subcategory_record.g.dart';

abstract class SubcategoryRecord
    implements Built<SubcategoryRecord, SubcategoryRecordBuilder> {
  static Serializer<SubcategoryRecord> get serializer =>
      _$subcategoryRecordSerializer;

  String? get category;

  String? get information;

  String? get name;

  int? get views;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(SubcategoryRecordBuilder builder) => builder
    ..category = ''
    ..information = ''
    ..name = ''
    ..views = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('subcategory');

  static Stream<SubcategoryRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<SubcategoryRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static SubcategoryRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      SubcategoryRecord(
        (c) => c
          ..category = snapshot.data['category']
          ..information = snapshot.data['information']
          ..name = snapshot.data['name']
          ..views = snapshot.data['views']?.round()
          ..ffRef = SubcategoryRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<SubcategoryRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'subcategory',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  SubcategoryRecord._();
  factory SubcategoryRecord([void Function(SubcategoryRecordBuilder) updates]) =
      _$SubcategoryRecord;

  static SubcategoryRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createSubcategoryRecordData({
  String? category,
  String? information,
  String? name,
  int? views,
}) {
  final firestoreData = serializers.toFirestore(
    SubcategoryRecord.serializer,
    SubcategoryRecord(
      (s) => s
        ..category = category
        ..information = information
        ..name = name
        ..views = views,
    ),
  );

  return firestoreData;
}
