import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:lupiter_work_demo/data/models/address.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static const _databaseName = "demo.db";
  static const _databaseVersion = 1;

  static const table = "address";

  static const columnAddressName = 'name';
  static const columnAddressStreet = 'street';
  static const columnAddressZipCode = 'zip_code';
  static const columnAddressCity = 'city';

  DbHelper._privateConstructor();

  static final DbHelper instance = DbHelper._privateConstructor();

  static late Database _database;

  Future<Database> get database async {
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnAddressName TEXT NOT NULL,
            $columnAddressStreet TEXT,
            $columnAddressZipCode TEXT,
            $columnAddressCity TEXT
          )
          ''');
  }

  Future<int> addAddress(Address address) async {
    Database db = await instance.database;
    try {
      var res = await db.insert(table, address.toJson());
      return res;
    } catch (e) {
      debugPrint('error while adding address: $e');
    }
    return 0;
  }

  Future<List<Address>> queryAllRows() async {
    Database db = await instance.database;
    var res = await db.query(table);
    List<Address> list = [];
    for (final address in res) {
      list.add(Address.fromJson(address));
    }

    return list;
  }

  Future<void> closeDb() async {
    Database db = await instance.database;
    await db.close();
  }
}
