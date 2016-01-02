import 'package:polymer/polymer.dart';
import 'item.dart' show Item;
import 'dart:html' show CustomEvent, Event, Node;

/*
 * The class for creating or updating a item. Performs validation on
 * an item based on validation rules defined in the model.
 */

@CustomTag('item-form')
class ItemFormElement extends PolymerElement {
  /// The Item object modified by this form.
  @published Item item;

  /// Getters that make Item static values accessible in the template.
  int get minTitleLength => Item.MIN_TITLE_LENGTH;
  int get maxTitleLength => Item.MAX_TITLE_LENGTH;
  int get maxDescriptionLength => Item.MAX_DESCRIPTION_LENGTH;

  /// Variables used in displaying error messages.
  @observable String titleErrorMessage = '';
  @observable String descriptionErrorMessage = '';

  /// Variables used in displaying chars remaining messages.
  @observable int titleCharsLeft = Item.MAX_TITLE_LENGTH;
  @observable int descriptionCharsLeft = Item.MAX_DESCRIPTION_LENGTH;

  ItemFormElement.created() : super.created() {}

  /// Restore form messages to initial state
  void resetForm() {
    /// Todo: Why does setting these in validateItem() and cancelForm() not work?
    titleCharsLeft = maxTitleLength;
    descriptionCharsLeft = maxDescriptionLength;
    titleErrorMessage = '';
    descriptionErrorMessage = '';
  }

  /// Dispatches submit to parent
  void submit(Event event, Object detail, Node sender) {
    event.preventDefault();
    resetForm();
    dispatchEvent(new CustomEvent('submit',
        detail: {'item': item}));
  }

  /// Dispatches custom event to parent (<codelab-form>)
  /// Todo: Need to include item in event?
  void cancel(Event event, Object detail, Node sender) {
    event.preventDefault();
    resetForm();
    dispatchEvent(new CustomEvent('cancel',
        detail: {'item': item}));
  }

  /// Validates the item title. If title is not valid, sets error message and
  /// returns false. Otherwise, removes error message and returns true.
  bool validateTitle() {
    titleCharsLeft = maxTitleLength - item.title.length;
    if (item.title.length < minTitleLength ||
        item.title.length > maxTitleLength) {
      titleErrorMessage = "Title must be between $minTitleLength and "
          "$maxTitleLength characters.";
      return false;
    }
    titleErrorMessage = '';
    return true;
  }

  /// Validates the item description. If description is not valid, sets error
  /// message and returns false. Otherwise, removes error message and returns
  /// true.
  bool validateDescription() {
    descriptionCharsLeft = maxDescriptionLength - item.description.length;
    if (item.description.length > maxDescriptionLength) {
      descriptionErrorMessage = "Description cannot be more than "
          "$maxDescriptionLength characters.";
      return false;
    }
    descriptionErrorMessage = '';
    return true;
  }

  /// Dispatches a custom event if an item passes validation. Otherwise, sets
  /// the form error message. It is up to the form's parent element to listen
  /// for the dispatch and handle the validated item.
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
    dispatchEvent(new CustomEvent('formnotneeded'));
  }
}
