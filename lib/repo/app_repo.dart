import 'package:lupiter_work_demo/data/models/address.dart';

abstract class AppRepo {
  Future<int> saveAddress(Address address);

  Future<List<Address>> fetchAllAddresses();
}
