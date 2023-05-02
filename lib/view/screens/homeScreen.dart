import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/view/components/categories.dart';
import 'package:news_app/view/components/general.dart';
import 'package:news_app/view_model/cubit/news_cubit.dart';
import 'package:news_app/view_model/cubit/news_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsState>(builder: (context,state){
      var cubit=NewsCubit.get(context);
      return Scaffold(

        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.only(top: 60,left: 10,right: 10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               Text("Pick your news category",style:GoogleFonts.aBeeZee(textStyle: TextStyle(fontSize: 25.sp,color: Colors.white,fontWeight: FontWeight.bold)),),
                Container(
                  height: 250.h,
                  padding: EdgeInsets.all(20.r),
                  child: GridView.count(crossAxisCount: 3,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    children: List.generate(cubit.categories.length, (index) {
                      return Categories(categoryModel: cubit.categories[index],index: index,);
                    }),
                  ),
                ),
                //Divider(color: Colors.white,thickness: 2,),
                Text("General",style:GoogleFonts.aBeeZee(textStyle: TextStyle(fontSize: 25.sp,color: Colors.white,fontWeight: FontWeight.bold)),),
                Text("Trending news around the world",style:GoogleFonts.aBeeZee(textStyle: TextStyle(fontSize: 18.sp,color: Colors.white,height: 1.5)),),
               ListView.separated(
                 shrinkWrap: true,
                   physics: ScrollPhysics(),
                   itemBuilder: (context,index){
                 return General(articles: cubit.generalModel!.articles![index]);
               }, separatorBuilder: (context,index){
                 return SizedBox(height: 10.h,);
               }, itemCount: cubit.generalModel?.articles?.length ?? 1)
              ],),
          ),
        ),
      );
    }, listener: (context,state){});
  }
}
