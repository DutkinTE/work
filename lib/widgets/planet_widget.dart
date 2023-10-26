import 'package:flutter/material.dart';
import 'package:work/data/var.dart';

class PlanetWidget extends StatefulWidget {
  final double initialRadius;
  final int index;

  const PlanetWidget({
    Key? key,
    required this.initialRadius,
    required this.index,
  }) : super(key: key);

  @override
  _PlanetWidgetState createState() => _PlanetWidgetState();
}

class _PlanetWidgetState extends State<PlanetWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
          milliseconds: (2000 - speeds[widget.index]).toInt()),
    );
    animation = Tween<double>(begin: 0, end: 1).animate(_controller);

    _controller.addListener(() {
      /*if(_controller.status == AnimationStatus.completed){
        _controller.re
      }*/
    });

    _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: animation,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) => Transform.translate(
          offset: Offset(0.0, widget.initialRadius),
          child: Container(
            width: radius[widget.index] + 10,
            height: radius[widget.index] + 10,
            decoration: BoxDecoration(
              color: colors[widget.index],
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
