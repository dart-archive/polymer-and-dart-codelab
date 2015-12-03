import 'package:polymer/polymer.dart';
import 'item.dart' show Item;
import 'dart:html' show Event, Node, CustomEvent;

@CustomTag('item-element')
class ItemElement extends PolymerElement {
  @published Item item;
  @observable bool editing = false;
  Item _cachedItem;
  final String itemType;

  ItemElement.created() : super.created() {
    item = new Item(itemType, '', '');
  }

  /// Make private variable accessible by subclasses
  Item get cachedItem => _cachedItem;
  set cachedItem(item) => _cachedItem = item;

  /// Updates item.
  void updateItem(Event e, var detail, Node sender) {
    e.preventDefault();
    editing = false;
  }

  /// Cancels editing, restoring the original codelab values.
  void cancelEditing(Event e, var detail, Node sender) {
    e.preventDefault();
    copyItem(_cachedItem, item);
    editing = false;
  }

  /// Starts editing, caching the codelab values.
  void startEditing(Event e, var detail, Node sender) {
    e.preventDefault();
    _cachedItem = new Item(itemType, '', '');
    copyItem(item, _cachedItem);
    editing = true;
  }

  /// Dispatches a custom event requesting the codelab be deleted.
  void deleteItem(Event e, var detail, Node sender) {
    e.preventDefault();
    dispatchEvent(new CustomEvent('deleteitem',
        detail: {'item': item}));
  }

  /// Copies values from source codelab to destination codelab.
  void copyItem(source, destination) {
    destination.title = source.title;
    destination.description = source.description;
    destination.level = source.level;
  }
}
