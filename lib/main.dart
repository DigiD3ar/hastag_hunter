import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  bool logueado = false;


  void _Login() async{
    var login = FacebookLogin();
    var res = await login.logInWithReadPermissions(['email']);
    switch(res.status) {
      case FacebookLoginStatus.error:
        print("error");
        break;
      case FacebookLoginStatus.cancelledByUser:
        print("error");
        break;
      case FacebookLoginStatus.loggedIn:
        _LogedIn(true);
        break;
    }
  }

  void _LogedIn(x){
    setState(() {
        this.logueado = x;
    });
    print("true");
  }

    @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Bienvenido',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _login,
        tooltip: 'Login',
        child: Icon(Icons.perm_identity),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
