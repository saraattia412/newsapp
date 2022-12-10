import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/cubit/states.dart';
import 'package:news/shared/network/local/cache_helper.dart';
// ignore_for_file: avoid_print


class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(AppInitialState());

  //OBJECT
static AppCubit get(context) => BlocProvider.of(context);


  bool isDark =false ;

  void changeAppMode({ bool? fromShared}) {

    if(fromShared != null){
      isDark=fromShared;
      emit(AppChangeModeState());

    }
    else {
      isDark = !isDark;
      CacheHelper.setBooleanData(key: 'isDark', value: isDark).then((value) {
        emit(AppChangeModeState());
      });
    }


  }


}