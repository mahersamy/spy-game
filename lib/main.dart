import 'package:flutter/material.dart';
import 'package:spy_game/app_route.dart';
import 'package:spy_game/business_logic/cubit/spy_game_cubit.dart';
import 'package:flutter/services.dart';
void main(){
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppRoute appRoute=AppRoute(spyGameCubit: SpyGameCubit());

  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'برا السالفا',
      theme: ThemeData(

    ),
        onGenerateRoute: appRoute.generateRoute,
    );
  }
}

