import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: homePage(),
    );
  }
}

class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  List<DropdownMenuItem<String>> menuitems = List();
  String value = "";
  final web = {"1": "python", "2": "c#", "3": "Sql"};
  final app = {"1": "Flutter", "2": "Kotlin", "3": "java"};
  final desktop = {"1": "javaFx", "2": "Electron", "3": "Node"};
  bool disabledropdown = true;

  void populateweb() {
    for (String key in web.keys) {
      menuitems.add(
        DropdownMenuItem<String>(
          value: web[key],
          child: Center(
            child: Text(web[key]),
          ),
        ),
      );
    }
  }

  void populateapp() {
    for (String key in app.keys) {
      menuitems.add(
        DropdownMenuItem<String>(
          value: app[key],
          child: Center(
            child: Text(app[key]),
          ),
        ),
      );
    }
  }

  void populatedesktop() {
    for (String key in desktop.keys) {
      menuitems.add(
        DropdownMenuItem<String>(
          value: desktop[key],
          child: Center(
            child: Text(desktop[key]),
          ),
        ),
      );
    }
  }

  void valuechanged(_value) {
    if (_value == "Web") {
      menuitems = [];
      populateweb();
    } else if (_value == "App") {
      menuitems = [];
      populateapp();
    } else if (_value == "Desktop") {
      menuitems = [];
      populatedesktop();
    }
    setState(() {
      value = _value;
      disabledropdown = false;
    });
  }

  void secondvaluechanged(_value) {
    setState(() {
      value = _value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        centerTitle: true,
        title: Text('Dropdrown'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: DropdownButton<String>(
                dropdownColor: Colors.grey,
                items: [
                  DropdownMenuItem<String>(
                    value: "Web",
                    child: Center(
                      child: Text('Web'),
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "App",
                    child: Center(
                      child: Text('App'),
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "Desktop",
                    child: Center(
                      child: Text('Desktop'),
                    ),
                  ),
                ],
                onChanged: (_value) => valuechanged(_value),
                hint: Text('Select any Field'),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: DropdownButton<String>(
                dropdownColor: Colors.grey,
                items: menuitems,
                onChanged: disabledropdown
                    ? null
                    : (_value) => secondvaluechanged(_value),
                hint: Text('Select any Technology'),
                disabledHint: Text('First Select Any Field'),
              ),
            ),
            Center(
              child: Text('$value'),
            ),
          ],
        ),
      ),
    );
  }
}
