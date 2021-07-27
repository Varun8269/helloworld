import 'package:flutter/material.dart';
import 'homepage.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Login_page()));
}

class Login_page extends StatefulWidget {
  const Login_page({Key? key}) : super(key: key);

  @override
  _Login_pageState createState() => _Login_pageState();
}

class _Login_pageState extends State<Login_page> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController str_name = TextEditingController();
  TextEditingController str_password = TextEditingController();
  String name = '';
  String password = '';
  String checking = '';
  bool secure_text = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Login Page'),
        ),
        body: Center(
          child: Form(
            key: formkey,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 250,
                  ),
                ),
                SizedBox(
                  width: 400,
                  child: new TextFormField(
                    controller: str_name,
                    decoration: new InputDecoration(
                      labelText: 'Name',
                      hintText: 'Enter the name',
                      labelStyle: new TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                      border: new OutlineInputBorder(),
                    ),
                    maxLength: 11,
                    validator: (value) {
                      if (value.toString().isEmpty) return 'Required';
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 20,
                  ),
                ),
                SizedBox(
                  width: 400,
                  child: new TextFormField(
                    controller: str_password,
                    decoration: new InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter the password',
                      labelStyle: new TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              secure_text = !secure_text;
                            });
                          },
                          icon: Icon(secure_text
                              ? Icons.security
                              : Icons.remove_red_eye)),
                      border: new OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value.toString().isEmpty) return 'Required';
                    },
                    obscureText: secure_text,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 20,
                  ),
                ),
                RaisedButton(
                    color: Colors.blue,
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        setState(() {
                          name = str_name.text;
                          password = str_password.text;
                          if ((name == 'Vs') && (password == '12345')) {
                            //checking = 'Correct';

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Home()));
                          } else {
                            checking = 'Wrong';
                          }
                        });
                      }
                    },
                    child: new Text('Login')),
                Padding(
                  padding: EdgeInsets.only(
                    top: 20,
                  ),
                ),
                //Text("UserName / Password are $checking"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
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
      body: Center(
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
*/
