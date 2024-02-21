import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spy_game/business_logic/cubit/spy_game_cubit.dart';
import 'package:spy_game/constans/strings.dart';

import '../widgets/play_item.dart';

class ChooseSpyScreen extends StatefulWidget {
  const ChooseSpyScreen({super.key});

  @override
  State<ChooseSpyScreen> createState() => _ChooseSpyScreenState();
}

class _ChooseSpyScreenState extends State<ChooseSpyScreen> {
  PageController controller = PageController();
  int _curr = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> list = List.generate(
        BlocProvider.of<SpyGameCubit>(context).asks.length,
        (index) => WhoSpyItem(
              text: BlocProvider.of<SpyGameCubit>(context).asks[index],
            ));
    return Scaffold(
        body: Container(
          color: colorBlack,
          child: PageView(
            scrollDirection: Axis.horizontal,
            reverse: false,
            physics: const  NeverScrollableScrollPhysics(),
            controller: controller,
            onPageChanged: (num) {
              setState(() {
                _curr = num;
              });
            },
            children: list,
          ),
        ),
        floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FloatingActionButton(
                backgroundColor: Colors.pinkAccent,
                  onPressed: () {
                    setState(() {
                      if (_curr != list.length - 1) {
                        controller.jumpToPage(_curr + 1);
                      } else {
                        Navigator.pushReplacementNamed(context, askScreen);
                      }
                    });

                  },
                  child: const Icon(Icons.arrow_right)),
            ]));
  }
}
