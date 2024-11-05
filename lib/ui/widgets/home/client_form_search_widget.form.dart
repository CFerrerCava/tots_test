// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String FormSearchValueKey = 'formSearch';

final Map<String, TextEditingController>
    _ClientFormSearchWidgetTextEditingControllers = {};

final Map<String, FocusNode> _ClientFormSearchWidgetFocusNodes = {};

final Map<String, String? Function(String?)?>
    _ClientFormSearchWidgetTextValidations = {
  FormSearchValueKey: null,
};

mixin $ClientFormSearchWidget {
  TextEditingController get formSearchController =>
      _getFormTextEditingController(FormSearchValueKey);

  FocusNode get formSearchFocusNode => _getFormFocusNode(FormSearchValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_ClientFormSearchWidgetTextEditingControllers.containsKey(key)) {
      return _ClientFormSearchWidgetTextEditingControllers[key]!;
    }

    _ClientFormSearchWidgetTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _ClientFormSearchWidgetTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_ClientFormSearchWidgetFocusNodes.containsKey(key)) {
      return _ClientFormSearchWidgetFocusNodes[key]!;
    }
    _ClientFormSearchWidgetFocusNodes[key] = FocusNode();
    return _ClientFormSearchWidgetFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    formSearchController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    formSearchController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          FormSearchValueKey: formSearchController.text,
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

    for (var controller
        in _ClientFormSearchWidgetTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _ClientFormSearchWidgetFocusNodes.values) {
      focusNode.dispose();
    }

    _ClientFormSearchWidgetTextEditingControllers.clear();
    _ClientFormSearchWidgetFocusNodes.clear();
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

  String? get formSearchValue =>
      this.formValueMap[FormSearchValueKey] as String?;

  set formSearchValue(String? value) {
    this.setData(
      this.formValueMap..addAll({FormSearchValueKey: value}),
    );

    if (_ClientFormSearchWidgetTextEditingControllers.containsKey(
        FormSearchValueKey)) {
      _ClientFormSearchWidgetTextEditingControllers[FormSearchValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasFormSearch =>
      this.formValueMap.containsKey(FormSearchValueKey) &&
      (formSearchValue?.isNotEmpty ?? false);

  bool get hasFormSearchValidationMessage =>
      this.fieldsValidationMessages[FormSearchValueKey]?.isNotEmpty ?? false;

  String? get formSearchValidationMessage =>
      this.fieldsValidationMessages[FormSearchValueKey];
}

extension Methods on FormStateHelper {
  setFormSearchValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[FormSearchValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    formSearchValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      FormSearchValueKey: getValidationMessage(FormSearchValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _ClientFormSearchWidgetTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _ClientFormSearchWidgetTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      FormSearchValueKey: getValidationMessage(FormSearchValueKey),
    });
