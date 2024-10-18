// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PointsStruct extends FFFirebaseStruct {
  PointsStruct({
    int? pointsfield,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _pointsfield = pointsfield,
        super(firestoreUtilData);

  // "pointsfield" field.
  int? _pointsfield;
  int get pointsfield => _pointsfield ?? 0;
  set pointsfield(int? val) => _pointsfield = val;

  void incrementPointsfield(int amount) => pointsfield = pointsfield + amount;

  bool hasPointsfield() => _pointsfield != null;

  static PointsStruct fromMap(Map<String, dynamic> data) => PointsStruct(
        pointsfield: castToType<int>(data['pointsfield']),
      );

  static PointsStruct? maybeFromMap(dynamic data) =>
      data is Map ? PointsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'pointsfield': _pointsfield,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'pointsfield': serializeParam(
          _pointsfield,
          ParamType.int,
        ),
      }.withoutNulls;

  static PointsStruct fromSerializableMap(Map<String, dynamic> data) =>
      PointsStruct(
        pointsfield: deserializeParam(
          data['pointsfield'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'PointsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PointsStruct && pointsfield == other.pointsfield;
  }

  @override
  int get hashCode => const ListEquality().hash([pointsfield]);
}

PointsStruct createPointsStruct({
  int? pointsfield,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PointsStruct(
      pointsfield: pointsfield,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PointsStruct? updatePointsStruct(
  PointsStruct? points, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    points
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPointsStructData(
  Map<String, dynamic> firestoreData,
  PointsStruct? points,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (points == null) {
    return;
  }
  if (points.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && points.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final pointsData = getPointsFirestoreData(points, forFieldValue);
  final nestedData = pointsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = points.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPointsFirestoreData(
  PointsStruct? points, [
  bool forFieldValue = false,
]) {
  if (points == null) {
    return {};
  }
  final firestoreData = mapToFirestore(points.toMap());

  // Add any Firestore field values
  points.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPointsListFirestoreData(
  List<PointsStruct>? pointss,
) =>
    pointss?.map((e) => getPointsFirestoreData(e, true)).toList() ?? [];
