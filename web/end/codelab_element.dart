import 'package:polymer/polymer.dart';
import 'model.dart' show Codelab;
import 'dart:html' show Event, Node, CustomEvent;
import 'item_element.dart' show ItemElement;

@CustomTag('codelab-element')
class CodelabElement extends ItemElement {

  final itemType = "Codelab";

  CodelabElement.created() : super.created();

  /// Getters that make Codelab static values accessible in the template.
  List<String> get allLevels => Codelab.LEVELS;

  void updateItem(Event e, var detail, Node sender) {
    super.updateItem(e, detail, sender);
    /// Update Item subclass values here.
    if (cachedItem.level != item.level) {
      /// Codelab's level has changed. Dispatch a
      /// custom event to allow the element's parent to register
      /// a listener to update the filtered codelabs list.
      dispatchEvent(new CustomEvent('levelchanged'));
    }
  }

  void cancelEditing(Event e, var detail, Node sender) {
    super.cancelEditing(e, detail, sender);
    /// Restore unmodified Item subclass values here.
  }

  void startEditing(Event e, var detail, Node sender) {
    super.startEditing(e, detail, sender);
    /// Cache Item subclass values here.
  }

  void deleteItem(Event e, var detail, Node sender) {
    super.deleteItem(e, detail, sender);
    /// Perform any needed Item subclass operations here.
  }

  /// Copies values from source codelab to destination codelab.
  void copyItem(source, destination) {
    super.copyItem(source, destination);
    /// Copy Item subclass values here.
    destination.level = source.level;
  }
}
