import 'package:flutter/material.dart';
import 'package:rev/quiz.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Quiz q = Quiz();
  List<Icon> score = [];
  int total = 0;
  void checka(bool usera, BuildContext context) {
    bool correcta = q.geta();

    setState(() {
      if (usera == correcta) {
        score.add(const Icon(
          Icons.check,
          color: Colors.green,
        ));
        total++;
      } else {
        score.add(const Icon(
          Icons.close,
          color: Color.fromARGB(255, 197, 66, 0),
        ));
      }
    });

    if (q.isfinished()) {
      Future.delayed(const Duration(milliseconds: 100), () {
        Alert(
          context: context,
          title: "Finished",
          desc: "You had $total",
       // image : Image.network(src)

        ).show();
        q.reset();
        total = 0;
        setState(() {
          score = [];
        });
      });
    } else {
      q.next();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 213, 224, 231),
          body: Builder(
            builder: (BuildContext newContext) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            q.getq(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 32),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 31, 173, 55),
                        ),
                        onPressed: () {
                          checka(true, newContext);
                        },
                        child: const Text(
                          "        True        ",
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 251, 77, 3),
                        ),
                        onPressed: () {
                          checka(false, newContext);
                        },
                        child: const Text(
                          "       False       ",
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                      ),
                    ),
                    SizedBox(height: 100, child: Row(children: score)),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
