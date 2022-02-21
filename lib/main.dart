import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tired/screens/splashscreen.dart';
import 'package:tired/statemanagement/product_.dart';

void main() => runApp(
        // MultiProvider(
        //     providers: [
        //       ChangeNotifierProvider(create: (context) => ProductRepository),
        //     ],
        //     child:
        // MyApp(),
        // )

        MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => ProductRepository())
    ], 
    child: MyApp(),));

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DukaPepes',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: SplashScreen(),
      
    );
  }
}
