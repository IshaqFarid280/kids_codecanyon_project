import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';



class VideoScreen extends StatefulWidget {
  final String vedioPath ;
  final String name ;

  VideoScreen({required this.vedioPath,required this.name});


  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.vedioPath);
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true); // To loop the video
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Color(0xFFFEF7F0),
        title: Center(child: Text(' Learning about ${widget.name.toUpperCase()}',style: TextStyle(color: Color(0xFF000000),fontFamily: "arlrdbd"),)),
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            if (_controller.value.isPlaying) {
              _controller.pause();
              _isPlaying = false;
            } else {
              _controller.play();
              _isPlaying = true;
            }
          });
        },
        onDoubleTap: () {
          final position = _controller.value.position;
          final width = MediaQuery
              .of(context)
              .size
              .width;
          final tapX = width / 2;
          if (position > Duration(seconds: 10)) {
            // Check if tap is on the left side and video position is not at the beginning
            if (tapX > 0 && tapX < width / 2) {
              // Left side double tap
              _controller.seekTo(position - Duration(seconds: 10));
            } else {
              // Right side double tap
              _controller.seekTo(position + Duration(seconds: 10));
            }
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  FutureBuilder(
                    future: _initializeVideoPlayerFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return Container(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          height: MediaQuery.sizeOf(context).height * 0.4,
                          width: MediaQuery.sizeOf(context).width * 0.95,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: AspectRatio(
                            aspectRatio: _controller.value.aspectRatio,
                            child:  VideoPlayer(_controller),
                          ),
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                  VideoProgressIndicator(
                    _controller,
                    allowScrubbing: true,
                    padding: EdgeInsets.only(left: 20,right: 20,bottom: 10),
                    colors: VideoProgressColors(
                        playedColor: Colors.orange,
                        backgroundColor: Colors.white,
                        bufferedColor: Colors.yellowAccent
                    ),
                  ),
                ],
              ),
              IconButton(onPressed: (){
                setState(() {
                  if (_controller.value.isPlaying) {
                    _controller.pause();
                    _isPlaying = false;
                  } else {
                    _controller.play();
                    _isPlaying = true;
                  }
                });
              }, icon: _isPlaying == true ? Icon(Icons.pause_circle_filled,size: 50,) : Icon(Icons.play_circle,size: 50,),)
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
