import 'package:bmi/result_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isMale = true;
  int weight = 80;
  var height = 150.0;
  int age = 15;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      // ignore: prefer_const_constructors
      body: SafeArea(
        child: Center(
            child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Row(
                  children: [
                    GenderBox('male'),
                    const SizedBox(
                      width: 8,
                    ),
                    GenderBox('female'),
                  ],
                ),
              ),
            ),
            HeightBox(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Row(
                  children: [
                    ProperityBox('weight'),
                    const SizedBox(
                      width: 8,
                    ),
                    ProperityBox('age'),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 8),
              child: Container(
                height: MediaQuery.of(context).size.height / 10,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextButton(
                  child: const Text(
                    'Calculate',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 45,
                        fontWeight: FontWeight.w800),
                  ),
                  onPressed: () {
                    double result = weight /((height/100) *(height/100))  ;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              // ignore: prefer_const_constructors
                              Result(result: result, isMale: isMale, age: age),
                        ));
                  },
                ),
              ),
            )
          ],
        )),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Expanded GenderBox(String type) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            type == 'male' ? isMale = true : isMale = false;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: (isMale && type == 'male') || (!isMale && type == 'female')
                ? Colors.teal
                : Colors.blueGrey,
          ),
          child: Column(
            children: [
              // ignore: prefer_const_constructors
              Icon(type == 'male' ? Icons.male : Icons.female, size: 90),
              // ignore: prefer_const_constructors
              SizedBox(
                height: 15,
              ),
              Text(
                type == 'male' ? 'Male' : 'Female',
                style: Theme.of(context).textTheme.headline1,
              )
            ],
          ),
        ),
      ),
    );
  }

  ////////////////////////////////////////////////
  // ignore: non_constant_identifier_names
  Expanded ProperityBox(String type) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.blueGrey,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ignore: prefer_const_constructors

            // ignore: prefer_const_constructors

            Text(
              type == 'weight' ? 'Weight' : 'Age',
              style: Theme.of(context).textTheme.headline1,
            ),
            Text(
              type == 'weight' ? '$weight' : '$age',
              style: Theme.of(context).textTheme.headline2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      type == 'age' ? age-- : weight--;
                    });
                  },
                  heroTag: type == 'age' ? 'age--' : 'weight--',
                  child: const Icon(Icons.minimize),
                  mini: true,
                ),
                const SizedBox(width: 5),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      type == 'age' ? age++ : weight++;
                    });
                  },
                  heroTag: type == 'age' ? 'age++' : 'weight++',
                  child: const Icon(Icons.add),
                  mini: true,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  //////////////////////
  // ignore: non_constant_identifier_names
  Expanded HeightBox() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.blueGrey,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ignore: prefer_const_constructors

            // ignore: prefer_const_constructors

            Text(
              'Height',
              style: Theme.of(context).textTheme.headline1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  height.toStringAsFixed(1),
                  style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w800,
                      color: Colors.white),
                ),
                Text(
                  'CM',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
            Slider(
              min: 20,
              max: 400,
              value: height,
              onChanged: (newVal) {
                setState(() {
                  height = newVal;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
