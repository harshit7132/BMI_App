import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController wtControlller = TextEditingController();
  TextEditingController ftControlller = TextEditingController();
  TextEditingController inControlller = TextEditingController();

  var result = "";
  var lol = '';
  double result1 = 0.0;
  var bgColor = Colors.indigo.shade100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor,
        body: Center(
          child: SingleChildScrollView(
            child: Container(
                width: 400,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('BMI',
                        style:
                            TextStyle(fontSize: 30, fontWeight: FontWeight.w400)),
                    SizedBox(height: 20),
                    TextField(
                        controller: wtControlller,
                        decoration: InputDecoration(
                            label: Text('Enter Your Weight(In KG`s)'),
                            prefixIcon: Icon(Icons.line_style))),
                    TextField(
                        controller: ftControlller,
                        decoration: InputDecoration(
                            label: Text('Enter Your Height(In Feet)'),
                            prefixIcon: Icon(Icons.line_style))),
                    TextField(
                        controller: inControlller,
                        decoration: InputDecoration(
                            label: Text('Enter Your Height(In Inch)'),
                            prefixIcon: Icon(Icons.line_style))),
                    SizedBox(height: 40),
                    ElevatedButton(
                        onPressed: () {
                          var wt = wtControlller.text.toString();
                          var ft = ftControlller.text.toString();
                          var inch = inControlller.text.toString();

                          if (wt != "" && ft != "" && inch != "") {
                            //BMI Calculator
                            var iWt = double.parse(wt);
                            var iFt = double.parse(ft);
                            var iInch = double.parse(inch);

                            var tInch = (iFt * 12) + iInch;
                            var tCm = tInch * 2.54;
                            var tM = tCm / 100;
                            var bmi = iWt / (tM * tM);
                            var msg = "";

                            if (bmi > 25) {
                              msg = "You are underWeight!!";
                              bgColor = Colors.orange.shade200;
                            } else if (bmi < 10) {
                              msg = "You are overWeight!!";
                              bgColor = Colors.red.shade300;
                            } else {
                              msg = "You are Healthy!!";
                              bgColor = Colors.green;
                            }

                            setState(() {
                              result =
                                  "$msg\n\n Your BMI is ${bmi.toStringAsFixed(2)}";
                            });
                          } else {
                            setState(() {
                              result = "Please fill all fields";
                            });
                          }
                        },
                        child: Text('Calculate')),
                    Text(result, style: TextStyle(fontSize: 15)),
                    SizedBox(height: 50),
                    Text('Convert Feet into Inch',
                        style: TextStyle(fontSize: 25)),
                    SizedBox(height: 20),
                    TextField(
                        controller: ftControlller,
                        decoration: InputDecoration(
                            label: Text('Enter Your Height(In Inch)'),
                            prefixIcon: Icon(Icons.line_style))),
                    SizedBox(height: 20),
                    ElevatedButton(
                        onPressed: () {
                          lol = ftControlller.text.toString();
                          var lol1 = double.parse(lol);
                          setState(() {
                            result1 = lol1 *12;
                          });
                        },
                        child: Text('calculate')),
                    SizedBox(height: 30),
                    Text('${result1.toString()} is in Inches')
                  ],
                )),
          ),
        ));
  }
}
