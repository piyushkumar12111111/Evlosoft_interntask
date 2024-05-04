import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:interntask/block/evse_block.dart';

import 'package:interntask/firebase_options.dart';
import 'package:interntask/resources/theme/themes.dart';
import 'package:interntask/screen/home/homescreen.dart';
import 'package:interntask/screen/authentication/signin.dart';
import 'package:interntask/services/api_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<EVSEBloc>(
          create: (_) => EVSEBloc(apiService: apiService),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter EVSE App',
        theme: lightTheme,
        debugShowCheckedModeBanner: false,
        home:
            SigninScreen(), // Assuming you navigate to HomeScreen after Signin
      ),
    );
  }
}
