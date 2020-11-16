
import 'package:f_logs/f_logs.dart';
import 'package:kutilangExample/bloc/alert/alert_bloc.dart';
import 'package:kutilangExample/modules/account/services/user_routes.dart';
import 'package:kutilangExample/modules/account/services/user_services.dart';
import 'package:kutilangExample/services/auth_services.dart';
import 'package:kutilangExample/services/navigation.dart';
import 'package:mobx/mobx.dart' as m;

import 'package:kutilangExample/modules/account/models/user_model.dart';
import 'package:kutilangExample/utils/helper.dart';
import 'package:mobx/mobx.dart';


part 'user_bloc.g.dart';

class UserStore = _UserStore with _$UserStore;


abstract class _UserStore with m.Store {

  _UserStore(){
    m.reaction((_) => userList,count);
    m.reaction((_) => position,setItemData);
  }

  // other store  
  final AlertStore _alertStore = AlertStore();

  // store variables:-----------------------------------------------------------
  @m.observable
  User itemDetail;

  @m.observable
  bool islistEmpty=true;

  @m.observable
  bool isItemEmpty=true;

  @m.computed
  User get userProfile => profile2;

  @m.observable
  User profile2;

  @m.observable
  User person;

  @m.observable
  bool isModified=false;

  @m.observable
  List<User> userList ;

  @m.observable
  int totalUser = 0;

  @m.observable
  bool success = false;

  @m.observable
  bool loading = false;

  @m.observable
  int id;

  @m.observable
  String username;

  @m.observable
  String firstname;

  @m.observable
  String lastname;

  @m.observable
  String email;

  @m.observable
  String activated;

  @m.observable
  String profile;

  @m.observable
  bool showError;

  @m.observable
  String errorMessage;

  // actions:-------------------------------------------------------------------
  @m.action
  void setUserId(int value) {
    id = value;
  }

  @m.action
  void setUsername(String value) {
    username = value;
  }

  @m.action
  void setFirstname(String value) {
    firstname = value;
  }

   @m.action
  void setLastname(String value) {
    lastname = value;
  }

  @m.action
  void setEmail(String value) {
    email = value;
  }

  @m.action
  void setActivated(String value) {
    activated = value;
  }

  @m.action
  void setProfile(String value) {
    profile = value;
  }

  @m.action
  void count(List<User> list){
    if(list != null ){
      totalUser =  list.length;
      islistEmpty = false;
      showError = false;
    } else {
      showError = true;
      errorMessage = 'Data Empty';
    }
  }

  @m.computed
  User get userDetail => itemDetail;

  @m.action
  setItemData(int data){
    isItemEmpty = false;
    itemDetail = userList[data];
    //userDetail = data;
    FLog.info(text:'$isItemEmpty  ????>>>${userDetail.email}');
  }
@m.observable
  int position=0;

  @m.action
  itemTapU(int _position){
    try{
   position = _position;
    itemDetail = userList[position];
    isItemEmpty = false;
  
    }catch(e){}
   // setItemData(userList[position]);
    //if(itemDetail != null)
      //isItemEmpty = false;

    NavigationServices.navigateTo(UserRoutes.userDetail);
  }

  @m.action
  itemTap(User data){
     NavigationServices.navigateTo(UserRoutes.userDetail);
      itemDetail = data;
  }


  @m.action
  add(){
    NavigationServices.navigateTo(UserRoutes.userForm);
  }

  @m.action
  save(){ 
    isModified =false;
    UserServices.createUser(mapping());
    //dialogDelete();
    NavigationServices.navigateTo(UserRoutes.userList);
  }

  @m.action
  delete(String userid){
    dialogDelete();
    //isModified =true;
    UserServices.deleteUser(userid);
    getUserList();
  }

  @m.action
  update(int id){
    dialogDelete();
  }

  @m.action
  Future getUserList() async{ 
    UserServices.users().then((data)=> userList = data); 
  }

  @m.action
  getProfile() async {
    profile2 = await AuthServices.profileInfo();
      //setPrefs(PROFILE, profile);

      //userProfile = User.fromJson(json.decode(profile));
      FLog.info(text:'>>>>>'+userProfile.firstName);
  }


  dialogDelete([String item]){
    _alertStore.setTitleDialog('Delete');
    _alertStore.setContentDialog('This item $item would be delete');
    FLog.info(text:'----');
  }

   dialogUpdate([String item]){
    _alertStore.setTitleDialog('Update');
    _alertStore.setContentDialog('This item $item would be update');
  }

  mapping(){
    return User(
              //id: id,
              login: username,
              firstName: firstname,
              lastName: lastname,
              email: email,
              activated: true,
              createdBy: username,
              createdDate: instantToDate(DateTime.now()),
              langKey: "en",
              imageUrl: "",
              authorities: ['"ROLE_USER"'],
              lastModifiedBy: username,
              lastModifiedDate: instantToDate(DateTime.now())
              );
  }
}