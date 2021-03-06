import 'package:kutilangExample/modules/register_modules.dart';
import 'package:kutilangExample/utils/routes.dart';

import 'modules.dart';

class ModulesRegistry {
  // singleton object
  static final ModulesRegistry _singleton = ModulesRegistry._();

  // factory method to return the same object each time its needed
  factory ModulesRegistry() =>  _singleton;

  ModulesRegistry._(){
    _registry();
  }

  _registry(){
    registerModules().forEach((m){
        m.pages().forEach((p){
          p.name = m.name;
          Modules.addPages(p);
        });

        m.routes();
        m.services();
    });
  }
}



