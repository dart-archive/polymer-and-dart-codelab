//library polymer_and_dart.web.models;

import 'package:polymer/polymer.dart';
import 'dart:mirrors';


class Item extends Observable {
  String _title;
  String _description;

  static const MIN_TITLE_LENGTH = 10;
  static const MAX_TITLE_LENGTH = 30;
  static const MAX_DESCRIPTION_LENGTH = 140;

  String get title => _title;
  set title(String s) => _title = s;

  String get description => _description;
  set description(String s) => _description = s;

  /*
   * Allow a subclass instance to be generated with
   * an empty argument list
   */
  Item.created(this._title, this._description);

  factory Item(String type, String title, String description) {
    MirrorSystem libs = currentMirrorSystem();
    LibraryMirror lib = libs.findLibrary(new Symbol('polymer_and_dart.web.models'));
    Map<Symbol, Mirror> classes = lib.declarations;
    // To do: handle exception if class not found
    ClassMirror cls = classes[new Symbol(type)];
    // TODO:
    //  verify each subclass has no-arg ctor
    //  determ how to pass args to ctor.

    // returns "No constructor 'Codelab.' with matching arguments declared in class 'Codelab'."
//    InstanceMirror inst = cls.newInstance(new Symbol(''), [{'title': '', 'description': ''}]);
//    InstanceMirror inst = cls.newInstance(new Symbol('foo'), ['fooarg1', 'fooarg2']);
    InstanceMirror inst = cls.newInstance(new Symbol(''), [title, description]);
    return inst.reflectee;
  }
}
