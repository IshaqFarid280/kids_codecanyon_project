import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:kids/MoralStories/greedyDog_story.dart';
import 'package:kids/MoralStories/thirstycrow_story.dart';

class MoralStories extends StatefulWidget {
  @override
  State<MoralStories> createState() => _MoralStoriesState();
}

class _MoralStoriesState extends State<MoralStories> {
  @override
  Widget build(BuildContext context) {
    final FlutterTts flutterTts = FlutterTts();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Color(0xFFFEF7F0),
        elevation: 0,
        title: Center(
          child: Text(
            'Moral Stories',
            style: TextStyle(color: Colors.black, fontFamily: "arlrdbd"),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.all(35),
              mainAxisSpacing: 15,
              crossAxisSpacing: 20,
              children: [

                InkWell(
                  splashColor: Colors.orange[100],
                  onTap: (){
                    flutterTts.speak('Thirsty Crow');
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> ThirstyCros()));
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
                          Image.asset('assets/images/thirstyCrow.png',height: 90,),
                          Container(
                              height: 45,
                              width: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.orange[100]
                              ),
                              child: Center(child: Text('Thirsty Crow',style: TextStyle(color: Colors.black,fontFamily: "arlrdbd",fontSize: 18),))),                          ]
                    ),
                  ),
                ),
                InkWell(
                  splashColor: Colors.orange[100],
                  onTap: (){
                    flutterTts.speak('Greedy Dog');
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>GreedyDo()));
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
                          Image.asset('assets/images/greeedydog.jpeg',height: 90),
                          Container(
                              height: 45,
                              width: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.orange[100]
                              ),
                              child: Center(child: Text('GreedyDog',style: TextStyle(color: Colors.black,fontFamily: "arlrdbd",fontSize: 18),))),
                        ]
                    ),
                  ),
                ),
                InkWell(
                  splashColor: Colors.orange[100],
                  onTap: (){
                    flutterTts.speak('Thirsty Crow');
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> ThirstyCros()));
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
                          Image.asset('assets/images/thirstyCrow.png',height: 90,),
                          Container(
                              height: 45,
                              width: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.orange[100]
                              ),
                              child: Center(child: Text('Thirsty Crow',style: TextStyle(color: Colors.black,fontFamily: "arlrdbd",fontSize: 18),))),                          ]
                    ),
                  ),
                ),
                InkWell(
                  splashColor: Colors.orange[100],
                  onTap: (){
                    flutterTts.speak('Greedy Dog');
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>GreedyDo()));
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
                          Image.asset('assets/images/greeedydog.jpeg',height: 90),
                          Container(
                              height: 45,
                              width: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.orange[100]
                              ),
                              child: Center(child: Text('GreedyDog',style: TextStyle(color: Colors.black,fontFamily: "arlrdbd",fontSize: 18),))),
                        ]
                    ),
                  ),
                ),
                InkWell(
                  splashColor: Colors.orange[100],
                  onTap: (){
                    flutterTts.speak('Thirsty Crow');
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> ThirstyCros()));
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
                          Image.asset('assets/images/thirstyCrow.png',height: 90,),
                          Container(
                              height: 45,
                              width: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.orange[100]
                              ),
                              child: Center(child: Text('Thirsty Crow',style: TextStyle(color: Colors.black,fontFamily: "arlrdbd",fontSize: 18),))),                          ]
                    ),
                  ),
                ),
                InkWell(
                  splashColor: Colors.orange[100],
                  onTap: (){
                    flutterTts.speak('Greedy Dog');
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>GreedyDo()));
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
                          Image.asset('assets/images/greeedydog.jpeg',height: 90),
                          Container(
                              height: 45,
                              width: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.orange[100]
                              ),
                              child: Center(child: Text('GreedyDog',style: TextStyle(color: Colors.black,fontFamily: "arlrdbd",fontSize: 18),))),
                        ]
                    ),
                  ),
                ),
                InkWell(
                  splashColor: Colors.orange[100],
                  onTap: (){
                    flutterTts.speak('Thirsty Crow');
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> ThirstyCros()));
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
                          Image.asset('assets/images/thirstyCrow.png',height: 90,),
                          Container(
                              height: 45,
                              width: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.orange[100]
                              ),
                              child: Center(child: Text('Thirsty Crow',style: TextStyle(color: Colors.black,fontFamily: "arlrdbd",fontSize: 18),))),                          ]
                    ),
                  ),
                ),
                InkWell(
                  splashColor: Colors.orange[100],
                  onTap: (){
                    flutterTts.speak('Greedy Dog');
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>GreedyDo()));
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
                          Image.asset('assets/images/greeedydog.jpeg',height: 90),
                          Container(
                              height: 45,
                              width: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.orange[100]
                              ),
                              child: Center(child: Text('GreedyDog',style: TextStyle(color: Colors.black,fontFamily: "arlrdbd",fontSize: 18),))),
                        ]
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
