import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'items_record.g.dart';

abstract class ItemsRecord implements Built<ItemsRecord, ItemsRecordBuilder> {
  static Serializer<ItemsRecord> get serializer => _$itemsRecordSerializer;

  @nullable
  String get name;

  @nullable
  int get numebr;

  @nullable
  bool get isAvailable;

  @nullable
  @BuiltValueField(wireName: 'product_list_ref')
  BuiltList<DocumentReference> get productListRef;

  @nullable
  @BuiltValueField(wireName: 'city_ref')
  DocumentReference get cityRef;

  @nullable
  DateTime get when;

  @nullable
  String get description;

  @nullable
  @BuiltValueField(wireName: 'user_ref')
  DocumentReference get userRef;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ItemsRecordBuilder builder) => builder
    ..name = ''
    ..numebr = 0
    ..isAvailable = false
    ..productListRef = ListBuilder()
    ..description = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('items');

  static Stream<ItemsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<ItemsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  ItemsRecord._();
  factory ItemsRecord([void Function(ItemsRecordBuilder) updates]) =
      _$ItemsRecord;

  static ItemsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createItemsRecordData({
  String name,
  int numebr,
  bool isAvailable,
  DocumentReference cityRef,
  DateTime when,
  String description,
  DocumentReference userRef,
}) =>
    serializers.toFirestore(
        ItemsRecord.serializer,
        ItemsRecord((i) => i
          ..name = name
          ..numebr = numebr
          ..isAvailable = isAvailable
          ..productListRef = null
          ..cityRef = cityRef
          ..when = when
          ..description = description
          ..userRef = userRef));
