import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RunwayRecord extends FirestoreRecord {
  RunwayRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "asphalt" field.
  bool? _asphalt;
  bool get asphalt => _asphalt ?? false;
  bool hasAsphalt() => _asphalt != null;

  // "length" field.
  double? _length;
  double get length => _length ?? 0.0;
  bool hasLength() => _length != null;

  // "width" field.
  double? _width;
  double get width => _width ?? 0.0;
  bool hasWidth() => _width != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _asphalt = snapshotData['asphalt'] as bool?;
    _length = castToType<double>(snapshotData['length']);
    _width = castToType<double>(snapshotData['width']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('runway')
          : FirebaseFirestore.instance.collectionGroup('runway');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('runway').doc(id);

  static Stream<RunwayRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RunwayRecord.fromSnapshot(s));

  static Future<RunwayRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RunwayRecord.fromSnapshot(s));

  static RunwayRecord fromSnapshot(DocumentSnapshot snapshot) => RunwayRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RunwayRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RunwayRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RunwayRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RunwayRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRunwayRecordData({
  bool? asphalt,
  double? length,
  double? width,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'asphalt': asphalt,
      'length': length,
      'width': width,
    }.withoutNulls,
  );

  return firestoreData;
}

class RunwayRecordDocumentEquality implements Equality<RunwayRecord> {
  const RunwayRecordDocumentEquality();

  @override
  bool equals(RunwayRecord? e1, RunwayRecord? e2) {
    return e1?.asphalt == e2?.asphalt &&
        e1?.length == e2?.length &&
        e1?.width == e2?.width;
  }

  @override
  int hash(RunwayRecord? e) =>
      const ListEquality().hash([e?.asphalt, e?.length, e?.width]);

  @override
  bool isValidKey(Object? o) => o is RunwayRecord;
}
