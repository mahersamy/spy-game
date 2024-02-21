import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spy_game/business_logic/cubit/spy_game_cubit.dart';
import 'package:spy_game/constans/strings.dart';
import 'package:spy_game/presentation/widgets/my_button.dart';

class SelectSpyWord extends StatelessWidget {
  const SelectSpyWord({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpyGameCubit, SpyGameState>(
  builder: (context, state) {
    return Scaffold(
      body: Container(
        color: colorBlack,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SafeArea(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "يجب علي الجسوس ان يعرف السالفه",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                Expanded(
                  child: BlocBuilder<SpyGameCubit, SpyGameState>(
                    builder: (context, state) {
                      if(state is isActive||state is! isActive){}
                      return ListView.separated(
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 5,
                        ),
                        itemBuilder: (context, index) => selectSpyWordButton(
                            context,
                            BlocProvider.of<SpyGameCubit>(context)
                                .spyWordsRes[index],
                            BlocProvider.of<SpyGameCubit>(context).activeButton == false ? null : () => BlocProvider.of<SpyGameCubit>(context).changeActive(BlocProvider.of<SpyGameCubit>(context)
                                .spyWordsRes[index]),
                            ),
                        itemCount: BlocProvider.of<SpyGameCubit>(context)
                            .spyWordsRes
                            .length,
                      );
                    },
                  ),
                ),
               if(BlocProvider.of<SpyGameCubit>(context).activeButton==false)
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     mainButton("النتائج", () => Navigator.pushReplacementNamed(context, scoreScreen), padding: 20),
                     mainButton("الرئسيه", () {
                       BlocProvider.of<SpyGameCubit>(context).reset();
                       Navigator.pushReplacementNamed(context, categoryScreen);
                     }, padding: 20),
                   ],
                 )
              ],
            ),
          ),
        ),
      ),
    );
  },
);
  }
}
