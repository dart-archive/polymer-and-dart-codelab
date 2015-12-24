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
    _cachedItem = new Item(itemType, '', '');
  }

  /// Make private variable accessible by subclasses
  Item get cachedItem => _cachedItem;
  set cachedItem(item) => _cachedItem = item;

  /// Dispatch custom event for element's parent to handle.
  void edit(Event e, var detail, Node sender) {
    dispatchEvent(new CustomEvent('startedit',
        detail: {'item': item}));
  }

  /// Dispatch a custom event to allow parent (subclass)
  /// to delet the item.
  void delete(Event e, var detail, Node sender) {
    dispatchEvent(new CustomEvent('delete',
        detail: {'item': item}));
  }

  /// Updates item.
  void updateItem(Event e, var detail, Node sender) {
    e.preventDefault();
    editing = false;
  }

  /// Cancels editing, restoring the original item values.
  void cancelEditing(Event e, var detail, Node sender) {
    e.preventDefault();
    copyItem(_cachedItem, item);
    editing = false;
  }

  /// Starts editing, caching the item values.
  void startEditing(Event e, var detail, Node sender) {
    e.preventDefault();
    copyItem(item, _cachedItem);
    editing = true;
  }

  /// Dispatches a custom event requesting the item be deleted.
  void deleteItem(Event e, var detail, Node sender) {
    e.preventDefault();
    dispatchEvent(new CustomEvent('deleteitem',
        detail: {'item': item}));
  }

  /// Copies values from source item to destination item.
  void copyItem(source, destination) {
    destination.title = source.title;
    destination.description = source.description;
  }
}
