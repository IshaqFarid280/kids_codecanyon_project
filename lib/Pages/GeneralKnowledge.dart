import 'dart:math';

import 'package:confetti/confetti.dart';
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
                                            ResultScreen(score)));
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






class ResultScreen extends StatefulWidget {
  final int score;

  ResultScreen(this.score);

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  String _congratulationsMessage = "Congratulations";
  late ConfettiController _controller;
  late String _resultImageAsset;

  @override
  void initState() {
    super.initState();
    _controller = ConfettiController(duration: const Duration(seconds: 5));
    _showScoreMessage();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _showScoreMessage() {
    if (widget.score >= 7) {
      _congratulationsMessage = "Congratulations, you passed! 🎉";
      _resultImageAsset = 'assets/start.png';
    } else if (widget.score >= 5) {
      _congratulationsMessage = "Congratulations, you got an average score! 😀";
      _resultImageAsset = 'assets/thumbs.png';
    } else {
      _congratulationsMessage = "You need to work harder ! 💪";
      _resultImageAsset = 'assets/cry.png';
    }
    _controller.play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ConfettiWidget(
            numberOfParticles: 20,
            emissionFrequency: 0.3,
            confettiController: _controller,
            blastDirectionality: BlastDirectionality.explosive,
            shouldLoop: true,
            colors: const [
              Colors.green,
              Colors.blue,
              Colors.pink,
              Colors.orange,
              Colors.purple,
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  _congratulationsMessage,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: "arlrdbd",
                    fontSize: 25.0,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Center(
                child: Text(
                  "Your Score is:",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "arlrdbd",
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              Center(
                child: Image.asset(
                  _resultImageAsset,
                  width: 200, // Adjust width as needed
                  height: 200, // Adjust height as needed
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Center(
                child: Text(
                  "${widget.score}",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "arlrdbd",
                    fontSize: 80.0,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}




