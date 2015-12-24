import 'package:polymer/polymer.dart';
import 'model.dart' show Codelab;
import 'item_list.dart' show ItemList;
import 'dart:html' show Event, Node;

/// Class to represent a collection of Codelab objects.
@CustomTag('codelab-list')
class CodelabList extends ItemList {
  final itemType = 'Codelab';

  static const ALL = "all";

  /// Sets the new codelab form to default to the intermediate level.
  String get defaultLevel => Codelab.LEVELS[1];

  /// List of filter values. Includes the levels defined in the model, as well
  /// as a filter to return all codelabs.
  final List<String> filters = [ALL]..addAll(Codelab.LEVELS);

  /// String that stores the value used to filter codelabs.
  @observable String filterValue = ALL;

  /// The list of filtered codelabs.
  @observable List<Codelab> filteredItems = toObservable([]);

  /// Named constructor. Sets initial value of filtered codelabs and sets
  /// the new codelab's level to the default.
  CodelabList.created() : super.created() {
    filteredItems = items;
    newItem.level = defaultLevel;
  }

  void resetForm() {
    /// Insert needed initializations here
    newItem.level = defaultLevel;
    super.resetForm();
  }

  void addItem(Event e, var detail, Node sender) {
    /// Insert needed initializations here
    super.addItem(e, detail, sender);
  }

  void deleteItem(Event e, var detail, Node sender) {
    /// Insert needed teardown here
    super.deleteItem(e, detail, sender);
  }

  /// Calculates the codelabs to display when using a filter.
  /// TODO: consider moving to base class
  void filter() {
    if (filterValue == ALL) {
      filteredItems = items;
    }
    else {
      filteredItems = items.where((item) {
        return item.level == filterValue;
      }).toList();
    }
  }

  /// Refreshes the filtered codelabs list every time the codelabs list changes.
  /// TODO: consider moving to base class
  void itemsChanged() {
    filter();
  }
}
