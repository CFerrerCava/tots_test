// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tots_test/util/input_validator.dart';

const bool _autoTextFieldValidation = true;

const String AbmFirstNameValueKey = 'abmFirstName';
const String AbmLastNameValueKey = 'abmLastName';
const String AbmEmailAddressValueKey = 'abmEmailAddress';

final Map<String, TextEditingController>
    _AbmClientDialogTextEditingControllers = {};

final Map<String, FocusNode> _AbmClientDialogFocusNodes = {};

final Map<String, String? Function(String?)?> _AbmClientDialogTextValidations =
    {
  AbmFirstNameValueKey: null,
  AbmLastNameValueKey: null,
  AbmEmailAddressValueKey: InputValidator.validateEmail,
};

mixin $AbmClientDialog {
  TextEditingController get abmFirstNameController =>
      _getFormTextEditingController(AbmFirstNameValueKey);
  TextEditingController get abmLastNameController =>
      _getFormTextEditingController(AbmLastNameValueKey);
  TextEditingController get abmEmailAddressController =>
      _getFormTextEditingController(AbmEmailAddressValueKey);

  FocusNode get abmFirstNameFocusNode =>
      _getFormFocusNode(AbmFirstNameValueKey);
  FocusNode get abmLastNameFocusNode => _getFormFocusNode(AbmLastNameValueKey);
  FocusNode get abmEmailAddressFocusNode =>
      _getFormFocusNode(AbmEmailAddressValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_AbmClientDialogTextEditingControllers.containsKey(key)) {
      return _AbmClientDialogTextEditingControllers[key]!;
    }

    _AbmClientDialogTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _AbmClientDialogTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_AbmClientDialogFocusNodes.containsKey(key)) {
      return _AbmClientDialogFocusNodes[key]!;
    }
    _AbmClientDialogFocusNodes[key] = FocusNode();
    return _AbmClientDialogFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    abmFirstNameController.addListener(() => _updateFormData(model));
    abmLastNameController.addListener(() => _updateFormData(model));
    abmEmailAddressController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    abmFirstNameController.addListener(() => _updateFormData(model));
    abmLastNameController.addListener(() => _updateFormData(model));
    abmEmailAddressController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          AbmFirstNameValueKey: abmFirstNameController.text,
          AbmLastNameValueKey: abmLastNameController.text,
          AbmEmailAddressValueKey: abmEmailAddressController.text,
        }),
    );

    if (_autoTextFieldValidation || forceValidate) {
      updateValidationData(model);
    }
  }

  bool validateFormFields(FormViewModel model) {
    _updateFormData(model, forceValidate: true);
    return model.isFormValid;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _AbmClientDialogTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _AbmClientDialogFocusNodes.values) {
      focusNode.dispose();
    }

    _AbmClientDialogTextEditingControllers.clear();
    _AbmClientDialogFocusNodes.clear();
  }
}

extension ValueProperties on FormStateHelper {
  bool get hasAnyValidationMessage => this
      .fieldsValidationMessages
      .values
      .any((validation) => validation != null);

  bool get isFormValid {
    if (!_autoTextFieldValidation) this.validateForm();

    return !hasAnyValidationMessage;
  }

  String? get abmFirstNameValue =>
      this.formValueMap[AbmFirstNameValueKey] as String?;
  String? get abmLastNameValue =>
      this.formValueMap[AbmLastNameValueKey] as String?;
  String? get abmEmailAddressValue =>
      this.formValueMap[AbmEmailAddressValueKey] as String?;

  set abmFirstNameValue(String? value) {
    this.setData(
      this.formValueMap..addAll({AbmFirstNameValueKey: value}),
    );

    if (_AbmClientDialogTextEditingControllers.containsKey(
        AbmFirstNameValueKey)) {
      _AbmClientDialogTextEditingControllers[AbmFirstNameValueKey]?.text =
          value ?? '';
    }
  }

  set abmLastNameValue(String? value) {
    this.setData(
      this.formValueMap..addAll({AbmLastNameValueKey: value}),
    );

    if (_AbmClientDialogTextEditingControllers.containsKey(
        AbmLastNameValueKey)) {
      _AbmClientDialogTextEditingControllers[AbmLastNameValueKey]?.text =
          value ?? '';
    }
  }

  set abmEmailAddressValue(String? value) {
    this.setData(
      this.formValueMap..addAll({AbmEmailAddressValueKey: value}),
    );

    if (_AbmClientDialogTextEditingControllers.containsKey(
        AbmEmailAddressValueKey)) {
      _AbmClientDialogTextEditingControllers[AbmEmailAddressValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasAbmFirstName =>
      this.formValueMap.containsKey(AbmFirstNameValueKey) &&
      (abmFirstNameValue?.isNotEmpty ?? false);
  bool get hasAbmLastName =>
      this.formValueMap.containsKey(AbmLastNameValueKey) &&
      (abmLastNameValue?.isNotEmpty ?? false);
  bool get hasAbmEmailAddress =>
      this.formValueMap.containsKey(AbmEmailAddressValueKey) &&
      (abmEmailAddressValue?.isNotEmpty ?? false);

  bool get hasAbmFirstNameValidationMessage =>
      this.fieldsValidationMessages[AbmFirstNameValueKey]?.isNotEmpty ?? false;
  bool get hasAbmLastNameValidationMessage =>
      this.fieldsValidationMessages[AbmLastNameValueKey]?.isNotEmpty ?? false;
  bool get hasAbmEmailAddressValidationMessage =>
      this.fieldsValidationMessages[AbmEmailAddressValueKey]?.isNotEmpty ??
      false;

  String? get abmFirstNameValidationMessage =>
      this.fieldsValidationMessages[AbmFirstNameValueKey];
  String? get abmLastNameValidationMessage =>
      this.fieldsValidationMessages[AbmLastNameValueKey];
  String? get abmEmailAddressValidationMessage =>
      this.fieldsValidationMessages[AbmEmailAddressValueKey];
}

extension Methods on FormStateHelper {
  setAbmFirstNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[AbmFirstNameValueKey] = validationMessage;
  setAbmLastNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[AbmLastNameValueKey] = validationMessage;
  setAbmEmailAddressValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[AbmEmailAddressValueKey] =
          validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    abmFirstNameValue = '';
    abmLastNameValue = '';
    abmEmailAddressValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      AbmFirstNameValueKey: getValidationMessage(AbmFirstNameValueKey),
      AbmLastNameValueKey: getValidationMessage(AbmLastNameValueKey),
      AbmEmailAddressValueKey: getValidationMessage(AbmEmailAddressValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _AbmClientDialogTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _AbmClientDialogTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      AbmFirstNameValueKey: getValidationMessage(AbmFirstNameValueKey),
      AbmLastNameValueKey: getValidationMessage(AbmLastNameValueKey),
      AbmEmailAddressValueKey: getValidationMessage(AbmEmailAddressValueKey),
    });
