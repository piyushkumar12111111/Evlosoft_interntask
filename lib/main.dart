// import 'package:flutter/material.dart';

// import 'screen/home/homescreen.dart';
// import 'package:interntask/resources/theme/Themes.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

  
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
     
//       theme: lightTheme,
//       debugShowCheckedModeBanner: false,
//       home:  HomeScreen(),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'block/evse_block.dart';
import 'resources/theme/Themes.dart';
import 'screen/home/homescreen.dart';
import 'services/api_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter EVSE App',

      theme: lightTheme,
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) => EVSEBloc(apiService: apiService),
        child: HomePage(),
      ),
    );
  }
}

