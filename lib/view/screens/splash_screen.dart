import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/consts/color.dart';
import 'package:news_app/view_model/cubit/news_cubit.dart';

import '../../view_model/cubit/news_state.dart';
import 'homeScreen.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsState>(builder: (context,state){
      return Scaffold(
        backgroundColor: yellow,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 30.r),
              child: Column(mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("news",style:GoogleFonts.acme(textStyle: TextStyle(fontSize: 75.sp,color: Colors.black12,height: .7,fontWeight: FontWeight.bold)),),
                  Text("news",style:GoogleFonts.acme(textStyle: TextStyle(fontSize: 75.sp,color: Colors.black12,height: .7,fontWeight: FontWeight.bold)),),
                  Text("news",style:GoogleFonts.acme(textStyle: TextStyle(fontSize: 75.sp,color: Colors.black12,height: .7,fontWeight: FontWeight.bold)),),
                  Text("news",style:GoogleFonts.acme(textStyle: TextStyle(fontSize: 75.sp,color: Colors.black38,height: .7,fontWeight: FontWeight.bold)),),
                  Text("news",style:GoogleFonts.acme(textStyle: TextStyle(fontSize: 75.sp,color: Colors.black54,height: .7,fontWeight: FontWeight.bold)),),
                  Text("news",style:GoogleFonts.acme(textStyle: TextStyle(fontSize: 75.sp,color: Colors.black,height: .7,fontWeight: FontWeight.bold)),),
                  Text("news",style:GoogleFonts.acme(textStyle: TextStyle(fontSize: 75.sp,color: Colors.black54,height: .7,fontWeight: FontWeight.bold)),),
                  Text("news",style:GoogleFonts.acme(textStyle: TextStyle(fontSize: 75.sp,color: Colors.black38,height: .7,fontWeight: FontWeight.bold)),),
                  Text("news",style:GoogleFonts.acme(textStyle: TextStyle(fontSize: 75.sp,color: Colors.black26,height: .7,fontWeight: FontWeight.bold)),),
                  Text("news",style:GoogleFonts.acme(textStyle: TextStyle(fontSize: 75.sp,color: Colors.black12,height: .7,fontWeight: FontWeight.bold)),),
                  Text("news",style:GoogleFonts.acme(textStyle: TextStyle(fontSize: 75.sp,color: Colors.white12,height: .7,fontWeight: FontWeight.bold)),),
                ],),
            ),

            InkWell(onTap: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
            },child: Container(
              margin: EdgeInsets.only(left: 90,top: 40),
              height: 45.h,width: 200.w,
              decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(30.r)),
              child:Center(child: Text("continue",style:GoogleFonts.acme(textStyle: TextStyle(fontSize: 28.sp,color: yellow,)),)),
            ),)
          ],),
      );
    }, listener: (context,state){});
  }
}


