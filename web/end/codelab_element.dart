import 'package:polymer/polymer.dart';
import 'model.dart' show Codelab;
import 'dart:html' show Event, Node, CustomEvent;

@CustomTag('codelab-element')
class CodelabElement extends PolymerElement {
  @published Codelab codelab;
  @observable bool editing = false;
  Codelab _cachedCodelab;

  CodelabElement.created() : super.created() {}

  /// Updates codelab. If the codelab's level has changed, dispatches a
  /// custom event. This allows the element's parent to register a listener to
  /// update the filtered codelabs list.
  void updateCodelab(Event e, var detail, Node sender) {
    e.preventDefault();
    if (_cachedCodelab.level != codelab.level) {
      dispatchEvent(new CustomEvent('levelchanged'));
    }
    editing = false;
  }

  /// Cancels editing, restoring the original codelab values.
  void cancelEditing(Event e, var detail, Node sender) {
    e.preventDefault();
    copyCodelab(_cachedCodelab, codelab);
    editing = false;
  }

  /// Starts editing, caching the codelab values.
  void startEditing(Event e, var detail, Node sender) {
    e.preventDefault();
    _cachedCodelab = new Codelab();
    copyCodelab(codelab, _cachedCodelab);
    editing = true;
  }

  /// Dispatches a custom event requesting the codelab be deleted.
  void deleteCodelab(Event e, var detail, Node sender) {
    e.preventDefault();
    dispatchEvent(new CustomEvent('deletecodelab',
        detail: {'codelab': codelab}));
  }

  /// Copies values from source codelab to destination codelab.
  void copyCodelab(source, destination) {
    copyCodelab(source, destination) {
      destination.title = source.title;
      destination.description = source.description;
      destination.level = source.level;
    }
  }
}
