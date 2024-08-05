import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FinancialDataRecord extends FirestoreRecord {
  FinancialDataRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "maintenanceCost" field.
  double? _maintenanceCost;
  double get maintenanceCost => _maintenanceCost ?? 0.0;
  bool hasMaintenanceCost() => _maintenanceCost != null;

  // "flightHourCostWithoutPax" field.
  double? _flightHourCostWithoutPax;
  double get flightHourCostWithoutPax => _flightHourCostWithoutPax ?? 0.0;
  bool hasFlightHourCostWithoutPax() => _flightHourCostWithoutPax != null;

  // "flightHourCostWithPax" field.
  double? _flightHourCostWithPax;
  double get flightHourCostWithPax => _flightHourCostWithPax ?? 0.0;
  bool hasFlightHourCostWithPax() => _flightHourCostWithPax != null;

  // "rentCost" field.
  double? _rentCost;
  double get rentCost => _rentCost ?? 0.0;
  bool hasRentCost() => _rentCost != null;

  // "insuranceCost" field.
  double? _insuranceCost;
  double get insuranceCost => _insuranceCost ?? 0.0;
  bool hasInsuranceCost() => _insuranceCost != null;

  // "currency" field.
  String? _currency;
  String get currency => _currency ?? '';
  bool hasCurrency() => _currency != null;

  // "flightId" field.
  String? _flightId;
  String get flightId => _flightId ?? '';
  bool hasFlightId() => _flightId != null;

  // "type" field.
  List<String>? _type;
  List<String> get type => _type ?? const [];
  bool hasType() => _type != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  void _initializeFields() {
    _maintenanceCost = castToType<double>(snapshotData['maintenanceCost']);
    _flightHourCostWithoutPax =
        castToType<double>(snapshotData['flightHourCostWithoutPax']);
    _flightHourCostWithPax =
        castToType<double>(snapshotData['flightHourCostWithPax']);
    _rentCost = castToType<double>(snapshotData['rentCost']);
    _insuranceCost = castToType<double>(snapshotData['insuranceCost']);
    _currency = snapshotData['currency'] as String?;
    _flightId = snapshotData['flightId'] as String?;
    _type = getDataList(snapshotData['type']);
    _description = snapshotData['description'] as String?;
    _date = snapshotData['date'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('FinancialData');

  static Stream<FinancialDataRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FinancialDataRecord.fromSnapshot(s));

  static Future<FinancialDataRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FinancialDataRecord.fromSnapshot(s));

  static FinancialDataRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FinancialDataRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FinancialDataRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FinancialDataRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FinancialDataRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FinancialDataRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFinancialDataRecordData({
  double? maintenanceCost,
  double? flightHourCostWithoutPax,
  double? flightHourCostWithPax,
  double? rentCost,
  double? insuranceCost,
  String? currency,
  String? flightId,
  String? description,
  DateTime? date,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'maintenanceCost': maintenanceCost,
      'flightHourCostWithoutPax': flightHourCostWithoutPax,
      'flightHourCostWithPax': flightHourCostWithPax,
      'rentCost': rentCost,
      'insuranceCost': insuranceCost,
      'currency': currency,
      'flightId': flightId,
      'description': description,
      'date': date,
    }.withoutNulls,
  );

  return firestoreData;
}

class FinancialDataRecordDocumentEquality
    implements Equality<FinancialDataRecord> {
  const FinancialDataRecordDocumentEquality();

  @override
  bool equals(FinancialDataRecord? e1, FinancialDataRecord? e2) {
    const listEquality = ListEquality();
    return e1?.maintenanceCost == e2?.maintenanceCost &&
        e1?.flightHourCostWithoutPax == e2?.flightHourCostWithoutPax &&
        e1?.flightHourCostWithPax == e2?.flightHourCostWithPax &&
        e1?.rentCost == e2?.rentCost &&
        e1?.insuranceCost == e2?.insuranceCost &&
        e1?.currency == e2?.currency &&
        e1?.flightId == e2?.flightId &&
        listEquality.equals(e1?.type, e2?.type) &&
        e1?.description == e2?.description &&
        e1?.date == e2?.date;
  }

  @override
  int hash(FinancialDataRecord? e) => const ListEquality().hash([
        e?.maintenanceCost,
        e?.flightHourCostWithoutPax,
        e?.flightHourCostWithPax,
        e?.rentCost,
        e?.insuranceCost,
        e?.currency,
        e?.flightId,
        e?.type,
        e?.description,
        e?.date
      ]);

  @override
  bool isValidKey(Object? o) => o is FinancialDataRecord;
}
