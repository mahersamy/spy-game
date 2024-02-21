import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/cubit/spy_game_cubit.dart';
import '../../constans/strings.dart';
import '../widgets/play_item.dart';

class AskScreen extends StatefulWidget {
  const AskScreen({super.key});

  @override
  State<AskScreen> createState() => _AskScreenState();
}

class _AskScreenState extends State<AskScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<SpyGameCubit>(context).autoPlay();
    // print( BlocProvider.of<SpyGameCubit>(context).asksAndAwnsers);
  }

  PageController controller = PageController();
  int _curr = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<SpyGameCubit, SpyGameState>(
          builder: (context, state) {
            if (state is Play && BlocProvider.of<SpyGameCubit>(context).asksAndAwnsers.isNotEmpty) {
              List<Widget> list = List.generate(
                  BlocProvider.of<SpyGameCubit>(context).asksAndAwnsers.length,
                  (index) => AskItem(
                      askPreson: BlocProvider.of<SpyGameCubit>(context)
                          .asksAndAwnsers[index][0],
                      AwnserPerson: BlocProvider.of<SpyGameCubit>(context)
                          .asksAndAwnsers[index][1]));
              return Container(
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
              );
            } else {
              return Container(
                color: Colors.black54,
                child: const Center(
                    child: Text(
                  "حان وقت الاساله",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
              );
            }
          },
        ),
        floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FloatingActionButton(
                  backgroundColor: Colors.pinkAccent,
                  onPressed: () {
                    setState(() {
                      if (_curr != BlocProvider.of<SpyGameCubit>(context).asksAndAwnsers.length - 1) {
                        controller.jumpToPage(_curr + 1);
                      } else {

                        Navigator.pushReplacementNamed(context, voteScreen);
                      }
                    });
                  },
                  child: const Icon(Icons.arrow_right)),
            ])
    );
  }
}
