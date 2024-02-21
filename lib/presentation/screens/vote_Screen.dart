import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spy_game/presentation/widgets/select_item.dart';

import '../../business_logic/cubit/spy_game_cubit.dart';
import '../../constans/strings.dart';

class VoteScreen extends StatefulWidget {
  const VoteScreen({super.key});

  @override
  State<VoteScreen> createState() => _VoteScreenState();
}

class _VoteScreenState extends State<VoteScreen> {
  PageController controller = PageController();
  int _curr = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> list = List.generate(
      BlocProvider.of<SpyGameCubit>(context).players.length,
      (index) => selectItem(
          function: () {
            setState(() {
              if (_curr !=
                  BlocProvider.of<SpyGameCubit>(context).asksAndAwnsers.length -
                      1) {
                controller.jumpToPage(_curr + 1);
              } else {
                Navigator.pushReplacementNamed(context,whoTheSpyScreen);
              }
            });
          },
          count: BlocProvider.of<SpyGameCubit>(context).players.length,
          name: BlocProvider.of<SpyGameCubit>(context).players[index]),
    );
    return Scaffold(
      body: Container(
        color: colorBlack,
        child: SafeArea(
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
      ),
    );
  }
}
