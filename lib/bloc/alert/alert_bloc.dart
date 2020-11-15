import 'package:f_logs/f_logs.dart';
import 'package:kutilangExample/services/navigation.dart';
import 'package:mobx/mobx.dart';

part 'alert_bloc.g.dart';

class AlertStore = _AlertStore with _$AlertStore;

abstract class _AlertStore with Store {

  @computed
  String get title => dialogTitle ;

  @observable
  String dialogTitle = 'Title';

  @observable
  String dialogContent = 'Content';

  @observable
  bool isOk=false;

  @observable
  bool isCancel=false;

  @action
  onDialogOk(){
    isOk =true;
    isCancel=false;
    FLog.info(text:'Ok');
    NavigationServices.close();
  }

  @action
  onDialogCancel(){
    isOk =false;
    isCancel=true;
    FLog.info(text:'Cancel');
    NavigationServices.close();
  }

  @action
  setTitleDialog(String text){
    dialogTitle = text;
  }

  @action
  setContentDialog(String text){
    dialogContent = text;
  }

}