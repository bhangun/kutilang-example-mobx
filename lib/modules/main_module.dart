
import 'package:kutilangExample/models/module.dart';
import 'package:kutilangExample/services/apps_routes.dart';
import '../utils/routes.dart';
import 'account/services/user_routes.dart';

class MainModule implements Module{
  @override
  String name = 'Main';

  @override
  pages() {
    return [
            Page(title: 'User Detail', route: UserRoutes.userDetail),
            Page(title: 'User Form', route: UserRoutes.userForm),
            Page(title: 'User List', route: UserRoutes.userList, showInDrawer: true, showInHome: true)
    ];
  }

  @override
  services(){

  }

  @override
  providers() {
    return [
      
    ];
  }

  @override
  void routes() {
    AppRoutes.addRoutes(AppsRoutes.routes);
    AppRoutes.addRoutes(UserRoutes.routes);
  }

}