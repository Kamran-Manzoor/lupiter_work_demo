import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lupiter_work_demo/data/local/app_shared_preferences.dart';
import 'package:lupiter_work_demo/data/models/address.dart';
import 'package:lupiter_work_demo/data/providers/app_repo_provider.dart';
import 'package:lupiter_work_demo/widgets/buttons.dart';
import 'package:lupiter_work_demo/widgets/text_fields.dart';

import '../common/constants.dart';

class AddAddressScreen extends HookConsumerWidget {
  AddAddressScreen({Key? key}) : super(key: key);

  final _nameController = TextEditingController();
  final _streetController = TextEditingController();
  final _cityController = TextEditingController();
  final _zipController = TextEditingController();
  final _nameFocusNode = FocusNode();
  final _streetFocusNode = FocusNode();
  final _cityFocusNode = FocusNode();
  final _zipFocusNode = FocusNode();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text("Enter Address")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SimpleTextField(
            labelText: 'Name',
            focusNode: _nameFocusNode,
            keyboardType: TextInputType.name,
            controller: _nameController,
          ),
          SimpleTextField(
            labelText: 'Street',
            focusNode: _streetFocusNode,
            keyboardType: TextInputType.text,
            controller: _streetController,
          ),
          SimpleTextField(
            labelText: 'City',
            focusNode: _cityFocusNode,
            keyboardType: TextInputType.text,
            maxLength: 15,
            controller: _cityController,
          ),
          SimpleTextField(
            labelText: 'Zip Code',
            focusNode: _zipFocusNode,
            keyboardType: TextInputType.number,
            maxLength: 5,
            controller: _zipController,
          ),
          const SizedBox(height: 40),
          PrimaryButton(
            title: 'Preview Order',
            onPressed: () {
              _onPreviewOrderPressed(context, ref);
            },
          )
        ],
      ),
    );
  }

  void _onPreviewOrderPressed(BuildContext ctx, WidgetRef ref) async {
    final name = _nameController.text;
    final street = _streetController.text;
    final zip = _zipController.text;
    final city = _cityController.text;
    if (name.isEmpty) {
      _showErrorMessage(ctx, 'Please enter your name');
    } else if (zip.isEmpty) {
      _showErrorMessage(ctx, 'Please enter valid zip code');
    } else if (city.isEmpty) {
      _showErrorMessage(ctx, 'Please enter your city name');
    } else if (street.isEmpty) {
      _showErrorMessage(ctx, 'Please enter street address');
    } else {
      final appRepo = ref.read(appRepoProvider);
      final ad = Address(name: name, street: street, zipCode: zip, city: city);
      await appRepo.saveAddress(
        ad,
      );
      final appPref = await AppSharedPreferences().getInstance();
      await appPref.updatePref(ad);
      clearFocus();
      Get.offAndToNamed(Constants.previewOrderScreen);
    }
  }

  void clearFocus() {
    _nameFocusNode.unfocus();
    _streetFocusNode.unfocus();
    _zipFocusNode.unfocus();
    _cityFocusNode.unfocus();
  }

  void _showErrorMessage(BuildContext ctx, String message) {
    ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(message),
      ),
    );
  }
}
