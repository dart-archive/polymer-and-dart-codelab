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

  void validateItem(Event event, Object detail, Node sender) {
    /// Superclass validation dispatches custom 'itemvalidated' event
    /// for which the parent (...-list) class registers a listener.
    if (true)  /// E.g.: item.level == "easy"
      super.validateItem(event, detail, sender);
      /// Perform any needed Item subclass validations here, first.
  }

  void cancelForm(Event event, Object detail, Node sender) {
    /// Superclass clears title and description, dispatches
    /// custom 'formnotneeded' event for parent.
    /// Perform any needed subclass operations here.
    super.cancelForm(event, detail, sender);
  }
}
