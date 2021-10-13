import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lupiter_work_demo/common/constants.dart';
import 'package:lupiter_work_demo/data/local/app_shared_preferences.dart';
import 'package:lupiter_work_demo/data/models/address.dart';
import 'package:lupiter_work_demo/data/providers/addresses_provider.dart';
import 'package:lupiter_work_demo/widgets/buttons.dart';

class ChooseAddressScreen extends HookConsumerWidget {
  const ChooseAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addresses = ref.watch(addressesProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Choose Address'),
        ),
        body: addresses.when(
          data: (addresses) {
            return Column(
              children: [
                Expanded(
                  child: addresses.isEmpty
                      ? const Center(child: Text('No Address Found'))
                      : ListView.builder(
                          itemCount: addresses.length,
                          itemBuilder: (ctx, index) {
                            return ListTile(
                              trailing: const Icon(Icons.location_pin,
                                  color: Colors.teal),
                              onTap: () async {
                                final appPref =
                                    await AppSharedPreferences().getInstance();
                                await appPref.updatePref(addresses[index]);
                                await Get.offAndToNamed(
                                    Constants.previewOrderScreen);
                                debugPrint('clicked on : $index');
                              },
                              title: Text(addresses[index].name),
                              subtitle: Text('${addresses[index].street},'
                                  '${addresses[index].city}.'),
                            );
                          },
                        ),
                ),
                PrimaryButton(
                  title: 'Add New Address',
                  onPressed: () async {
                    debugPrint('pressed');
                    await Get.offAndToNamed(Constants.addAddressScreen);
                  },
                ),
              ],
            );
          },
          error: (Object error, StackTrace? stackTrace,
              AsyncData<List<Address>>? previous) {
            return Text(error.toString());
          },
          loading: (AsyncValue<List<Address>>? previous) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
