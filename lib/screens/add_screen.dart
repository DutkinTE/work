import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:work/data/var.dart';
import 'package:work/widgets/stars_background_widget.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  TextEditingController radiusController = TextEditingController();
  TextEditingController remotenessController = TextEditingController();
  TextEditingController speedController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  Color currentColor = Colors.black;
  @override
  void dispose() {
    radiusController.dispose();
    remotenessController.dispose();
    speedController.dispose();
    colorController.dispose();

    super.dispose();
  }

  Future<void> add() async {
    setState(() {
      final isValid = formKey.currentState!.validate();
      if (!isValid) return;
      maxNumberOfPlanets++;
      colors.add(currentColor);
      speeds.add(double.parse(speedController.text));
      radius.add(double.parse(radiusController.text));
      remoteness.add(double.parse(remotenessController.text));
      Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(elevation: 0, backgroundColor: Colors.transparent),
        backgroundColor: Colors.black,
        body: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              color: Colors.black,
            ),
            StarsBackground(),
            Form(
              key: formKey,
              child: ListView(
                padding: const EdgeInsets.only(right: 20, left: 20),
                children: [
                  const Text(
                    'Radius',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    maxLength: 1,
                    controller: radiusController,
                    validator: (value) =>
                        (value!.isEmpty || double.parse(radiusController.text) <= 0) ? 'Enter radius' : null,
                    keyboardType: TextInputType.number,
                    autocorrect: false,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Remoteness',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: remotenessController,
                    validator: (value) => (value!.isEmpty ||
                            (double.parse(remotenessController.text) >
                                MediaQuery.of(context).size.width / 2 - 40) || double.parse(remotenessController.text) <= 0)
                        ? 'Enter remoteness and <=${MediaQuery.of(context).size.width / 2 - 40}'
                        : null,
                    keyboardType: TextInputType.number,
                    autocorrect: false,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Speed',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    maxLength: 3,
                    controller: speedController,
                    keyboardType: TextInputType.number,
                    validator: (value) =>
                        (value!.isEmpty || double.parse(speedController.text) <= 0) ? 'Enter speed' : null,
                    autocorrect: false,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('Color',
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: colorController,
                    validator: (value) =>
                        (value!.isEmpty ) ? 'Enter color' : null,
                    onTap: () {
                      Color pickerColor = const Color(0xff443a49);

                      void changeColor(Color color) {
                        setState(() => pickerColor = color);
                      }

                      showDialog(
                        builder: (context) => AlertDialog(
                          title: const Text('Pick a color!'),
                          content: SingleChildScrollView(
                            child: ColorPicker(
                              pickerColor: pickerColor,
                              onColorChanged: changeColor,
                            ),
                          ),
                          actions: <Widget>[
                            ElevatedButton(
                              child: const Text('Got it'),
                              onPressed: () {
                                setState(() {
                                  currentColor = pickerColor;
                                  colorController.text =
                                      currentColor.toString();
                                });
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                        context: context,
                      );
                    },
                    keyboardType: TextInputType.text,
                    autocorrect: false,
                    style: TextStyle(color: currentColor),
                    decoration: InputDecoration(
                      icon: const Icon(
                        Icons.color_lens,
                        color: Colors.white,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      elevation: MaterialStateProperty.all(0),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                    onPressed: add,
                    child: const SizedBox(
                        height: 56,
                        child: Center(
                            child: Text(
                          'Add',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ))),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
