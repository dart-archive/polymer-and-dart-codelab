library polymer_and_dart.web.models;

import 'package:polymer/polymer.dart';


abstract class Item extends Observable {

  @observable String title;
  @observable String description;

  static const MIN_TITLE_LENGTH = 10;
  static const MAX_TITLE_LENGTH = 30;
  static const MAX_DESCRIPTION_LENGTH = 140;

  /*
   * Allow a subclass instance to be generated with
   * an empty argument list
   */
  Item(this.title, this.description);
}
