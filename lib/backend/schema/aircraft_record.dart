import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AircraftRecord extends FirestoreRecord {
  AircraftRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "aircraftId" field.
  String? _aircraftId;
  String get aircraftId => _aircraftId ?? '';
  bool hasAircraftId() => _aircraftId != null;

  // "model" field.
  String? _model;
  String get model => _model ?? '';
  bool hasModel() => _model != null;

  // "registrationNumber" field.
  String? _registrationNumber;
  String get registrationNumber => _registrationNumber ?? '';
  bool hasRegistrationNumber() => _registrationNumber != null;

  // "capacity" field.
  int? _capacity;
  int get capacity => _capacity ?? 0;
  bool hasCapacity() => _capacity != null;

  void _initializeFields() {
    _aircraftId = snapshotData['aircraftId'] as String?;
    _model = snapshotData['model'] as String?;
    _registrationNumber = snapshotData['registrationNumber'] as String?;
    _capacity = castToType<int>(snapshotData['capacity']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Aircraft');

  static Stream<AircraftRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AircraftRecord.fromSnapshot(s));

  static Future<AircraftRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AircraftRecord.fromSnapshot(s));

  static AircraftRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AircraftRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AircraftRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AircraftRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AircraftRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AircraftRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAircraftRecordData({
  String? aircraftId,
  String? model,
  String? registrationNumber,
  int? capacity,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'aircraftId': aircraftId,
      'model': model,
      'registrationNumber': registrationNumber,
      'capacity': capacity,
    }.withoutNulls,
  );

  return firestoreData;
}

class AircraftRecordDocumentEquality implements Equality<AircraftRecord> {
  const AircraftRecordDocumentEquality();

  @override
  bool equals(AircraftRecord? e1, AircraftRecord? e2) {
    return e1?.aircraftId == e2?.aircraftId &&
        e1?.model == e2?.model &&
        e1?.registrationNumber == e2?.registrationNumber &&
        e1?.capacity == e2?.capacity;
  }

  @override
  int hash(AircraftRecord? e) => const ListEquality()
      .hash([e?.aircraftId, e?.model, e?.registrationNumber, e?.capacity]);

  @override
  bool isValidKey(Object? o) => o is AircraftRecord;
}
