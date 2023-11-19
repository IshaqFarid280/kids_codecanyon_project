import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import '../utils/model.dart';

class GeneralKnowledge extends StatefulWidget {
  @override
  State<GeneralKnowledge> createState() => _GeneralKnowledgeState();
}

List<Numbermodel> kidslist = generalKnowledge();
class _GeneralKnowledgeState extends State<GeneralKnowledge> {
  bool isPressed = false;
// int i;
  Color istrue = Colors.amber;
  Color isWrong = Colors.red;
  // Color isselect = Color.fromRGBO(209, 209, 209, 1);
  Color iselect1 = Colors.white;
  int score = 0;

  @override
  Widget build(BuildContext context) {

    PageController _controller = new PageController(initialPage: 0);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        elevation: 0,
        title: Center(
          child: Text(
            'General Knowledge',
            style: TextStyle(color: Colors.black, fontFamily: "arlrdbd"),
          ),
        ),
      ),
      // body: Column(
      //   children: [
      //     Expanded(
      //       child: GridView.count(
      //         crossAxisCount: 2,
      //         padding: EdgeInsets.all(35),
      //         mainAxisSpacing: 15,
      //         crossAxisSpacing: 20,
      //         children: [
      //           //
      //           // InkWell(
      //           //   splashColor: Colors.orange[100],
      //           //   onTap: (){
      //           //     debugPrint('Quaid e Azam');
      //           //     Navigator.push(context, MaterialPageRoute(builder: (context)=> MunibaMazari()));
      //           //   },
      //           //   child: Container(
      //           //     decoration: BoxDecoration(
      //           //       borderRadius: BorderRadius.circular(10.0),
      //           //       color: Colors.orange[50],
      //           //     ),
      //           //     child: Column(
      //           //         mainAxisAlignment: MainAxisAlignment.center,
      //           //         crossAxisAlignment: CrossAxisAlignment.center,
      //           //         children: [
      //           //           Image.asset('assets/swiper/quaid1.jpg',height: 90,),
      //           //           Container(
      //           //               height: 45,
      //           //               width: 200,
      //           //               decoration: BoxDecoration(
      //           //                   borderRadius: BorderRadius.circular(10),
      //           //                   color: Colors.orange[100]
      //           //               ),
      //           //               child: Center(child: Text('Quaid e Azam',style: TextStyle(color: Colors.black,fontFamily: "arlrdbd",fontSize: 18),))),                          ]
      //           //     ),
      //           //   ),
      //           // ),
      //           // InkWell(
      //           //   splashColor: Colors.orange[100],
      //           //   onTap: (){
      //           //     Navigator.push(context, MaterialPageRoute(builder: (context)=>AllamaIqbal()));
      //           //   },
      //           //   child: Container(
      //           //     decoration: BoxDecoration(
      //           //       borderRadius: BorderRadius.circular(10.0),
      //           //       color: Colors.orange[50],
      //           //     ),
      //           //     child: Column(
      //           //         mainAxisAlignment: MainAxisAlignment.center,
      //           //         crossAxisAlignment: CrossAxisAlignment.center,
      //           //         children: [
      //           //           Image.asset('assets/swiper/iqbal1.webp',height: 90),
      //           //           Container(
      //           //               height: 45,
      //           //               width: 200,
      //           //               decoration: BoxDecoration(
      //           //                   borderRadius: BorderRadius.circular(10),
      //           //                   color: Colors.orange[100]
      //           //               ),
      //           //               child: Center(child: Text('Allama Iqbal',style: TextStyle(color: Colors.black,fontFamily: "arlrdbd",fontSize: 18),))),
      //           //         ]
      //           //     ),
      //           //   ),
      //           // ),
      //           // InkWell(
      //           //   splashColor: Colors.orange[100],
      //           //   onTap: (){
      //           //     Navigator.push(context, MaterialPageRoute(builder: (context)=> ArfaKareem()));
      //           //   },
      //           //   child: Container(
      //           //     decoration: BoxDecoration(
      //           //       borderRadius: BorderRadius.circular(10.0),
      //           //       color: Colors.orange[50],
      //           //     ),
      //           //     child: Column(
      //           //         mainAxisAlignment: MainAxisAlignment.center,
      //           //         crossAxisAlignment: CrossAxisAlignment.center,
      //           //         children: [
      //           //           Image.asset('assets/swiper/ArfaKarim2.jpeg',height: 90,),
      //           //           Container(
      //           //               height: 45,
      //           //               width: 200,
      //           //               decoration: BoxDecoration(
      //           //                   borderRadius: BorderRadius.circular(10),
      //           //                   color: Colors.orange[100]
      //           //               ),
      //           //               child: Center(child: Text('Arfa Kareem',style: TextStyle(color: Colors.black,fontFamily: "arlrdbd",fontSize: 18),))),                          ]
      //           //     ),
      //           //   ),
      //           // ),
      //           // InkWell(
      //           //   splashColor: Colors.orange[100],
      //           //   onTap: (){
      //           //     Navigator.push(context, MaterialPageRoute(builder: (context)=>MalalaYousafzai()));
      //           //   },
      //           //   child: Container(
      //           //     decoration: BoxDecoration(
      //           //       borderRadius: BorderRadius.circular(10.0),
      //           //       color: Colors.orange[50],
      //           //     ),
      //           //     child: Column(
      //           //         mainAxisAlignment: MainAxisAlignment.center,
      //           //         crossAxisAlignment: CrossAxisAlignment.center,
      //           //         children: [
      //           //           Image.asset('assets/swiper/malala1.jpeg',height: 90),
      //           //           Container(
      //           //               height: 45,
      //           //               width: 200,
      //           //               decoration: BoxDecoration(
      //           //                   borderRadius: BorderRadius.circular(10),
      //           //                   color: Colors.orange[100]
      //           //               ),
      //           //               child: Center(child: Text('Malala Yousafzai', style: TextStyle(color: Colors.black,fontFamily: "arlrdbd",fontSize: 18),))),
      //           //         ]
      //           //     ),
      //           //   ),
      //           // ),
      //           // InkWell(
      //           //   splashColor: Colors.orange[100],
      //           //   onTap: (){
      //           //     Navigator.push(context, MaterialPageRoute(builder: (context)=> MunibaMazari()));
      //           //   },
      //           //   child: Container(
      //           //     decoration: BoxDecoration(
      //           //       borderRadius: BorderRadius.circular(10.0),
      //           //       color: Colors.orange[50],
      //           //     ),
      //           //     child: Column(
      //           //         mainAxisAlignment: MainAxisAlignment.center,
      //           //         crossAxisAlignment: CrossAxisAlignment.center,
      //           //         children: [
      //           //           Image.asset('assets/swiper/Muniba Mazari1.jpeg',height: 90,),
      //           //           Container(
      //           //               height: 45,
      //           //               width: 200,
      //           //               decoration: BoxDecoration(
      //           //                   borderRadius: BorderRadius.circular(10),
      //           //                   color: Colors.orange[100]
      //           //               ),
      //           //               child: Center(child: Text('Muniba Mazari',style: TextStyle(color: Colors.black,fontFamily: "arlrdbd",fontSize: 18),))),                          ]
      //           //     ),
      //           //   ),
      //           // ),
      //
      //         ],
      //       ),
      //     )
      //   ],
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: PageView.builder(
                controller: _controller,
                onPageChanged: (page) {
                  isPressed = false;
                },
                physics: NeverScrollableScrollPhysics(),
                itemCount: generalknowledgequestions.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 40.0,
                      ),
                      Text(kidslist[index].text1, style: TextStyle(
                        color: Colors.black,
                        fontSize: 28,fontFamily: "arlrdbd"
                      ),),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                      Expanded(
                        child: GridView.count(
                          padding: EdgeInsets.all(50),
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                          physics: NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          primary: false,
                          children: [
                            for (int i = 0;
                            i < generalknowledgequestions[index].answer.length;
                            i++)
                              MaterialButton(
                                shape: BeveledRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    side: BorderSide(color: iselect1)),
                                elevation: 10.0,
                                height: 10,
                                minWidth: double.infinity,
                                color: isPressed
                                    ? generalknowledgequestions[index]
                                    .answer
                                    .entries
                                    .toList()[i]
                                    .value
                                    ? istrue
                                    : isWrong
                                        : Colors.white,
                                padding: EdgeInsets.symmetric(vertical: 18.0),
                                onPressed: isPressed
                                    ? () {}
                                    : () {
                                  if (generalknowledgequestions[index]
                                      .answer
                                      .entries
                                      .toList()[i]
                                      .value) {
                                    setState(() {
                                      isPressed = true;
                                    });
                                    score += 1;
                                    print(score);
                                    MotionToast.success(
                                        description: Text(''),
                                        borderRadius: 5,
                                        animationDuration:
                                        Duration(seconds: 2),
                                        title: Text(
                                          "Your Answer is Right",
                                          style:
                                          TextStyle(fontSize: 20),
                                        ),
                                        iconType: ICON_TYPE.cupertino)
                                        .show(context);
                                  } else {
                                    setState(() {
                                      isPressed = true;
                                    });
                                    MotionToast.error(
                                        description: Text(''),
                                        borderRadius: 5,
                                        animationDuration:
                                        Duration(seconds: 2),
                                        title: Text(
                                          "Your Answer is Wrong",
                                          style:
                                          TextStyle(fontSize: 20),
                                        ),
                                        iconType: ICON_TYPE.cupertino)
                                        .show(context);
                                  }
                                },
                                child: Text(
                                  generalknowledgequestions[index].answer.keys.toList()[i],
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "arlrdbd",
                                      fontSize: 20.0),
                                ),
                              ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            heightFactor: 6,
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                shape: BeveledRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              onPressed: isPressed
                                  ? index + 1 == generalknowledgequestions.length
                                  ? () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ResultSrceen(score)));
                              }
                                  : () {
                                _controller.nextPage(
                                    duration:
                                    Duration(microseconds: 500),
                                    curve: Curves.linear);
                              }
                                  : null,
                              child: Text(
                                index + 1 == generalknowledgequestions.length
                                    ? "See Result"
                                    : "Next Question",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.black,
                                  fontFamily: "arlrdbd",
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),

    );
  }
}

class ResultSrceen extends StatefulWidget {
  final int score;
  ResultSrceen(this.score);
  @override
  _ResultSrceenState createState() => _ResultSrceenState();
}

class _ResultSrceenState extends State<ResultSrceen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: Text(
                "Congratulation",
                style: TextStyle(
                    color: Colors.black, fontFamily: "arlrdbd", fontSize: 38.0),
              )),
          Center(
              child: Text(
                "Your Score is:",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: "arlrdbd",
                    fontSize: 25.0,
                    fontWeight: FontWeight.w500),
              )),
          SizedBox(
            height: 50.0,
          ),
          Center(
              child: Text(
                "${widget.score}",
                style: TextStyle(
                    color: Colors.black, fontFamily: "arlrdbd", fontSize: 80.0),
              ))
        ],
      ),
    );
  }
}
