import 'package:flutter/material.dart';

class FadeIn extends StatefulWidget {
  const FadeIn({super.key, this.time = 600, required this.child});
  final int time;
  final Widget child;

  @override
  State<FadeIn> createState() => _FadeInState();
}

class _FadeInState extends State<FadeIn> {
  bool _visbility = false;
  void increaseOpacity() {
    _visbility = true;
  }

  @override
  void initState() {
    increaseOpacity();
    super.initState();
  }

  @override
  void dispose() {
    _visbility = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _visbility ? 1 : 0,
      duration: Duration(milliseconds: widget.time),
      child: widget.child,
    );
  }
}
