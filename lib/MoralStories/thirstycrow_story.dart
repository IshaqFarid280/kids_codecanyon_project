import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:kids/utils/model.dart';

class ThirstyCros extends StatefulWidget {
  @override
  State<ThirstyCros> createState() => _ThirstyCrosState();
}

class _ThirstyCrosState extends State<ThirstyCros> with TickerProviderStateMixin {
  final FlutterTts flutterTts = FlutterTts();
  MoralStory thirstyCrowStory = MoralStory('Once upon a scorching summer day, a clever crow felt the pangs of thirst. The crow searched high and low for water but found only dry, barren land. Desperate, the crow noticed a pitcher with a small amount of water at the bottom. However, the water level was too low for the crow to reach. Undeterred, the intelligent crow had an idea. It started picking up small pebbles and dropping them into the pitcher, one by one. The water level gradually rose, and the clever crow quenched its thirst. The moral of the story is that ingenuity and resourcefulness can help overcome even the most challenging situations.');

  List<String> captions = [];
  late AnimationController _animationController;
  int currentCaptionIndex = 0;

  @override
  void initState() {
    super.initState();
    generateCaptions();
    speakStory();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 29500),
    )..forward();
  }

  speakStory() async {
    await flutterTts.speak(thirstyCrowStory.moralstory);
    _animationController.forward(from: 0.0); // Reset animation when speaking is finished
  }

  generateCaptions() {
    // Use the entire story as a single caption
    captions = [thirstyCrowStory.moralstory];
  }

  @override
  void dispose() {
    flutterTts.stop(); // Stop TTS when the screen is disposed
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Image.asset('assets/images/thirstyCrow.png', height: 150,),
            SizedBox(height: 20),
            AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                final String currentCaption = currentCaptionIndex < captions.length ? captions[currentCaptionIndex] : '';
                return RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(fontSize: 18, color: Colors.black, fontFamily: "arlrdbd"),
                    children: <TextSpan>[
                      TextSpan(
                        text: currentCaption.substring(0, (_animationController.value * currentCaption.length).toInt()),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: currentCaption.substring((_animationController.value * currentCaption.length).toInt()),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
