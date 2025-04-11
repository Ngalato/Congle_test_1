import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Padding(
        padding: EdgeInsets.all(32.0),
        child: SquareAnimation(),
      ),
    );
  }
}

class SquareAnimation extends StatefulWidget {
  const SquareAnimation({super.key});

  @override
  State<SquareAnimation> createState() {
    return SquareAnimationState();
  }
}

class SquareAnimationState extends State<SquareAnimation> {
  Alignment _alignment = Alignment.center;
  final double _squareSize = 50.0;

  @override
  Widget build(BuildContext context) {
    bool _isAnimating = false; // Add this to your State class
    return Column(
      children: [
        AnimatedContainer(
          duration: Duration(seconds: 1),
          alignment: _alignment,
          onEnd: () {
        setState(() {
          _isAnimating = false; // Animation done, re-enable buttons
        });
      },
          child: Container(
            width: _squareSize,
            height: _squareSize,
            decoration: BoxDecoration(
              color: Colors.red,
              border: Border.all(),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            ElevatedButton(
              onPressed:_isAnimating
              ? null
              : () {
                setState(() {
                  _alignment = _alignment == Alignment.centerLeft
                      ? Alignment.center
                      : Alignment.centerLeft;
                       _isAnimating = true;
                });
              },
              child: const Text('Left'),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed:_isAnimating
              ? null
              : () {
                setState(() {
                  _alignment = _alignment == Alignment.centerRight
                      ? Alignment.center
                      : Alignment.centerRight;
                      _isAnimating = true;
                });
              },
              child: const Text('Right'),
            ),
          ],
        ),
      ],
    );
  }
}
