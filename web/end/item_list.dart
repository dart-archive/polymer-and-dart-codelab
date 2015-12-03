import 'package:polymer/polymer.dart';
import 'item.dart' show Item;
import 'dart:html' show Event, Node;

/// Class to represent a collection of Codelab objects.
@CustomTag('item-list')
class ItemList extends PolymerElement {
  /// Field for a new Codelab object.
  @observable Item newItem;

  final String itemType;

  /// Collection of codelabs. The source of truth for all codelabs in this app.
  @observable List<Item> items = toObservable([]);

  /// Named constructor. Sets initial value of filtered codelabs and sets
  /// the new codelab's level to the default.
  ItemList.created() : super.created() {
    print("ItemList::created()");
    newItem = new Item(itemType, '', '');
  }

  /// Replaces the existing new Codelab, causing the new codelab form to reset.
  void resetForm() {
    print("ItemList::resetForm()");
    newItem = new Item(itemType, '', '');
  }

  /// Adds a codelab to the codelabs list and resets the new codelab form. This
  /// triggers codelabsChanged().
  void addItem(Event e, var detail, Node sender) {
    e.preventDefault();
    items.add(detail['item']);
    resetForm();
  }

  /// Removes a codelab from the codelabs list. This triggers codelabsChanged().
  void deleteItem(Event e, var detail, Node sender) {
    var item = detail['item'];
    items.remove(item);
  }
}
