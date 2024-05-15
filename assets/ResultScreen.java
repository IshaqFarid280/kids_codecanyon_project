class ResultScreen extends StatefulWidget {
  final int score;

  ResultScreen(this.score);

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen>
    with SingleTickerProviderStateMixin {
  String _congratulationsMessage = "Congratulations";
  late AnimationController _controller;
  late Animation<double> _animation;
  late Widget _resultImage;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    _animation = Tween<double>(begin: -100.0, end: 300.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    )..addListener(() {
        setState(() {});
      });
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
      _resultImage = Image.asset(
        'assets/star.png',
        width: 50,
        height: 50,
      );
      _controller.forward();
    } else if (widget.score >= 5) {
      _congratulationsMessage = "Congratulations, you got an average score! 😀";
      _resultImage = Image.asset(
        'assets/smile.png',
        width: 50,
        height: 50,
      );
      _controller.forward();
    } else {
      _congratulationsMessage = "You need to work harder ! 💪";
      _resultImage = Image.asset(
        'assets/sad.png',
        width: 50,
        height: 50,
      );
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
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
          Positioned(
            top: _animation.value,
            child: _resultImage,
          ),
        ],
      ),
    );
  }
}