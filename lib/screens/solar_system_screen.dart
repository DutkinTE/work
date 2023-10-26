import 'package:flutter/material.dart';
import 'package:work/data/var.dart';
import 'package:work/widgets/ollus_circle_path.dart';
import 'package:work/widgets/planet_widget.dart';
import 'package:work/widgets/stars_background_widget.dart';

class MySolarSystem extends StatelessWidget {
  const MySolarSystem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/add');
        },
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        child: const Icon(Icons.add),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            color: Colors.black,
          ),
          StarsBackground(),
          CustomPaint(
            painter: OllusCirclePath(
              numberOfPlanets: maxNumberOfPlanets,
            ),
          ),
          Container(
            width: 35,
            height: 35,
            decoration: const BoxDecoration(
              color: Colors.amberAccent,
              shape: BoxShape.circle,
            ),
          ),
          ...planetsBuilder(),
        ],
      ),
    );
  }

  List<Widget> planetsBuilder() {
    final List<Widget> planetsList = [];

    for (int i = 0; i < maxNumberOfPlanets; i++) {
      double newRadius = remoteness[i];
      planetsList.add(PlanetWidget(
        initialRadius: newRadius + 27,
        index: i,
      ));
    }

    return planetsList;
  }
}