import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:kids/MoralStories/braveTurtle.dart';
import 'package:kids/MoralStories/thelostkitten.dart';
import 'package:kids/MoralStories/thirstycrow_story.dart';

import '../utils/model.dart';

class GreedyDo extends StatefulWidget {
  @override
  State<GreedyDo> createState() => _GreedyDoState();
}

class _GreedyDoState extends State<GreedyDo> with TickerProviderStateMixin{
  final FlutterTts flutterTts = FlutterTts();
  MoralStory greddyDogStory = MoralStory('In a quiet village, there lived a dog known for its insatiable greed. One day, while carrying a bone in its mouth, the dog crossed a bridge over a river. As the dog looked down into the water, it saw its reflection and mistook it for another dog with a bigger bone Driven by greed, the dog barked at its own reflection, hoping to scare away the other dog and claim the larger bone. In the process, the bone in the dog\'s mouth fell into the river, lost forever. The dog realized its mistake but it was too late. The moral of the story is that greed can lead to loss, and one should be content with what they have.');

  List<String> captions = [];
  late AnimationController _animationController;
  int currentCaptionIndex = 10;

  @override
  void initState() {
    super.initState();
    generateCaptions();
    speakStory();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 30500),
    )..addListener(() {
      setState(() {
        // Update the currentCaptionIndex based on the animation value
        currentCaptionIndex =
            (_animationController.value * captions.length).toInt();
      });
    });
  }

  speakStory() async {
    await flutterTts.speak(greddyDogStory.moralstory);
    _animationController.forward(
        from: 0.0); // Reset animation when speaking is finished
  }

  generateCaptions() {
    // Split the story into sentences and add them as captions
    captions = greddyDogStory.moralstory.split('. ');
  }

  @override
  void dispose() {
    flutterTts.stop(); // Stop TTS when the screen is disposed
    _animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        flutterTts.stop();
        _animationController.stop();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          backgroundColor: Color(0xFFFEF7F0),
          elevation: 0,
          title: Center(
            child: Text(
              'Thirsty Crow',
              style: TextStyle(color: Colors.black, fontFamily: "arlrdbd"),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/greeedydog.jpeg',
                  height: 150,
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    final String currentCaption =
                    currentCaptionIndex < captions.length
                        ? captions[currentCaptionIndex]
                        : '';
                    return RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontFamily: "arlrdbd"),
                        children: <TextSpan>[
                          TextSpan(
                            text: currentCaption.substring(
                                0,
                                (_animationController.value * currentCaption.length)
                                    .toInt()),
                          ),
                          TextSpan(
                            text: currentCaption.substring(
                                (_animationController.value * currentCaption.length)
                                    .toInt()),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 18.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                          onTap: () {
                            if (_animationController.isAnimating) {
                              flutterTts.stop();
                              _animationController.stop();
                            } else {
                              speakStory();
                            }
                          },
                          child: Image.asset(_animationController.isAnimating
                              ? 'assets/images/11MaskGroup3.png'
                              : 'assets/images/11MaskGroup3.png')),
                      Center(
                          child: ListTile(
                            trailing: InkWell(
                              onTap: () {
                                Navigator.push(context, CupertinoPageRoute(builder: (ctx) => ThirstyCros()));
                              },
                              child: Image(
                                image: AssetImage('assets/images/11MaskGroup5.png'),
                              ),
                            ),
                            leading: InkWell(
                              onTap:  () {
                                Navigator.of(context).push(CupertinoPageRoute(builder: (ctx) => TheLostKitten()));
                              },
                              child: Image(
                                image: AssetImage('assets/images/11MaskGroup4.png'),
                              ),
                            ),
                          )),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
