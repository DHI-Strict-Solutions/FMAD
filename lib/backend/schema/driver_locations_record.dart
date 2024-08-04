import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DriverLocationsRecord extends FirestoreRecord {
  DriverLocationsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "driverId" field.
  String? _driverId;
  String get driverId => _driverId ?? '';
  bool hasDriverId() => _driverId != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  void _initializeFields() {
    _driverId = snapshotData['driverId'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _location = snapshotData['location'] as LatLng?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('DriverLocations');

  static Stream<DriverLocationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DriverLocationsRecord.fromSnapshot(s));

  static Future<DriverLocationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DriverLocationsRecord.fromSnapshot(s));

  static DriverLocationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DriverLocationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DriverLocationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DriverLocationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DriverLocationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DriverLocationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDriverLocationsRecordData({
  String? driverId,
  DateTime? timestamp,
  LatLng? location,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'driverId': driverId,
      'timestamp': timestamp,
      'location': location,
    }.withoutNulls,
  );

  return firestoreData;
}

class DriverLocationsRecordDocumentEquality
    implements Equality<DriverLocationsRecord> {
  const DriverLocationsRecordDocumentEquality();

  @override
  bool equals(DriverLocationsRecord? e1, DriverLocationsRecord? e2) {
    return e1?.driverId == e2?.driverId &&
        e1?.timestamp == e2?.timestamp &&
        e1?.location == e2?.location;
  }

  @override
  int hash(DriverLocationsRecord? e) =>
      const ListEquality().hash([e?.driverId, e?.timestamp, e?.location]);

  @override
  bool isValidKey(Object? o) => o is DriverLocationsRecord;
}
