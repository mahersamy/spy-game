import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spy_game/business_logic/cubit/spy_game_cubit.dart';
import 'package:spy_game/constans/strings.dart';
import 'package:spy_game/presentation/widgets/my_button.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: colorBlack,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: <Widget>[
                    const Center(child: Text("النتائج",style: TextStyle(color: Colors.white,fontSize: 30, fontWeight: FontWeight.bold),)),
                    ...List<Widget>.generate(
                        BlocProvider.of<SpyGameCubit>(context).score.length,
                            (index) => Row(children: [
                          Text(BlocProvider.of<SpyGameCubit>(context).score[index].toString(),style: const TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.bold),),
                          const Spacer(),
                          Text(
                            BlocProvider.of<SpyGameCubit>(context).players[index],
                            style: const TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                
                
                        ],)
                    ),
                   
                  ]
                ),
              ),
              mainButton("التالي", (){

                BlocProvider.of<SpyGameCubit>(context).continuePlay();
                Navigator.pushReplacementNamed(context, chooseSpyScreen);
              })
            ],
          ),
        ),
      ),
    );
  }
}
