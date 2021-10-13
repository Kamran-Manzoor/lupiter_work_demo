import 'package:flutter/cupertino.dart';
import 'package:lupiter_work_demo/data/local/db_helper.dart';
import 'package:lupiter_work_demo/data/models/address.dart';
import 'package:lupiter_work_demo/repo/app_repo.dart';

class ProdRepo implements AppRepo {
  @override
  Future<int> saveAddress(Address address) async {

    final success = await DbHelper.instance.addAddress(address);
    if (success == 1) {
      debugPrint('Address Successfully created');
    }
    return success;
  }

  @override
  Future<List<Address>> fetchAllAddresses() async {
    debugPrint('Runninng fetchAllAddresses');
    final result = await DbHelper.instance.queryAllRows();
    debugPrint(result.length.toString());
    return result;
  }
}
