import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      if (prefs.containsKey('ff_noofpoints')) {
        try {
          final serializedData = prefs.getString('ff_noofpoints') ?? '{}';
          _noofpoints =
              PointsStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  PointsStruct _noofpoints = PointsStruct();
  PointsStruct get noofpoints => _noofpoints;
  set noofpoints(PointsStruct value) {
    _noofpoints = value;
    prefs.setString('ff_noofpoints', value.serialize());
  }

  void updateNoofpointsStruct(Function(PointsStruct) updateFn) {
    updateFn(_noofpoints);
    prefs.setString('ff_noofpoints', _noofpoints.serialize());
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
