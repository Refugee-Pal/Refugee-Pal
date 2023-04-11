import 'dart:async';

import 'package:from_css_color/from_css_color.dart';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'category_record.g.dart';

abstract class CategoryRecord
    implements Built<CategoryRecord, CategoryRecordBuilder> {
  static Serializer<CategoryRecord> get serializer =>
      _$categoryRecordSerializer;

  String? get title;

  String? get description;

  String? get banner;

  bool? get isinmap;

  String? get icon;

  String? get algolia;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(CategoryRecordBuilder builder) => builder
    ..title = ''
    ..description = ''
    ..banner = ''
    ..isinmap = false
    ..icon = ''
    ..algolia = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('category');

  static Stream<CategoryRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<CategoryRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static CategoryRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      CategoryRecord(
        (c) => c
          ..title = snapshot.data['title']
          ..description = snapshot.data['description']
          ..banner = snapshot.data['banner']
          ..isinmap = snapshot.data['isinmap']
          ..icon = snapshot.data['icon']
          ..algolia = snapshot.data['algolia']
          ..ffRef = CategoryRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<CategoryRecord>> search(
          {String? term,
          FutureOr<LatLng>? location,
          int? maxResults,
          double? searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'category',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  CategoryRecord._();
  factory CategoryRecord([void Function(CategoryRecordBuilder) updates]) =
      _$CategoryRecord;

  static CategoryRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createCategoryRecordData({
  String? title,
  String? description,
  String? banner,
  bool? isinmap,
  String? icon,
  String? algolia,
}) {
  final firestoreData = serializers.toFirestore(
    CategoryRecord.serializer,
    CategoryRecord(
      (c) => c
        ..title = title
        ..description = description
        ..banner = banner
        ..isinmap = isinmap
        ..icon = icon
        ..algolia = algolia,
    ),
  );

  return firestoreData;
}
