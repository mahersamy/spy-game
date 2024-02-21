import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spy_game/business_logic/cubit/spy_game_cubit.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import '../../constans/strings.dart';

class WhoTheSpyScreen extends StatelessWidget {
  const WhoTheSpyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<AnimatedText> list = List.generate(
      BlocProvider.of<SpyGameCubit>(context).players.length,
      (index) => FadeAnimatedText(
        duration: Duration(milliseconds: 800),
        BlocProvider.of<SpyGameCubit>(context).players[index],
        textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );

    void dialogBuilder(
        BuildContext context, Function() function, String spyName) {
      showDialog<void>(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: colorBlack,
            content: Container(
                padding: const EdgeInsets.all(5),
                height: 120,
                child: Center(
                    child: Text(
                  " الجسوس هو $spyName",
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ))),
            actions: <Widget>[
              TextButton(
                onPressed: function,
                child: const Text('التالي'),
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      body: Container(
        color: colorBlack,
        child: Center(
          child: Stack(
            children: [
              Center(
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.pinkAccent,
                    borderRadius: BorderRadius.circular(60),
                  ),
                ),
              ),
              Center(
                child: AnimatedTextKit(
                  onFinished: () {
                    dialogBuilder(context, () {
                      Navigator.pop(context);
                      Navigator.pushReplacementNamed(context, selectSpyWord);
                    }, BlocProvider.of<SpyGameCubit>(context).spy);
                  },
                  repeatForever: false,
                  animatedTexts: list,
                  totalRepeatCount: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
