import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lupiter_work_demo/data/models/address.dart';

import 'app_repo_provider.dart';

final addressesProvider = FutureProvider.autoDispose<List<Address>>((ref) {
  final repo = ref.read(appRepoProvider);
  final assets = repo.fetchAllAddresses();
  return assets;
});
