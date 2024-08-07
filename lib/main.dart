import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Provider/quotes_provider.dart';
import 'Screens/FavPage/Fav_Page.dart';
import 'Screens/HomePage/HomePage.dart';
import 'Screens/splash_screen/splash_screen.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => QuotesProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context)=> SplashScreen(),
          '/qt': (context) => ProductPage(),
          '/fav':(context) => FavPage(),
        },
      ),
    );
  }
}
