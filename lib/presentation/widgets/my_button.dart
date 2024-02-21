
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spy_game/business_logic/cubit/spy_game_cubit.dart';

Widget mainButton(String text, Function() function,
    {Color backgroundColor = Colors.pinkAccent, double padding = 55}) {
  return ElevatedButton(
    onPressed: function,
    style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(backgroundColor),
        foregroundColor: MaterialStateProperty.all(Colors.white),
        padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(horizontal: padding)),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
    child: Text(
      text,
      style: const TextStyle(fontSize: 20),
    ),
  );
}

Widget addPlayerButton(
    String text, Function() function1, Function() function2) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: function2,
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
              foregroundColor: MaterialStateProperty.all(Colors.white),
              padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(horizontal: 0)),
              shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10))))),
          child: const Icon(
            Icons.person,
            size: 25,
          ),
        ),
        ElevatedButton(
          onPressed: function1,
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.pinkAccent),
              foregroundColor: MaterialStateProperty.all(Colors.white),
              padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(horizontal: 55)),
              shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      topRight: Radius.circular(10))))),
          child: Text(
            text,
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ],
    ),
  );
}

Widget selectSpyWordButton(BuildContext context,String text, Function()? function,
    {double padding = 55}) {
  return ElevatedButton(
    onPressed: function,
    style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if(BlocProvider.of<SpyGameCubit>(context).activeButton==false){
              return BlocProvider.of<SpyGameCubit>(context).checkCorrectAwnser(text);
            }else{
              return Colors.pinkAccent;
            }
            // if (states.contains(MaterialState.focused)) {
            //   return BlocProvider.of<SpyGameCubit>(context).checkCorrectAwnser(spyWord);
            // }else{
            //   return Colors.pinkAccent;
            // }

          },
        ),
        foregroundColor: MaterialStateProperty.all(Colors.white),
        padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(horizontal: padding)),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
    child: Text(
      text,
      style: const TextStyle(fontSize: 20),
    ),
  );
}
