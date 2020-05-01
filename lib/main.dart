import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Screens/home.dart';
import 'models/cgpaandcr.dart';
import 'models/data/arrays.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DataArrays()),
        ChangeNotifierProvider(create: (_) => CGPAandCR()),
      ],
      child: MaterialApp(
        home: MyHomePage(),
      ),
    );
  }
}
