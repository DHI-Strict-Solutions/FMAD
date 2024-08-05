import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AirfieldsRecord extends FirestoreRecord {
  AirfieldsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "icao_id" field.
  String? _icaoId;
  String get icaoId => _icaoId ?? '';
  bool hasIcaoId() => _icaoId != null;

  // "iata_id" field.
  String? _iataId;
  String get iataId => _iataId ?? '';
  bool hasIataId() => _iataId != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  bool hasCountry() => _country != null;

  // "geolocation" field.
  LatLng? _geolocation;
  LatLng? get geolocation => _geolocation;
  bool hasGeolocation() => _geolocation != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "international" field.
  bool? _international;
  bool get international => _international ?? false;
  bool hasInternational() => _international != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  void _initializeFields() {
    _icaoId = snapshotData['icao_id'] as String?;
    _iataId = snapshotData['iata_id'] as String?;
    _city = snapshotData['city'] as String?;
    _country = snapshotData['country'] as String?;
    _geolocation = snapshotData['geolocation'] as LatLng?;
    _name = snapshotData['name'] as String?;
    _international = snapshotData['international'] as bool?;
    _phoneNumber = snapshotData['phone_number'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Airfields');

  static Stream<AirfieldsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AirfieldsRecord.fromSnapshot(s));

  static Future<AirfieldsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AirfieldsRecord.fromSnapshot(s));

  static AirfieldsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AirfieldsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AirfieldsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AirfieldsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AirfieldsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AirfieldsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAirfieldsRecordData({
  String? icaoId,
  String? iataId,
  String? city,
  String? country,
  LatLng? geolocation,
  String? name,
  bool? international,
  String? phoneNumber,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'icao_id': icaoId,
      'iata_id': iataId,
      'city': city,
      'country': country,
      'geolocation': geolocation,
      'name': name,
      'international': international,
      'phone_number': phoneNumber,
    }.withoutNulls,
  );

  return firestoreData;
}

class AirfieldsRecordDocumentEquality implements Equality<AirfieldsRecord> {
  const AirfieldsRecordDocumentEquality();

  @override
  bool equals(AirfieldsRecord? e1, AirfieldsRecord? e2) {
    return e1?.icaoId == e2?.icaoId &&
        e1?.iataId == e2?.iataId &&
        e1?.city == e2?.city &&
        e1?.country == e2?.country &&
        e1?.geolocation == e2?.geolocation &&
        e1?.name == e2?.name &&
        e1?.international == e2?.international &&
        e1?.phoneNumber == e2?.phoneNumber;
  }

  @override
  int hash(AirfieldsRecord? e) => const ListEquality().hash([
        e?.icaoId,
        e?.iataId,
        e?.city,
        e?.country,
        e?.geolocation,
        e?.name,
        e?.international,
        e?.phoneNumber
      ]);

  @override
  bool isValidKey(Object? o) => o is AirfieldsRecord;
}
