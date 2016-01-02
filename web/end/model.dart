library polymer_and_dart.web.models;

import 'package:polymer/polymer.dart';
import 'item.dart';

/// The barebones model for a codelab. Defines constants used for validation.
class Codelab extends Item {
  static const List<String> LEVELS = const ['easy', 'intermediate', 'advanced'];

  @observable String level;

  Codelab(title, description) : super.created(title, description);
}
