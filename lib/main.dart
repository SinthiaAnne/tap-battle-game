import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const TapBattleApp(),
    );
  }
}

class TapBattleApp extends StatefulWidget {
  const TapBattleApp({Key? key});

  @override
  State<TapBattleApp> createState() => _TapBattleAppState();
}

class _TapBattleAppState extends State<TapBattleApp> {
  double containerHeight = 0.5; 
  int tapCount1 = 0; 
  int tapCount2 = 0; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Container(
        color: Colors.amber,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  containerHeight += 0.05;
                  if (containerHeight > 1.0) containerHeight = 1.0;
                  tapCount1++; 
                });
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                height: MediaQuery.of(context).size.height * containerHeight,
                color: Colors.red,
                
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  containerHeight -= 0.05;
                  if (containerHeight < 0.0) containerHeight = 0.0;
                  tapCount2++; 
                });
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                height: MediaQuery.of(context).size.height * (1 - containerHeight),
                color: Colors.blue,
               
              ),
            )
          ],
        ),
      ),
    );
  }
}

