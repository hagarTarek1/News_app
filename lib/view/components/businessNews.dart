import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/model/artsModel.dart';
import 'package:news_app/model/businessModel.dart';
import 'package:news_app/view_model/cubit/news_cubit.dart';
import 'package:news_app/view_model/cubit/news_state.dart';

import '../../consts/color.dart';
class BusinessNews extends StatelessWidget {
  Business? business;
  BusinessNews({required this.business,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsState>(builder: (context,state){
      return  Container(
        margin: EdgeInsets.only(left: 15,right: 15),
        padding: EdgeInsets.all(15.r),
        decoration: BoxDecoration(color: yellow,borderRadius: BorderRadius.circular(20)),
        child: Column( mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(business?.urlToImage ??"")),
            SizedBox(height: 10.h,),
            Text("${business?.description}" ??"",style:GoogleFonts.aBeeZee(textStyle: TextStyle(fontSize: 18.sp,color: Colors.black,fontWeight: FontWeight.w600)),),
            SizedBox(height: 10.h,),
            Text('-source \n${business?.source?.name}.' ??"",style:GoogleFonts.aBeeZee(textStyle: TextStyle(fontSize: 15.sp,color: Colors.black,fontWeight: FontWeight.w600)),),

            SizedBox(height: 10.h,),
            Text('-published at \n${business?.publishedAt}.' ??"",style:GoogleFonts.aBeeZee(textStyle: TextStyle(fontSize: 15.sp,color: Colors.black,fontWeight: FontWeight.w600)),),


          ],),
      );
    }, listener: (context,state){});
  }
}