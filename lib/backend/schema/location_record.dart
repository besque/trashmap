import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LocationRecord extends FirestoreRecord {
  LocationRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "corrds" field.
  LatLng? _corrds;
  LatLng? get corrds => _corrds;
  bool hasCorrds() => _corrds != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "img" field.
  String? _img;
  String get img => _img ?? '';
  bool hasImg() => _img != null;

  // "rating" field.
  double? _rating;
  double get rating => _rating ?? 0.0;
  bool hasRating() => _rating != null;

  // "reguser" field.
  List<DocumentReference>? _reguser;
  List<DocumentReference> get reguser => _reguser ?? const [];
  bool hasReguser() => _reguser != null;

  // "createdat" field.
  DateTime? _createdat;
  DateTime? get createdat => _createdat;
  bool hasCreatedat() => _createdat != null;

  // "owner" field.
  DocumentReference? _owner;
  DocumentReference? get owner => _owner;
  bool hasOwner() => _owner != null;

  // "pincode" field.
  List<int>? _pincode;
  List<int> get pincode => _pincode ?? const [];
  bool hasPincode() => _pincode != null;

  void _initializeFields() {
    _corrds = snapshotData['corrds'] as LatLng?;
    _description = snapshotData['description'] as String?;
    _name = snapshotData['name'] as String?;
    _img = snapshotData['img'] as String?;
    _rating = castToType<double>(snapshotData['rating']);
    _reguser = getDataList(snapshotData['reguser']);
    _createdat = snapshotData['createdat'] as DateTime?;
    _owner = snapshotData['owner'] as DocumentReference?;
    _pincode = getDataList(snapshotData['pincode']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('location');

  static Stream<LocationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LocationRecord.fromSnapshot(s));

  static Future<LocationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LocationRecord.fromSnapshot(s));

  static LocationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LocationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LocationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LocationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LocationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LocationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLocationRecordData({
  LatLng? corrds,
  String? description,
  String? name,
  String? img,
  double? rating,
  DateTime? createdat,
  DocumentReference? owner,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'corrds': corrds,
      'description': description,
      'name': name,
      'img': img,
      'rating': rating,
      'createdat': createdat,
      'owner': owner,
    }.withoutNulls,
  );

  return firestoreData;
}

class LocationRecordDocumentEquality implements Equality<LocationRecord> {
  const LocationRecordDocumentEquality();

  @override
  bool equals(LocationRecord? e1, LocationRecord? e2) {
    const listEquality = ListEquality();
    return e1?.corrds == e2?.corrds &&
        e1?.description == e2?.description &&
        e1?.name == e2?.name &&
        e1?.img == e2?.img &&
        e1?.rating == e2?.rating &&
        listEquality.equals(e1?.reguser, e2?.reguser) &&
        e1?.createdat == e2?.createdat &&
        e1?.owner == e2?.owner &&
        listEquality.equals(e1?.pincode, e2?.pincode);
  }

  @override
  int hash(LocationRecord? e) => const ListEquality().hash([
        e?.corrds,
        e?.description,
        e?.name,
        e?.img,
        e?.rating,
        e?.reguser,
        e?.createdat,
        e?.owner,
        e?.pincode
      ]);

  @override
  bool isValidKey(Object? o) => o is LocationRecord;
}
