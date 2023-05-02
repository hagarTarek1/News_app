import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/consts/color.dart';
import 'package:news_app/view/screens/categoryNewsScreen.dart';
import 'package:news_app/view_model/cubit/news_cubit.dart';
import 'package:news_app/view_model/cubit/news_state.dart';
import '../../model/categoryModel.dart';

class Categories extends StatelessWidget {
  final int? index;
  CategoryModel? categoryModel;
   Categories({required this.categoryModel,required this.index,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsState>(builder:(context,state){

      return Material(
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoryScreen(index:index,)));},
          child: Container(

            decoration: BoxDecoration(color: yellow,borderRadius: BorderRadius.circular(20)),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(categoryModel?.image ?? ""),
              SizedBox(height: 5.h,),
              Text(categoryModel?.title??"",style:GoogleFonts.aBeeZee(textStyle: TextStyle(fontSize: 16.sp,color: Colors.white,fontWeight: FontWeight.bold)),),

              ],
          ),
              ),
        ),
      );
    }, listener: (context,state){});
  }
}
