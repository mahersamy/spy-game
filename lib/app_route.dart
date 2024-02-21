import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spy_game/data/models/category_model.dart';
import 'package:spy_game/presentation/screens/add_player_screen.dart';
import 'package:spy_game/presentation/screens/ask_Screen.dart';
import 'package:spy_game/presentation/screens/score_Screen.dart';
import 'package:spy_game/presentation/screens/select_spy_words_screen.dart';
import 'package:spy_game/presentation/screens/who_the_spy_Screeen.dart';

import 'business_logic/cubit/spy_game_cubit.dart';
import 'constans/strings.dart';
import 'presentation/screens/category_screen.dart';
import 'presentation/screens/home_screen.dart';
import 'presentation/screens/choose_spy_screen.dart';
import 'presentation/screens/vote_Screen.dart';

class AppRoute{
  final SpyGameCubit spyGameCubit;

  AppRoute({required this.spyGameCubit});



  Route? generateRoute(RouteSettings settings){
  switch(settings.name){
    case homeScreen:
      return MaterialPageRoute(builder: (_)=>
      BlocProvider.value(value: spyGameCubit,child:  const HomeScreen(),)
      );
    case categoryScreen:
      return MaterialPageRoute(builder: (_)=>
          BlocProvider.value(value: spyGameCubit,child: const CategoryScreen(),)
      );
    case addPlayerScreen:
      final categoryName=settings.arguments;
      return MaterialPageRoute(builder: (_)=>
          BlocProvider.value(value: spyGameCubit,child: AddPlayerScreen(categoryName: categoryName,),)
      );
    case chooseSpyScreen:
      return MaterialPageRoute(builder: (_)=>
          BlocProvider.value(value: spyGameCubit,child: const ChooseSpyScreen(),)
      );

    case askScreen:
      return MaterialPageRoute(builder: (_)=>
          BlocProvider.value(value: spyGameCubit,child: const AskScreen(),)
      );

    case voteScreen:
      return MaterialPageRoute(builder: (_)=>
          BlocProvider.value(value: spyGameCubit,child: const VoteScreen(),)
      );

    case whoTheSpyScreen:
      return MaterialPageRoute(builder: (_)=>
          BlocProvider.value(value: spyGameCubit,child: const WhoTheSpyScreen(),)
      );

    case selectSpyWord:
      return MaterialPageRoute(builder: (_)=>
          BlocProvider.value(value: spyGameCubit,child: const SelectSpyWord(),)
      );

    case scoreScreen:
      return MaterialPageRoute(builder: (_)=>
          BlocProvider.value(value: spyGameCubit,child: const ScoreScreen(),)
      );
  }

  }
}