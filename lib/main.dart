import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:pu_resourcse/sinup.dart';
import 'package:pu_resourcse/splash.dart';
import 'login.dart';
import 'mainpage.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}


class MyApp extends StatelessWidget{
  const MyApp ({super.key});     //({Key? key})  : super(key: key);
  @override

  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'nothing',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: const Splash(),

        routes: {
          'sinup': (context) => const Mysinup(title: '',),
          'login': (context) => const MyLogin( title: '', ),
          'maimpage': (context) => const MainPage(title: '',),


        }

    );

  }


}

//void main() {


  //runApp(MaterialApp(
    //debugShowCheckedModeBanner: false,
    //home: const Splash(),
    //routes: {

      //'login': (context) =>  const MyLogin(title: '',),
      //'register': (context) => const Mysinup(),

    //},
  //));
//}

