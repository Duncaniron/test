import 'package:firebase_core/firebase_core.dart';
import 'package:firebasetesting/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AuthService().handleAuthState(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //email
            Padding(
              padding: EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () => null,
                  child: FaIcon(FontAwesomeIcons.envelope)),
            ),
            //facebook
            ElevatedButton(
              onPressed: () {
                AuthService().signInWithFacebook();
              },
              child: FaIcon(FontAwesomeIcons.facebookSquare),
            ),
            //Guest
            Padding(
              padding: EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () => null,
                  child: FaIcon(FontAwesomeIcons.google)),
            )
          ],
        ),
      ),
    );
  }
}
