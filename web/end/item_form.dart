import 'package:polymer/polymer.dart';
import 'item.dart' show Item;
import 'dart:html' show CustomEvent, Event, Node;
import 'codelab_form.dart';

/*
 * The class for creating or updating a codelab. Performs validation based on
 * a codelab based on validation rules defined in the model.
 */

@CustomTag('item-form')
class ItemFormElement extends PolymerElement {
  /// The Codelab object modified by this form.
  @published Item item;

  /// Getters that make Codelab static values accessible in the template.
  int get minTitleLength => Item.MIN_TITLE_LENGTH;
  int get maxTitleLength => Item.MAX_TITLE_LENGTH;
  int get maxDescriptionLength => Item.MAX_DESCRIPTION_LENGTH;

  /// Variables used in displaying error messages.
  @observable String titleErrorMessage = '';
  @observable String descriptionErrorMessage = '';

  ItemFormElement.created() : super.created() {}

  /// Dispatches submit up to subclass
  void submit(Event event, Object detail, Node sender) {
    event.preventDefault();
    dispatchEvent(new CustomEvent('submit',
        detail: {'item': item}));
  }

  /// Dispatches submit up to subclass
  /// Todo: Need to include item in event?
  void cancel(Event event, Object detail, Node sender) {
    event.preventDefault();
    dispatchEvent(new CustomEvent('cancel',
        detail: {'item': item}));
  }

  /// Validates the codelab title. If title is not valid, sets error message and
  /// returns false. Otherwise, removes error message and returns true.
  bool validateTitle() {
    if (item.title.length < minTitleLength ||
        item.title.length > maxTitleLength) {
      titleErrorMessage = "Title must be between $minTitleLength and "
          "$maxTitleLength characters.";
      return false;
    }
    titleErrorMessage = '';
    return true;
  }

  /// Validates the codelab description. If description is not valid, sets error
  /// message and returns false. Otherwise, removes error message and returns
  /// true.
  bool validateDescription() {
    if (item.description.length > maxDescriptionLength) {
      descriptionErrorMessage = "Description cannot be more than "
          "$maxDescriptionLength characters.";
      return false;
    }
    descriptionErrorMessage = '';
    return true;
  }

  /// Dispatches a custom event if a codelab passes validation. Otherwise, sets
  /// the form error message. It is up to the form's parent element to listen
  /// for the dispatch and handle the validated codelab object.
  void validateItem(Event event, Object detail, Node sender) {
    event.preventDefault();
    if (validateTitle() && validateDescription()) {
      dispatchEvent(new CustomEvent('itemvalidated',
          detail: {'item': item}));
    }
  }

  /// Dispatches a custom event when a form is no longer needed. It is up to the
  /// form's parent element to listen for the dispatch and handle a form that
  /// isn't being used.
  void cancelForm(Event event, Object detail, Node sender) {
    event.preventDefault();
    titleErrorMessage = '';
    descriptionErrorMessage = '';
    dispatchEvent(new CustomEvent('formnotneeded'));
  }
}
