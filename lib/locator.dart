
import 'package:SkillShare/core/View_Models/base_view_model.dart';
import 'package:SkillShare/core/View_Models/data_view_model.dart';
import 'package:SkillShare/core/View_Models/home_view_model.dart';
import 'package:SkillShare/core/View_Models/profiles_view_model.dart';
import 'package:SkillShare/core/View_Models/settings_view_model.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

//Register all viewmodels extending baseView models here
void setLocator(){
  locator.registerFactory(() => BaseViewModel());
  locator.registerLazySingleton(() => ProfilesViewModel());
  locator.registerLazySingleton(() => HomeViewModel());
  locator.registerLazySingleton(() => DataViewModel());
  locator.registerLazySingleton(() => SettingsViewModel());
}