import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static final UserPreferences _instancia = UserPreferences._internal();

  factory UserPreferences() {
    return _instancia;
  }

  UserPreferences._internal();

  late SharedPreferences _prefs;

  initPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // void setAcceptLocation() {
  //   _prefs.setBool('accept_location', true);
  // }

  // bool get acceptLocation {
  //   return _prefs.getBool('accept_location') ?? false;
  // }

  // set setAcceptLocationPermision(bool status) {
  //   _prefs.setBool('accept_locationPermision', status);
  // }

  // bool get acceptLocationPermision {
  //   return _prefs.getBool('accept_locationPermision') ?? false;
  // }

  // bool get registerComplete {
  //   return _prefs.getBool('registerComplete') ?? false;
  // }

  // set registerComplete(bool status) {
  //   _prefs.setBool('registerComplete', status);
  // }

  // bool get registerCompleteDirecction {
  //   return _prefs.getBool('registerCompleteDirecction') ?? false;
  // }

  // set registerCompleteDirecction(bool status) {
  //   _prefs.setBool('registerCompleteDirecction', status);
  // }

  // String get usernumber {
  //   return _prefs.getString('pref_number');
  // }

  // String get username {
  //   return _prefs.getString('pref_name');
  // }

  // String get userdirection {
  //   return _prefs.getString('pref_direction');
  // }

  // String get userubication {
  //   return _prefs.getString('pref_ubication');
  // }

  // String get usercity {
  //   return _prefs.getString('pref_city');
  // }

  // String get useridUser {
  //   return _prefs.getString('pref_idUser');
  // }

  // String get userTokenNotification {
  //   return _prefs.getString('pref_TokenNotification');
  // }

  // set userTokenNotification(String data) {
  //   _prefs.setString('pref_TokenNotification', data);
  // }

  // bool get aplicationTutorialHomeGuide {
  //   return _prefs.getBool('pref_aplicationTutorialHomeGuide') ?? false;
  // }

  // set aplicationTutorialHomeGuide(bool data) {
  //   _prefs.setBool('pref_aplicationTutorialHomeGuide', data);
  // }

  // set usernumber(String data) {
  //   _prefs.setString('pref_number', data);
  // }

  // set username(String data) {
  //   _prefs.setString('pref_name', data);
  // }

  // set userdirection(String data) {
  //   _prefs.setString('pref_direction', data);
  // }

  // set userubication(String data) {
  //   _prefs.setString('pref_ubication', data);
  // }

  // set usercity(String data) {
  //   _prefs.setString('pref_city', data);
  // }

  // set useridUser(String data) {
  //   _prefs.setString('pref_idUser', data);
  // }

  // double get factorDistancePrice =>
  //     _prefs.getDouble('pref_factorDistancePrice');
  // double get factorBaseDistance => _prefs.getDouble('pref_factorBaseDistance');
  // double get factorBasePrice => _prefs.getDouble('pref_factorBasePrice');
  // double get factorExtraBusinessPrice =>
  //     _prefs.getDouble('pref_factorExtraBusinessPrice');
  // double get factorExtraDistance =>
  //     _prefs.getDouble('pref_factorExtraDistance');
  // String get versionApk => _prefs.getString('pref_versionApk');

  // set factorDistancePrice(double data) {
  //   _prefs.setDouble('pref_factorDistancePrice', data);
  // }

  // set factorBaseDistance(double data) {
  //   _prefs.setDouble('pref_factorBaseDistance', data);
  // }

  // set factorBasePrice(double data) {
  //   _prefs.setDouble('pref_factorBasePrice', data);
  // }

  // set versionApk(String data) {
  //   _prefs.setString('pref_versionApk', data);
  // }

  // String get versionApkAUX => _prefs.getString('pref_versionApkAUX');
  // set versionApkAUX(String data) {
  //   _prefs.setString('pref_versionApkAUX', data);
  // }

  // String get versionApkBuilder => _prefs.getString('pref_versionApkBuilder');
  // set versionApkBuilder(String data) {
  //   _prefs.setString('pref_versionApkBuilder', data);
  // }

  // set factorExtraBusinessPrice(double data) {
  //   _prefs.setDouble('pref_factorExtraBusinessPrice', data);
  // }

  // set factorExtraDistance(double data) {
  //   _prefs.setDouble('pref_factorExtraDistance', data);
  // }

  // // ignore: always_declare_return_types
  // preferensCostoDelivery(String key, double valor) {
  //   _prefs.setDouble(key, valor);
  // }

  // double getpreferensCostoDelivery(String key) {
  //   return _prefs.getDouble(key);
  // }

  // List<String> get listCity => _prefs.getStringList('pref_listCity') ?? [];
  // set listCity(List<String> data) {
  //   _prefs.setStringList('pref_listCity', data);
  // }

  // // List<String> get listBuilder =>
  // //     _prefs.getStringList('pref_listBuilder') ?? [];
  // // set listBuilder(List<String> data) {
  // //   _prefs.setStringList('pref_listBuilder', data);
  // // }

  // double get minBuild => _prefs.getDouble('pref_minBuild');
  // set minBuild(double data) {
  //   _prefs.setDouble('pref_minBuild', data);
  // }

  // double get velocityOfMotorcicle =>
  //     _prefs.getDouble('pref_velocityOfMotorcicle');
  // set velocityOfMotorcicle(double data) {
  //   _prefs.setDouble('pref_velocityOfMotorcicle', data);
  // }
}
