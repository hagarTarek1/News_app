
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/model/artsModel.dart';
import 'package:news_app/model/businessModel.dart';
import 'package:news_app/model/generalModel.dart';
import 'package:news_app/model/healthModel.dart';
import 'package:news_app/model/scienceModel.dart';
import 'package:news_app/model/sportModel.dart';
import 'package:news_app/model/technologyModel.dart';
import 'package:news_app/view_model/cubit/news_state.dart';
import 'package:news_app/view_model/network/dio-helper.dart';
import 'package:news_app/view_model/network/endpoints.dart';

import '../../model/categoryModel.dart';

class NewsCubit extends Cubit<NewsState>{
  NewsCubit():super(InitState());
  static NewsCubit get(context) => BlocProvider.of<NewsCubit>(context);
  List <CategoryModel> categories=[
    CategoryModel(title: "Sports",image: "assets/soccer 1.png"),
    CategoryModel(title: "Business",image: "assets/business-report 1.png"),
    CategoryModel(title: "Health",image: "assets/medical-app (1) 1.png"),
    CategoryModel(title: "Science",image: "assets/data-science 1.png"),
    CategoryModel(title: "Technology",image: "assets/chip 1.png"),
    CategoryModel(title: "Arts",image: "assets/membership 1.png"),
  ];
  GeneralModel? generalModel;
  ArtsModel? artsModel;
  BusinessModel? businessModel;
  SportsModel? sportsModel;
  HealthModel? healthModel;
  TechnologyModel? technologyModel;
  ScienceModel? scienceModel;

  getGeneral (){
    emit(GeneralLoading());
DioHelper.get(path: "",
queryParameters: {'category': general}).then((value) {
  generalModel=GeneralModel.fromJson(value.data);
  emit(GeneralSuccess());
});
  }
  getSports (){
emit(SportNewsLoading());
DioHelper.get(path: "", queryParameters: {'category': sport}).then((value) {
  sportsModel=SportsModel.fromJson(value.data);
  emit(SportNewsSuccess());
});
  }
  getArts (){
    emit(ArtNewsLoading());
    DioHelper.get(path: "", queryParameters:{'category': art}).then((value){
      artsModel=ArtsModel.fromJson(value.data);
      emit(ArtNewsSuccess());
    });
  }
  getBusiness (){
    emit(BusinessNewsLoading());
    DioHelper.get(path: "", queryParameters: {'category': business}).then((value) {
      businessModel=BusinessModel.fromJson(value.data);
      emit(BusinessNewsSuccess());
    });
  }
  getHealth (){
    emit(HealthNewsLoading());
    DioHelper.get(path: "", queryParameters: {'category': health}).then((value) {
      healthModel=HealthModel.fromJson(value.data);
      emit(HealthNewsSuccess());
    });
  }
  getTechnology (){
    emit(TechnologyNewsLoading());
    DioHelper.get(path: "", queryParameters: {'category': technology}).then((value) {
      technologyModel=TechnologyModel.fromJson(value.data);
      emit(TechnologyNewsSuccess());
    });
  }
  getScience (){
    emit(ScienceNewsLoading());
    DioHelper.get(path: "", queryParameters: {'category': science}).then((value) {
      scienceModel=ScienceModel.fromJson(value.data);
      emit(ScienceNewsSuccess());
    });
  }
}