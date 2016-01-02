import 'package:polymer/polymer.dart';
import 'item.dart' show Item;
import 'dart:html' show Event, Node;

/// Class to represent a collection of Item objects.
@CustomTag('item-list')
class ItemList extends PolymerElement {
  /// Field for a new Item object.
  @observable Item newItem;

  final String itemType;

  /// The canonical collection of items in this app.
  @observable List<Item> items = toObservable([]);

  /// Named constructor. Sets title and description to
  /// empty strings.
  ItemList.created() : super.created() {
    newItem = new Item(itemType, '', '');
  }

  /// Replaces the existing new Item, causing the new item form to reset.
  void resetForm() {
    newItem = new Item(itemType, '', '');
  }

  /// Adds an item to the items list and resets the new item form. This
  /// triggers itemsChanged().
  void addItem(Event e, var detail, Node sender) {
    e.preventDefault();
    items.add(detail['item']);
    resetForm();
  }

  /// Removes an item from the items list. This triggers itemsChanged().
  void deleteItem(Event e, var detail, Node sender) {
    var item = detail['item'];
    items.remove(item);
  }
}
