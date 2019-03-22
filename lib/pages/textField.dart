import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ageController = TextEditingController();
  final feetController = TextEditingController();
  final weightController = TextEditingController();
  double bmi = 0;

  void calculate() {
    int age = int.parse(ageController.text);
    int feet = int.parse(feetController.text);
    int weight = int.parse(weightController.text);

    setState(() {
      bmi = int.parse(ageController.text) *
          int.parse(feetController.text) /
          int.parse(weightController.text);
    });
  }

  @override
  void dispose() {
    ageController.dispose();
    feetController.dispose();
    weightController.dispose();

    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI"),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.asset(
              "images/bmilogo.png",
              width: 100.0,
            ),
            Column(
              children: <Widget>[
                textField("Age", Icon(Icons.person_outline), ageController),
                textField(
                    "Height in feet", Icon(Icons.graphic_eq), feetController),
                textField(
                    "Weight in lib", Icon(Icons.line_weight), weightController),
                RaisedButton(
                  onPressed: calculate,
                  child: Text(
                    "계산하기",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.pinkAccent,
                ),
                Text("$bmi")
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget textField(
      String hintText, Widget icon, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(hintText: hintText, icon: icon),
        keyboardType: TextInputType.number,
      ),
    );
  }
}
