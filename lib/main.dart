// @dart=2.12
import 'package:flutter/material.dart';
import 'package:heatmap_calendar/heatmap_calendar.dart';
import 'package:heatmap_calendar/time_utils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Klio Cruises Counter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _history = 0;

  //
  // final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  // FirebaseFirestore firestore = FirebaseFirestore.instance;
  // final String documentId="";
  //
  //
  // @override
  // Widget build(BuildContext context) {
  //   CollectionReference users = FirebaseFirestore.instance.collection('users');
  //
  //   return FutureBuilder<DocumentSnapshot>(
  //     future: users.doc(documentId).get(),
  //     builder:
  //         (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
  //
  //       if (snapshot.hasError) {
  //         return Text("Something went wrong");
  //       }
  //
  //       if (snapshot.hasData && !snapshot.data!.exists) {
  //         return Text("Document does not exist");
  //       }
  //
  //       if (snapshot.connectionState == ConnectionState.done) {
  //         Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
  //         return Text("Full Name: ${data['full_name']} ${data['last_name']}");
  //       }
  //
  //       return Text("loading");
  //     },
  //   );
  // }


  void _incrementCounter() {
    setState(() {
      _history = _counter;
      _counter++;
    });
  }
  void _increment2Counter() {
    setState(() {
      _history = _counter;
      _counter+=2;
    });
  }
  void _increment3Counter() {
    setState(() {
      _history = _counter;
      _counter+=3;
    });
  }
  void _increment4Counter() {
    setState(() {
      _history = _counter;
      _counter+=4;
    });
  }
  void _increment5Counter() {
    setState(() {
      _history = _counter;
      _counter+=5;
    });
  }
  void _increment10Counter() {
    setState(() {
      _history = _counter;
      _counter+=10;
    });
  }
  void _decreaceCounter() {
    setState(() {
      _history = _counter;
      _counter--;
    });
  }
  void _resetCounter() {
    setState(() {
      _history = _counter;
      _counter = 0;
    });
  }
  void _undoCounter() {
    setState(() {
      _counter = _history;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/app_bg.jpg"),
                fit: BoxFit.cover)),
        child :Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.

          child: Column(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                'Currently on board:',
                style: Theme.of(context).accentTextTheme.headline5,
              ),
              Text(
                '$_counter',
                style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 2.0, color: Colors.redAccent),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.lightBlueAccent,
                    textStyle: TextStyle(fontSize: 30),
                    padding: EdgeInsets.symmetric(horizontal: 70, vertical: 10),
                ),
                onPressed: _incrementCounter,
                child: Text('+1'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.lightBlueAccent,
                    textStyle: TextStyle(fontSize: 30),
                    padding: EdgeInsets.symmetric(horizontal: 70, vertical: 10)
                ),
                onPressed: _increment2Counter,
                child: Text('+2'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.lightBlueAccent,
                    textStyle: TextStyle(fontSize: 30),
                    padding: EdgeInsets.symmetric(horizontal: 70, vertical: 10)
                ),
                onPressed: _increment3Counter,
                child: Text('+3'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.lightBlueAccent,
                    textStyle: TextStyle(fontSize: 30),
                    padding: EdgeInsets.symmetric(horizontal: 70, vertical: 10)
                ),
                onPressed: _increment4Counter,
                child: Text('+4'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.lightBlueAccent,
                          textStyle: TextStyle(fontSize: 30),
                          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10)
                      ),
                      onPressed: _increment5Counter,
                      child: Text('+5')),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.lightBlueAccent,
                          textStyle: TextStyle(fontSize: 30),
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10)
                      ),
                      onPressed: _increment10Counter,
                      child: Text('+10'))
                ],
              ),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.redAccent,
                    textStyle: TextStyle(fontSize: 25),
                    padding: EdgeInsets.symmetric(horizontal: 70, vertical: 10)
                ),
                onPressed: _decreaceCounter,
                child: Text('- 1'),
              ),
          Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.greenAccent,
                        textStyle: TextStyle(fontSize: 20),
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10)
                    ),
                    onPressed: _resetCounter,
                    child: Text('Reset'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.lightGreenAccent,
                        textStyle: TextStyle(fontSize: 20),
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10)
                    ),
                    onPressed: _undoCounter,
                    child: Text('Undo'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SecondRoute()),
          );
        },
        tooltip: 'Overview',
        child: Icon(Icons.add_chart),
      ),
    );
  }
}
class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Overview"),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage("images/app_bg.jpg"),
        fit: BoxFit.cover)),
        child :Center(
          child: HeatMapCalendar(
            input: {
              TimeUtils.removeTime(DateTime.now().subtract(Duration(days: 5))): 5,
              TimeUtils.removeTime(DateTime.now().subtract(Duration(days: 4))): 11,
              TimeUtils.removeTime(DateTime.now().subtract(Duration(days: 3))): 22,
              TimeUtils.removeTime(DateTime.now().subtract(Duration(days: 2))): 33,
              TimeUtils.removeTime(DateTime.now().subtract(Duration(days: 1))): 44,
              TimeUtils.removeTime(DateTime.now()): 55,
            },
            colorThresholds: {
              1: Colors.green,
              20: Colors.blue,
            },
            weekDaysLabels: ['M', 'T', 'W', 'T', 'F', 'S', 'S'],
            monthsLabels: [
              "",
              "Jan",
              "Feb",
              "Mar",
              "Apr",
              "May",
              "Jun",
              "Jul",
              "Aug",
              "Sep",
              "Oct",
              "Nov",
              "Dec",
            ],
            squareSize: 40.0,
            textOpacity: 1,
            labelTextColor: Colors.lightBlue,
            dayTextColor: Colors.blue[500],
          ),
        ),
      ),
    );
  }
}