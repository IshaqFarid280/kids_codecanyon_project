
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kids/utils/model.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';



class ABCQuiz extends StatefulWidget{
  @override
  State<ABCQuiz> createState() => _ABCQuizState();
}
List<Numbermodel> kidslist =KidsList1();
class _ABCQuizState extends State<ABCQuiz> {
bool isPressed = false;
bool? isselected;
// int i;
Color istrue = Color(0xFFF19335);
Color isWrong = Color(0xFFFF0000);
Color isselect = Colors.white;
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
        backgroundColor: Color(0xFFFEF7F0),
        title: Center(child: Text('Alphabet',style: TextStyle(fontFamily: "arlrdbd",color: Colors.black),)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
                child: PageView.builder(
                  controller: _controller,
                  onPageChanged: (page){
                    isPressed = false;

                  },
                  physics: NeverScrollableScrollPhysics(),
                  itemCount:questions.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 30.0,
                        ),
                         Image.asset(kidslist[index].image),
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
                                for(int i = 0;i<questions[index].answer.length;i++)
                                   MaterialButton(
                                     shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(20.0),side: BorderSide(color: isselect)),
                                           elevation: 10.0,
                                          height: 10,
                                          minWidth: double.infinity,
                                          color: isPressed?questions[index].answer.entries.toList()[i].value?istrue:isWrong:Colors.white,
                                          padding: EdgeInsets.symmetric(vertical:18.0),
                                          onPressed: isPressed?(){}
                                              :(){
                                            if(questions[index].answer.entries.toList()[i].value){
                                            setState(() {
                                                isPressed = true;
                                                }
                                              );
                                              score +=  1;
                                              print(score);
                                              MotionToast.success(

                                                  description: Text(''),
                                                  borderRadius: 5,
                                                  animationDuration: Duration(seconds: 2),
                                                  title: Text("Your Answer is Right",style: TextStyle(fontSize: 20),),
                                                  iconType: ICON_TYPE.cupertino
                                              ).show(context);
                                            }else{
                                              setState(() {
                                                isPressed = true;
                                                }
                                              );
                                              MotionToast.error(
                                                  description: Text(''),
                                                  borderRadius: 5,
                                                  animationDuration: Duration(seconds: 2),
                                                  title: Text("Your Answer is Wrong",style: TextStyle(fontSize: 20),),
                                                  iconType: ICON_TYPE.cupertino
                                              ).show(context);
                                            }
                                          },
                                          child: Text(
                                             questions[index].answer.keys.toList()[i],
                                               style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: "arlrdbd",
                                                  fontSize: 20.0
                                                ),
                                              ),
                                          ),
                                      ],
                                   ),
                             ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Align(
                                heightFactor: 3,
                                child: OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                      shape: BeveledRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    onPressed: isPressed ? index + 1== questions.length
                                        ?(){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultSrceen(score)));
                                    }
                                        :(){
                                      _controller.nextPage(duration: Duration(microseconds: 500), curve: Curves.linear);
                                    }:null,
                                    child: Text(
                                      index + 1 == questions.length? "See Result":"Next Question",
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
class ResultSrceen extends StatefulWidget{
  final int score;
  ResultSrceen(this.score);
  @override
  _ResultSrceenState createState() => _ResultSrceenState();
}
class _ResultSrceenState extends State<ResultSrceen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Text("Congratulation",style: TextStyle(color: Colors.black,fontFamily: "arlrdbd",fontSize: 38.0),)),
          Center(child: Text("Your Score is:",style: TextStyle(color: Colors.black,fontFamily: "arlrdbd",fontSize: 25.0,fontWeight: FontWeight.w500),)),

          SizedBox(height: 50.0,),
          Center(child: Text("${widget.score}",style: TextStyle(color: Colors.black,fontFamily: "arlrdbd",fontSize: 80.0),))
        ],
      ),

    );
  }
}