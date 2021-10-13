import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lupiter_work_demo/appearance/appearance_provider.dart';
import 'package:lupiter_work_demo/screens/add_address_screen.dart';
import 'package:lupiter_work_demo/screens/choose_address_screen.dart';
import 'package:lupiter_work_demo/screens/preview_order_screen.dart';

import 'appearance/light_appearance.dart';
import 'common/constants.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends HookConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppearanceProvider(
      appearance: LightAppearance(),
      child: Builder(
        builder: (ctz) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(primarySwatch: Colors.teal),
            home: const ChooseAddressScreen(),
            routes: {
              Constants.addAddressScreen: (context) => AddAddressScreen(),
              Constants.chooseAddressScreen: (context) =>
                  const ChooseAddressScreen(),
              Constants.previewOrderScreen: (context) =>
                  const PreviewOrderScreen(),
            },
          );
        },
      ),
    );
  }
}
