import 'package:polymer/polymer.dart';
import 'model.dart' show Codelab;
import 'dart:html' show Event, Node, CustomEvent;
import 'item_element.dart' show ItemElement;

@CustomTag('codelab-element')
class CodelabElement extends ItemElement {

  final itemType = "Codelab";

  CodelabElement(title, description) : super(title, description);
  CodelabElement.created() : super.created();

  /// Getters that make Codelab static values accessible in the template.
  List<String> get allLevels => Codelab.LEVELS;

  /// Updates codelab. If the codelab's level has changed, dispatches a
  /// custom event. This allows the element's parent to register a listener to
  /// update the filtered codelabs list.
  void updateItem(Event e, var detail, Node sender) {
    super.updateItem(e, detail, sender);
    if (cachedItem.level != item.level) {
      dispatchEvent(new CustomEvent('levelchanged'));
    }
  }

  /// Cancels editing, restoring the original codelab values.
  void cancelEditing(Event e, var detail, Node sender) {
    super.cancelEditing(e, detail, sender);
  }

  /// Starts editing, caching the codelab values.
  void startEditing(Event e, var detail, Node sender) {
    super.startEditing(e, detail, sender);
  }

  /// Dispatches a custom event requesting the codelab be deleted.
  void deleteItem(Event e, var detail, Node sender) {
    super.deleteItem(e, detail, sender);
  }

  /// Copies values from source codelab to destination codelab.
  void copyItem(source, destination) {
    super.copyItem(source, destination);
  }
}
