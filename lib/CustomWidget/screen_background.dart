import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Utils/asset_paths.dart';

class ScreenBackground extends StatelessWidget {
  const ScreenBackground({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Stack(
        children: [
           Center(
       child: Container(
       height: 170,
         width: 170,
         decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(100),
             color: Colors.white
         ),
        child: Center(
          child: Column(
           // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,color: Color(0xFF0F3D2E)),
              ),
              Text("Your daily islamic companion",style: TextStyle(
                fontSize: 10,fontWeight: FontWeight.w800,color: Color(0xFF0F3D2E)
              ),)
            ],
          ),
        ),

         ),
      //     Image.asset(
      //         AssetPaths.splashScreen,
      //       fit: BoxFit.cover,
      //       height: 100,
      //       width: 100,
      //     ),
          ///----------------- SVG Picture er jonno ---------------
          // SvgPicture.asset(
          //   AssetPaths.backgroundSvg,
          //   fit: BoxFit.cover,
          //   height: double.maxFinite,
          //   width: double.maxFinite,
          // ),
          //child,
           )

        ],
      ),
    );

  }
}
