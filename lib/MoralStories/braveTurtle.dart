import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:kids/MoralStories/greedyDog_story.dart';
import 'package:kids/MoralStories/magicalseed.dart';
import 'package:kids/MoralStories/thirstycrow_story.dart';
import 'package:kids/utils/model.dart';

class BraveTurtle extends StatefulWidget {

  @override
  State<BraveTurtle> createState() => _BraveTurtleState();
}

class _BraveTurtleState extends State<BraveTurtle> with TickerProviderStateMixin {
  final FlutterTts flutterTts = FlutterTts();

  bool isPressed = false;
  MoralStory braveTutle = MoralStory(
      'Tommy, a tiny turtle, was afraid of water. One day, when a fire broke out in the forest, he overcame his fear and carried drops of water on his shell to put out the flames. The other animals admired his bravery, and Tommy realized that sometimes, facing our fears can lead to extraordinary acts of courage.');

  List<String> captions = [];
  late AnimationController _animationController;
  int currentCaptionIndex = 10;

  @override
  void initState() {
    super.initState();
    generateCaptions();
    // speakStory();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 16500),
    )..addListener(() {
      setState(() {
        // Update the currentCaptionIndex based on the animation value
        currentCaptionIndex =
            (_animationController.value * captions.length).toInt();
      });
    });
  }

  speakStory() async {
    await flutterTts.speak(braveTutle.moralstory);
    _animationController.forward(
        from: 0.0); // Reset animation when speaking is finished
  }

  generateCaptions() {
    // Split the story into sentences and add them as captions
    captions = braveTutle.moralstory.split('. ');
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
              'Brave Little Turtle',
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
                  'assets/images/littleturtle.jpeg',
                  height: 200,
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
                                Navigator.push(context, CupertinoPageRoute(builder: (ctx) => MagicalSeed()));
                              },
                              child: Image(
                                image: AssetImage('assets/images/11MaskGroup5.png'),
                              ),
                            ),
                            leading: InkWell(
                              onTap:  () {
                                Navigator.of(context).push(CupertinoPageRoute(builder: (ctx) => ThirstyCros()));
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
