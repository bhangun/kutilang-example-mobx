import 'package:get_it/get_it.dart';
import 'package:kutilangExmaple/modules/register_modules.dart';
import 'package:kutilangExmaple/services/getIt.dart';
import 'package:kutilangExmaple/utils/providers';
import 'package:kutilangExmaple/utils/routes.dart';

import 'modules.dart';

class ModulesRegistry {
  // singleton object
  static final ModulesRegistry _singleton = ModulesRegistry._();

  // factory method to return the same object each time its needed
  factory ModulesRegistry() =>  _singleton;

  ModulesRegistry._(){
   // GetIt.I.registerSingleton(AppModel());
    getIt.registerSingleton(Modules());
    getIt.registerSingleton(Routes());
    getIt.registerSingleton(AppProviders());
    _registry();
  }

  _registry(){
    registerModules().forEach((m){
        m.pages().forEach((p){
          p.name = m.name;
          getIt<Modules>().addPages(p);
        });

        m.providers().forEach((p){
        //  getIt<AppProviders>().addProviders(p);
        });

        m.routes();
        m.services();
    });
  }
}



