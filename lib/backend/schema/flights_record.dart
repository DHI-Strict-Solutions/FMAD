import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FlightsRecord extends FirestoreRecord {
  FlightsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "flightId" field.
  String? _flightId;
  String get flightId => _flightId ?? '';
  bool hasFlightId() => _flightId != null;

  // "flightNumber" field.
  String? _flightNumber;
  String get flightNumber => _flightNumber ?? '';
  bool hasFlightNumber() => _flightNumber != null;

  // "departureAirport" field.
  String? _departureAirport;
  String get departureAirport => _departureAirport ?? '';
  bool hasDepartureAirport() => _departureAirport != null;

  // "arrivalAirport" field.
  String? _arrivalAirport;
  String get arrivalAirport => _arrivalAirport ?? '';
  bool hasArrivalAirport() => _arrivalAirport != null;

  // "departureTime" field.
  DateTime? _departureTime;
  DateTime? get departureTime => _departureTime;
  bool hasDepartureTime() => _departureTime != null;

  // "arrivalTime" field.
  DateTime? _arrivalTime;
  DateTime? get arrivalTime => _arrivalTime;
  bool hasArrivalTime() => _arrivalTime != null;

  // "aircraftId" field.
  String? _aircraftId;
  String get aircraftId => _aircraftId ?? '';
  bool hasAircraftId() => _aircraftId != null;

  // "pilotId" field.
  String? _pilotId;
  String get pilotId => _pilotId ?? '';
  bool hasPilotId() => _pilotId != null;

  void _initializeFields() {
    _flightId = snapshotData['flightId'] as String?;
    _flightNumber = snapshotData['flightNumber'] as String?;
    _departureAirport = snapshotData['departureAirport'] as String?;
    _arrivalAirport = snapshotData['arrivalAirport'] as String?;
    _departureTime = snapshotData['departureTime'] as DateTime?;
    _arrivalTime = snapshotData['arrivalTime'] as DateTime?;
    _aircraftId = snapshotData['aircraftId'] as String?;
    _pilotId = snapshotData['pilotId'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Flights');

  static Stream<FlightsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FlightsRecord.fromSnapshot(s));

  static Future<FlightsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FlightsRecord.fromSnapshot(s));

  static FlightsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FlightsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FlightsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FlightsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FlightsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FlightsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFlightsRecordData({
  String? flightId,
  String? flightNumber,
  String? departureAirport,
  String? arrivalAirport,
  DateTime? departureTime,
  DateTime? arrivalTime,
  String? aircraftId,
  String? pilotId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'flightId': flightId,
      'flightNumber': flightNumber,
      'departureAirport': departureAirport,
      'arrivalAirport': arrivalAirport,
      'departureTime': departureTime,
      'arrivalTime': arrivalTime,
      'aircraftId': aircraftId,
      'pilotId': pilotId,
    }.withoutNulls,
  );

  return firestoreData;
}

class FlightsRecordDocumentEquality implements Equality<FlightsRecord> {
  const FlightsRecordDocumentEquality();

  @override
  bool equals(FlightsRecord? e1, FlightsRecord? e2) {
    return e1?.flightId == e2?.flightId &&
        e1?.flightNumber == e2?.flightNumber &&
        e1?.departureAirport == e2?.departureAirport &&
        e1?.arrivalAirport == e2?.arrivalAirport &&
        e1?.departureTime == e2?.departureTime &&
        e1?.arrivalTime == e2?.arrivalTime &&
        e1?.aircraftId == e2?.aircraftId &&
        e1?.pilotId == e2?.pilotId;
  }

  @override
  int hash(FlightsRecord? e) => const ListEquality().hash([
        e?.flightId,
        e?.flightNumber,
        e?.departureAirport,
        e?.arrivalAirport,
        e?.departureTime,
        e?.arrivalTime,
        e?.aircraftId,
        e?.pilotId
      ]);

  @override
  bool isValidKey(Object? o) => o is FlightsRecord;
}
