import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sorter/providers/numbersProvider.dart';
import 'package:sorter/providers/sortingProvider.dart';
import 'package:sorter/view/homeScreen.dart';
import 'package:sorter/view/splashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NumbersProvider()),
        ChangeNotifierProvider(create: (_) => SortingProvider())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.blue,
        ),
        routes: {
          SplashScreen.routeName: (context) => SplashScreen(),
          HomeScreen.routeName: (context) => HomeScreen(),
        },
        initialRoute: SplashScreen.routeName,
      ),
    );
  }
}
