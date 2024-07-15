import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Animated Container')),
        body: AnimatedContainerExample(), //change ass per animation class
      ),
    );
  }
}

class AnimatedContainerExample extends StatefulWidget {
  @override
  _AnimatedContainerExampleState createState() => _AnimatedContainerExampleState();
}
class _AnimatedContainerExampleState extends State<AnimatedContainerExample> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _isExpanded = !_isExpanded;
          });
        },
        child: AnimatedContainer(
          width: _isExpanded ? 300 : 100,
          height: _isExpanded ? 300 : 100,
          color: _isExpanded ? Colors.blue : Colors.yellow,
          alignment: _isExpanded ? Alignment.center : AlignmentDirectional.center,
          duration: Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          child: FlutterLogo(size: 75),
        ),
      ),
    );
  }
}



class AnimatedBuilderExample extends StatefulWidget {
  @override
  _AnimatedBuilderExampleState createState() => _AnimatedBuilderExampleState();
}
class _AnimatedBuilderExampleState extends State<AnimatedBuilderExample> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0, end: 2 * 3.14159).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _animation,
        child: Container(
          width: 100,
          height: 100,
          color: Colors.blue,
        ),
        builder: (context, child) {
          return Transform.rotate(
            angle: _animation.value,
            child: child,
          );
        },
      ),
    );
  }
}



class AnimatedPositionedExample extends StatefulWidget {
  @override
  _AnimatedPositionedExampleState createState() => _AnimatedPositionedExampleState();
}
class _AnimatedPositionedExampleState extends State<AnimatedPositionedExample> {
  bool _isMoved = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedPositioned(
          duration: Duration(seconds: 1),
          left: _isMoved ? 250 : 50,
          top: _isMoved ? 450 : 50,
          child: GestureDetector(
            onTap: () {
              setState(() {
                _isMoved = !_isMoved;
              });
            },
            child: Container(
              width: 100,
              height: 100,
              color: Colors.green,
            ),
          ),
        ),
      ],
    );
  }
}



class AnimatedOpacityExample extends StatefulWidget {
  @override
  _AnimatedOpacityExampleState createState() => _AnimatedOpacityExampleState();
}
class _AnimatedOpacityExampleState extends State<AnimatedOpacityExample> {
  double _opacity = 1.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedOpacity(
            opacity: _opacity,
            duration: Duration(seconds: 1),
            child: Container(
              width: 100,
              height: 100,
              color: Colors.orange,
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _opacity = _opacity == 1.0 ? 0.0 : 1.0;
              });
            },
            child: Text('Toggle Opacity'),
          ),
        ],
      ),
    );
  }
}



class TweenAnimationBuilderExample extends StatefulWidget {
  @override
  _TweenAnimationBuilderExampleState createState() => _TweenAnimationBuilderExampleState();
}
class _TweenAnimationBuilderExampleState extends State<TweenAnimationBuilderExample> {
  bool _isAnimating = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _isAnimating = !_isAnimating;
          });
        },
        child: TweenAnimationBuilder(
          tween: Tween<Alignment>(
            begin: Alignment.topLeft,
            end: _isAnimating ? Alignment.bottomRight : Alignment.topLeft,
          ),
          duration: Duration(seconds: 4),
          curve: Curves.easeInOut,
          builder: (context, Alignment alignment, child) {
            return Align(
              alignment: alignment,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.purple,
              ),
            );
          },
        ),
      ),
    );
  }
}


