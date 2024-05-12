import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:kids/VideoLearning/ABC%20song.dart';
import 'package:kids/VideoLearning/AnimalVideo.dart';
import 'package:kids/VideoLearning/BirdVideo.dart';
import 'package:kids/VideoLearning/FlowerVideo.dart';
import 'package:kids/VideoLearning/FruitVideo.dart';
import 'package:kids/VideoLearning/MonthVideo.dart';
import 'package:kids/VideoLearning/Number%20video.dart';
import 'package:kids/VideoLearning/ShapeVideo.dart';
import 'package:kids/VideoLearning/VegitableVideo.dart';
import 'package:kids/VideoLearning/colorvideo.dart';
import 'package:kids/utils/admob.dart';

import '../VideoLearning/vedio_screen.dart';

class VideoLearning extends StatefulWidget{
  @override
  State<VideoLearning> createState() => _VideoLearningState();
}

class _VideoLearningState extends State<VideoLearning> {
  AdmobHelper admobHelper =  new AdmobHelper();

  void initState() {
    super.initState();
    admobHelper.createInterad();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Color(0xFFFEF7F0),
        title: Center(child: Text('Video Learning',style: TextStyle(color: Color(0xFF000000),fontFamily: "arlrdbd"),)),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.count(
                padding: EdgeInsets.all(35),
                mainAxisSpacing: 15,
                crossAxisSpacing: 20,
                crossAxisCount: 2,
                primary: false,
                children: [
                  InkWell(
                    splashColor: Colors.orange[100],
                    onTap: (){
                      // admobHelper.showInterad();
                      Navigator.push(context, CupertinoPageRoute(builder: (context)=> VideoScreen(vedioPath: 'assets/abc.mp4',name: 'ABCD',)));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.orange[50],
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/Alphabet.png',height: 90,),
                            Container(
                                height: 45,
                                width: 200,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.orange[100]
                                ),
                                child: Center(child: Text('ABC Video',style: TextStyle(color: Colors.black,fontFamily: "arlrdbd",fontSize: 18),))),                          ]
                      ),
                    ),
                  ),
                  // InkWell(
                  //   splashColor: Colors.orange[100],
                  //   onTap: (){
                  //     admobHelper.showInterad();
                  //     Navigator.push(context, MaterialPageRoute(builder: (context)=>NumberVideo()));
                  //   },
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(10.0),
                  //       color: Colors.orange[50],
                  //     ),
                  //     child: Column(
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         crossAxisAlignment: CrossAxisAlignment.center,
                  //         children: [
                  //           Image.asset('assets/images/Numbers.png',height: 90),
                  //           Container(
                  //               height: 45,
                  //               width: 200,
                  //               decoration: BoxDecoration(
                  //                   borderRadius: BorderRadius.circular(10),
                  //                   color: Colors.orange[100]
                  //               ),
                  //               child: Center(child: Text('Number Video',style: TextStyle(color: Colors.black,fontFamily: "arlrdbd",fontSize: 18),))),                          ]
                  //      ),
                  //    ),
                  //  ),
                  InkWell(
                    splashColor: Colors.orange[100],
                    onTap: (){
                      Navigator.push(context, CupertinoPageRoute(builder: (context)=> VideoScreen(vedioPath: 'assets/color.mp4',name: 'Colors')));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.orange[50],
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/Color.png',height: 90),
                            Container(
                                height: 45,
                                width: 200,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.orange[100]
                                ),
                                child: Center(child: Text('Color Video',style: TextStyle(color: Colors.black,fontFamily: "arlrdbd",fontSize: 18),))),                          ]
                        ),
                      ),
                   ),
                  InkWell(
                    splashColor: Colors.orange[100],
                    onTap: (){
                      admobHelper.showInterad();
                      Navigator.push(context, CupertinoPageRoute(builder: (context)=> VideoScreen(vedioPath: 'assets/shapes.mp4',name: 'Shapes')));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.orange[50],
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/Shapes.png',height: 90),
                            Container(
                                height: 45,
                                width: 200,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.orange[100]
                                ),
                                child: Center(child: Text('Shape Video',style: TextStyle(color: Colors.black,fontFamily: "arlrdbd",fontSize: 18),))),                          ]
                      ),
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.orange[100],
                    onTap: (){
                      admobHelper.showInterad();
                      Navigator.push(context, CupertinoPageRoute(builder: (context)=> VideoScreen(vedioPath: 'assets/animal.mp4',name: 'Animals')));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.orange[50],
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/Animals.png',height: 90),
                            Container(
                                height: 45,
                                width: 200,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.orange[100]
                                ),
                                child: Center(child: Text('Animal Video',style: TextStyle(color: Colors.black,fontFamily: "arlrdbd",fontSize: 18),))),                          ]
                       ),
                     ),
                   ),
                  InkWell(
                    splashColor: Colors.orange[100],
                    onTap: (){
                      Navigator.push(context, CupertinoPageRoute(builder: (context)=> VideoScreen(vedioPath: 'assets/birds.mp4',name: 'Birds')));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.orange[50],
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/Birds.png',height: 90),
                            Container(
                                height: 45,
                                width: 200,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.orange[100]
                                ),
                                child: Center(child: Text('Bird Video',style: TextStyle(color: Colors.black,fontFamily: "arlrdbd",fontSize: 18),))),                          ]
                       ),
                     ),
                  ),
                  InkWell(
                    splashColor: Colors.orange[100],
                    onTap: (){
                      Navigator.push(context, CupertinoPageRoute(builder: (context)=> VideoScreen(vedioPath: 'assets/flowers.mp4',name: 'FLowers')));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.orange[50],
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/Flowers.png',height: 90),
                            Container(
                                height: 45,
                                width: 200,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.orange[100]
                                ),
                                child: Center(child: Text('Flower Video',style: TextStyle(color: Colors.black,fontFamily: "arlrdbd",fontSize: 18),))),                          ]
                       ),
                     ),
                  ),
                  InkWell(
                    splashColor: Colors.orange[100],
                    onTap: (){
                      admobHelper.showInterad();
                      Navigator.push(context, CupertinoPageRoute(builder: (context)=> VideoScreen(vedioPath: 'assets/fruits.mp4',name: 'Fruits')));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.orange[50],
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/Fruit.png',height: 90),
                            Container(
                                height: 45,
                                width: 200,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.orange[100]
                                ),
                                child: Center(child: Text('Fruit Video',style: TextStyle(color: Colors.black,fontFamily: "arlrdbd",fontSize: 18),))),                          ]
                       ),
                     ),
                  ),
                  InkWell(
                    splashColor: Colors.orange[100],
                    onTap: (){
                      Navigator.push(context, CupertinoPageRoute(builder: (context)=> VideoScreen(vedioPath: 'assets/months.mp4',name: 'months')));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.orange[50],
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/Month.png',height: 90),
                            Container(
                                height: 45,
                                width: 200,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.orange[100]
                                ),
                                child: Center(child: Text('Month Video',style: TextStyle(color: Colors.black,fontFamily: "arlrdbd",fontSize: 18),))),                          ]
                       ),
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.orange[100],
                    onTap: (){
                      // admobHelper.showInterad();
                      Navigator.push(context, CupertinoPageRoute(builder: (context)=> VideoScreen(vedioPath: 'assets/vegetables.mp4',name: 'Vegetables')));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.orange[50],
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/Vegitable.png',height: 90),
                            Container(
                                height: 45,
                                width: 200,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.orange[100]
                                ),
                                child: Center(child: Text('Vegetable Video',style: TextStyle(color: Colors.black,fontFamily: "arlrdbd",fontSize: 18),))),                          ]
                       ),
                     ),
                   )
                 ]
              ),
           ),
        ],
      ),
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.width *0.13,
        width: 25,
        child: AdWidget(
          ad:AdmobHelper.getBannerAd()..load(),
        ),
      ),
    );
  }
}



