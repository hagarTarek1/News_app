import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/view/components/artNews.dart';
import 'package:news_app/view/components/businessNews.dart';
import 'package:news_app/view/components/healthNews.dart';
import 'package:news_app/view/components/scienceNews.dart';
import 'package:news_app/view/components/sportNews.dart';
import 'package:news_app/view/components/technology.dart';
import 'package:news_app/view_model/cubit/news_cubit.dart';

import '../../view_model/cubit/news_state.dart';
class CategoryScreen extends StatelessWidget {
  final int? index;
   CategoryScreen({required this.index,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsState>(builder: (context,state){
      var cubit=NewsCubit.get(context);
      return Scaffold(
        appBar: AppBar(backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 40,),
        backgroundColor: Colors.black,
        body: Padding(
          padding: EdgeInsets.all(15.r),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text(cubit.categories[index!].title ??"",style:GoogleFonts.aBeeZee(textStyle: TextStyle(fontSize: 25.sp,color: Colors.white,fontWeight: FontWeight.bold)),),
              SizedBox(height: 10.h,),
                Text("news around the world.",style:GoogleFonts.aBeeZee(textStyle: TextStyle(fontSize: 18.sp,color: Colors.white,fontWeight: FontWeight.bold)),),
                SizedBox(height: 15.h,),
                ListView.separated(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemBuilder: (context,i){
                      return
                      index ==0?
                        News(sports: cubit.sportsModel!.articles![i]):
                          index==1?
                              BusinessNews(business:cubit.businessModel!.articles![i]):
                              index==2?
                                  HealthNews(health: cubit.healthModel!.articles![i]):
                                  index==3?
                                      ScienceNews(science:cubit.scienceModel!.articles![i]):
                                      index==4?
                                          TechnologyNews(technology: cubit.technologyModel!.articles![i]):
                          ArtNews(arts: cubit.artsModel!.articles![i]);

                    }, separatorBuilder: (context,index){
                  return SizedBox(height: 10.h,);
                }, itemCount: cubit.sportsModel?.articles?.length ?? 1)

              ],),
          ),
        ),
      );
    }, listener: (context,state){});
  }
}
