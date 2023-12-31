import 'dart:convert';

import 'package:fevent/src/network/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPrefs {
  factory UserPrefs() => instance;
  UserPrefs._internal();

  static final UserPrefs instance = UserPrefs._internal();
  late SharedPreferences _prefs;
  Future initialize() async {
    _prefs = await SharedPreferences.getInstance();
  }

  UserModel? getUser() {
    String? value = _prefs.getString("USER");
    if (value?.isNotEmpty == true && json.decode(value ?? '') != null) {
      Map<String, dynamic> map = json.decode(value!);
      return UserModel.fromJson(map);
    }
    return null;
  }

  Future<void> saveUser(UserModel? user) async {
    String value = json.encode(user?.toJson());
    _prefs.setString("USER", value);
  }

  // String? get getTokenUser =>
  //     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjU4YjQ2YWYyLTI2ODUtNDRhMS1iYWM1LWE3YjY4YzQ4NDJmNCIsImlhdCI6MTY5MTIyNDkyNH0.7PyfEp-RuA4eu5Np2E3LH-kTNMMLjM6ekl5LQbdqGZY";

  //String? get getUserID => getUser()?.id;

  String? get getTokenUser => getUser()?.token;
}
