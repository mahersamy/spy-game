import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spy_game/presentation/widgets/add_player_dialog.dart';
import 'package:spy_game/presentation/widgets/not_valid_dialog.dart';

import '../../business_logic/cubit/spy_game_cubit.dart';
import '../../constans/strings.dart';
import '../widgets/my_button.dart';
import '../widgets/player.dart';

class AddPlayerScreen extends StatelessWidget {
  final categoryName;
  TextEditingController controller = TextEditingController();
  final GlobalKey<FormState> formKey=GlobalKey<FormState>();


  AddPlayerScreen({super.key, required this.categoryName});

  void _addPlayerDialogBuilder(BuildContext context,Function() onTap) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context)=>AddPlayerDialog(controller: controller,onTap: ()=>onTap(),formKey: formKey,),
    );
  }

  void _notValidDialog(BuildContext context){
    showDialog(context: context, builder: (BuildContext ctx)=>const NotValidDialog());
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<SpyGameCubit>(context).category=categoryName;
    String word=BlocProvider.of<SpyGameCubit>(context).getWord();
    BlocProvider.of<SpyGameCubit>(context).select();
    return Scaffold(
      body: Container(
        color: colorBlack,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            BlocBuilder<SpyGameCubit, SpyGameState>(
              builder: (context, state) {
                if (state is AddPlayer || state is RemovePlayer) {
                  return Expanded(
                      child: Container(
                    padding: const EdgeInsets.all(10),
                    width: 300,
                    child: ListView.separated(
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 20,
                      ),
                      itemBuilder: (context, index) {
                        return playerWidget(
                            BlocProvider.of<SpyGameCubit>(context).asks[index],
                            () {
                          BlocProvider.of<SpyGameCubit>(context)
                              .removePlayer(index);
                        });
                      },
                      itemCount:
                          BlocProvider.of<SpyGameCubit>(context).asks.length,
                    ),
                  ));
                } else {
                  return Expanded(
                      child: ListView.builder(
                    itemBuilder: (context, index) {
                      return playerWidget(
                          BlocProvider.of<SpyGameCubit>(context).asks[index],
                          () {
                        BlocProvider.of<SpyGameCubit>(context)
                            .removePlayer(index);
                      });
                    },
                    itemCount:
                        BlocProvider.of<SpyGameCubit>(context).asks.length,
                  ));
                }
              },
            ),
            addPlayerButton("بدء اللعب", () {
              if (BlocProvider.of<SpyGameCubit>(context).isplayer3()) {
                print(BlocProvider.of<SpyGameCubit>(context).getSpy());
                BlocProvider.of<SpyGameCubit>(context).createScoreBoard();
                Navigator.pushReplacementNamed(context, chooseSpyScreen);
              } else {
                _notValidDialog(context);
                print(BlocProvider.of<SpyGameCubit>(context).updateListWord);
              }
            }, () {
              _addPlayerDialogBuilder(context,(){
                BlocProvider.of<SpyGameCubit>(context).addPlayer(controller.text);
                print(BlocProvider.of<SpyGameCubit>(context).asks);
                controller.clear();
                Navigator.pop(context, true);
              });
            })
          ],
        ),
      ),
    );
  }
}
