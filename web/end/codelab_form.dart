import 'package:polymer/polymer.dart';
import 'model.dart' show Codelab;
import 'dart:html' show CustomEvent, Event, Node;
import 'item_form.dart' show ItemFormElement;

/*
 * The class for creating or updating a codelab. Performs validation based on
 * a codelab based on validation rules defined in the model.
 */
@CustomTag('codelab-form')
class CodelabFormElement extends ItemFormElement {

  /// Getters that make Codelab static values accessible in the template.
  List<String> get allLevels => Codelab.LEVELS;

  CodelabFormElement.created() : super.created() {}

  /// Validates the codelab title. If title is not valid, sets error message and
  /// returns false. Otherwise, removes error message and returns true.
  /// Todo: remove. Needed only by ItemForm
  bool validateTitle() {
    return super.validateTitle();
  }

  /// Validates the codelab description. If description is not valid, sets error
  /// message and returns false. Otherwise, removes error message and returns
  /// true.
  /// Todo: remove. Needed only by ItemForm
  bool validateDescription() {
    return super.validateDescription();
  }

  /// Dispatches a custom event if a codelab passes validation. Otherwise, sets
  /// the form error message. It is up to the form's parent element to listen
  /// for the dispatch and handle the validated codelab object.
  void validateItem(Event event, Object detail, Node sender) {
    super.validateItem(event, detail, sender);
  }

  /// Dispatches a custom event when a form is no longer needed. It is up to the
  /// form's parent elemnt to listen for the dispatch and handle a form that
  /// isn't being used.
  void cancelForm(Event event, Object detail, Node sender) {
    super.cancelForm(event, detail, sender);
  }
}
