import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lupiter_work_demo/appearance/appearance_provider.dart';
import 'package:lupiter_work_demo/common/constants.dart';
import 'package:lupiter_work_demo/data/local/app_shared_preferences.dart';
import 'package:lupiter_work_demo/data/models/address.dart';
import 'package:lupiter_work_demo/widgets/buttons.dart';

class PreviewOrderScreen extends StatefulWidget {
  const PreviewOrderScreen({Key? key}) : super(key: key);

  @override
  State<PreviewOrderScreen> createState() => _PreviewOrderScreenState();
}

class _PreviewOrderScreenState extends State<PreviewOrderScreen> {
  late Address _address;
  bool _showLoader = true;

  @override
  void initState() {
    getPref();
    super.initState();
  }

  void getPref() async {
    final appPref = await AppSharedPreferences().getInstance();
    _address = await appPref.getPref();
    setState(() {
      _showLoader = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final appearance = AppearanceProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Preview'),
      ),
      body: _showLoader
          ? const CircularProgressIndicator(color: Colors.teal)
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Thank you',
                          style: appearance.centerMessageTextStyle,
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Your order would be delivered within 4 working days to address below :',
                        ),
                        Text(
                          '\n ${_address.name + ', ' + _address.street + ', ' + _address.city + ', ' + _address.zipCode + '\n '}',
                          style: appearance.centerMessageTextStyle,
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                PrimaryButton(
                  title: 'Change Address',
                  onPressed: () async {
                    Get.offAndToNamed(Constants.chooseAddressScreen);
                  },
                ),
              ],
            ),
    );
  }
}
