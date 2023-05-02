import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/consts/color.dart';
import 'package:news_app/model/generalModel.dart';
import 'package:news_app/view_model/cubit/news_cubit.dart';
import 'package:news_app/view_model/cubit/news_state.dart';
class General extends StatelessWidget {
  Articles? articles;
  General({required this.articles,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsState>(builder: (context,state){
      return Container(
        margin: EdgeInsets.only(left: 15,right: 15),
        padding: EdgeInsets.all(15.r),
        decoration: BoxDecoration(color: yellow,borderRadius: BorderRadius.circular(20)),
        child: Column( mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
                child: Image.network(articles?.urlToImage ??"")),
            SizedBox(height: 10.h,),
            Text("${articles?.description}" ??"",style:GoogleFonts.aBeeZee(textStyle: TextStyle(fontSize: 18.sp,color: Colors.black,fontWeight: FontWeight.w600)),),
            SizedBox(height: 10.h,),
            Text('-source \n${articles?.source?.name}.' ??"",style:GoogleFonts.aBeeZee(textStyle: TextStyle(fontSize: 15.sp,color: Colors.black,fontWeight: FontWeight.w600)),),

            SizedBox(height: 10.h,),
            Text('-published at \n${articles?.publishedAt}.' ??"",style:GoogleFonts.aBeeZee(textStyle: TextStyle(fontSize: 15.sp,color: Colors.black,fontWeight: FontWeight.w600)),),


          ],),
      );
    }, listener: (context,state){});
  }
}
