import 'package:flutter/material.dart';
import 'home_page.dart';

class EntryAnimationPage extends StatefulWidget {
  @override
  _EntryAnimationPageState createState() => _EntryAnimationPageState();
}

class _EntryAnimationPageState extends State<EntryAnimationPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  late List<Animation<Offset>> _letterAnimations;
  final String _text = "Loading...";

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);

    _letterAnimations = List.generate(_text.length, (index) {
      double start = index / _text.length;
      double end = (index + 1) / _text.length;
      return Tween<Offset>(
        begin: Offset(0, 2),
        end: Offset.zero,
      ).animate(CurvedAnimation(
        parent: _animationController,
        curve: Interval(start, end, curve: Curves.easeInOut),
      ));
    });

    _animationController.forward();

    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Container(
            color: Colors.red.withOpacity(_animation.value),
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: _text.characters.map((char) {
                  int index = _text.indexOf(char);
                  return SlideTransition(
                    position: _letterAnimations[index],
                    child: Text(
                      char,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}
