import 'package:flutter/material.dart';
import 'package:lupiter_work_demo/data/models/address.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common/constants.dart';

class AppSharedPreferences {
  late SharedPreferences _prefs;

  Future<AppSharedPreferences> getInstance() async {
    _prefs = await SharedPreferences.getInstance();
    return AppSharedPreferences();
  }

  Future<void> updatePref(Address address) async {
    _prefs = await SharedPreferences.getInstance();
    await _prefs.setString(Constants.keyAddressName, address.name);
    await _prefs.setString(Constants.keyAddressStreet, address.street);
    await _prefs.setString(Constants.keyAddressZip, address.zipCode);
    await _prefs.setString(Constants.keyAddressCity, address.city);
  }

  Future<Address> getPref() async {
    _prefs = await SharedPreferences.getInstance();
    final name = _prefs.getString(Constants.keyAddressName) ?? '';
    final street = _prefs.getString(Constants.keyAddressStreet) ?? '';
    final zip = _prefs.getString(Constants.keyAddressZip) ?? '';
    final city = _prefs.getString(Constants.keyAddressCity) ?? '';
    debugPrint(name + street + zip + city);
    return Address(name: name, street: street, zipCode: zip, city: city);
  }
}
