import 'package:polymer/polymer.dart';
import 'model.dart' show Codelab;
import 'dart:html' show CustomEvent, Event, Node;

@CustomTag('codelab-form')
class CodelabFormElement extends PolymerElement {
  @published Codelab codelab;

  List<String> get allLevels => Codelab.LEVELS;
  int get minTitleLength => Codelab.MIN_TITLE_LENGTH;
  int get maxTitleLength => Codelab.MAX_TITLE_LENGTH;
  int get maxDescriptionLength => Codelab.MAX_DESCRIPTION_LENGTH;

  @observable String titleErrorMessage = '';
  @observable String descriptionErrorMessage = '';
  CodelabFormElement.created() : super.created() {}

  bool validateTitle() {
    if (codelab.title.length < minTitleLength ||
        codelab.title.length > maxTitleLength) {
      titleErrorMessage = "Title must be between $minTitleLength and "
          "$maxTitleLength characters.";
      return false;
    }
    titleErrorMessage = '';
    return true;
  }

  bool validateDescription() {
    if (codelab.description.length > maxDescriptionLength) {
      descriptionErrorMessage = "Description cannot be more than "
          "$maxDescriptionLength characters.";
      return false;
    }
    descriptionErrorMessage = '';
    return true;
  }
}
