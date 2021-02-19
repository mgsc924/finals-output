import 'package:flutter/material.dart';
import 'package:flutter_color/flutter_color.dart';
import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => new Home()
      },
      home: MyHomePage(title: 'Login'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String email = 'cictapps@wvsu.edu.ph';
  String password = 'toor';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screen_width = MediaQuery.of(context).size.width;
    double screen_height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              color: Colors.blue,
              width: screen_width,
              height: screen_height,
            ),
            Container(
              color: HexColor('1b032e'),
              width: screen_width,
              height: screen_height,
            ),
            Column(
              children: [
                Center(
                  child: Container(
                    width: screen_width - 10,
                    height: screen_width - 10,
                    child: Image(
                      image: (AssetImage('assets/hello.gif')),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: screen_height * 0.45,
              child: Container(
                width: screen_width,
                decoration: BoxDecoration(
                  borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
                  color: HexColor('763a83'), // Login Bar
                ),
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Form(
                          key: _formKey,
                          child: Column(children: <Widget>[
                            FocusScope(
                              child: TextFormField(
                                controller: emailController,
                                decoration: InputDecoration(
                                    labelText: "Email",
                                    labelStyle: TextStyle(
                                      color: Colors.white,
                                    )),
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            FocusScope(
                              child: TextFormField(
                                controller: passwordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                    labelText: "Password",
                                    labelStyle: TextStyle(
                                      color: Colors.white,
                                    )),
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ])),
                      SizedBox(
                        height: 20,
                      ),
                      MaterialButton(
                          minWidth: screen_width,
                          color: HexColor('a364af'),
                          child: Text(
                            'Login',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            if (emailController.text == email &&
                                passwordController.text == password) {
                              Navigator.of(context).pushNamed('/home');
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15.0))),
                                      title: Text(
                                        'Error',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      content: Text(
                                        'You have entered wrong email or password',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      backgroundColor: HexColor('a364af'),
                                    );
                                  });
                            }
                          })
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
