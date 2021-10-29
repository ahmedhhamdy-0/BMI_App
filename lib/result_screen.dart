// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final double result;
  final bool isMale;
  final int age;

  const Result(
      {Key? key, required this.result, required this.isMale, required this.age})
      : super(key: key);
  // ignore: non_constant_identifier_names
  String get ResultPhrase
  {
    // ignore: non_constant_identifier_names
    String TextPhrase='';
    if(result>=30 ){TextPhrase='Obese';}
    else if(result>25&&result<30){TextPhrase='OverWeight';}
    else if(result>18.5&&result<=29.9){TextPhrase='Normal';}
    else{TextPhrase='Thin';}
    return TextPhrase;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Result"),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Gender:${isMale ? 'Male' : 'Female'}',

                style:Theme.of(context).textTheme.headline2,
              ),
              Text(
                'Result:${result.toStringAsFixed(2)}',
                style:Theme.of(context).textTheme.headline2

              ),
              Text(
                'HealthNess:$ResultPhrase',
                  style:Theme.of(context).textTheme.headline2,
                  textAlign: TextAlign.center,
              ),
              Text(
                'Age:$age',
                  style:Theme.of(context).textTheme.headline2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
