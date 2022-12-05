import 'package:flutter/material.dart';
import 'package:placeholder/pages/pages.dart';
import 'package:placeholder/provider/photos_provider.dart';
import 'package:placeholder/provider/users_provider.dart';
import 'package:provider/provider.dart';

void main() {
  //runApp(const MyApp());
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PhotosProvider(),
          lazy: false,
        ) /*,
        ChangeNotifierProvider(
          create: (context) => PhotosProvider(),
          lazy: false,
        )*/
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: 'home',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        'home': (context) => HomePage(),
        'detail': (context) => DetailPage()
      },
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
