import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spy_game/business_logic/cubit/spy_game_cubit.dart';

class WhoSpyItem extends StatefulWidget {
  final String text;

  const WhoSpyItem({super.key, required this.text});

  @override
  State<WhoSpyItem> createState() => _WhoSpyItemState();
}

class _WhoSpyItemState extends State<WhoSpyItem> {
  bool isPressed = false;

  String buttonText = "اظهر السالفه";

  @override
  Widget build(BuildContext context) {
    String word = BlocProvider.of<SpyGameCubit>(context).word;
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.pinkAccent),
                foregroundColor: MaterialStateProperty.all(Colors.white)
              ),
                onPressed: () {
                  if (isPressed == true) {
                    return;
                  } else {
                    setState(() {
                      isPressed = true;
                    });
                  }
                },
                child: Text(buttonText)),
            Text(
              " اعطي الجوال ${widget.text} ",
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            if (BlocProvider.of<SpyGameCubit>(context).spy == widget.text &&
                isPressed == true)
              const Text(
                "انت الجسوس",
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            if (BlocProvider.of<SpyGameCubit>(context).spy != widget.text &&
                isPressed == true)
              Text(
                " السالفه هي ${word} ",
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
          ]),
    );
  }
}




class AskItem extends StatefulWidget {
  final String askPreson;
  final String AwnserPerson;
  const AskItem({super.key, required this.askPreson, required this.AwnserPerson});

  @override
  State<AskItem> createState() => _AskItemState();
}

class _AskItemState extends State<AskItem> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              " اسال سؤال يا ${widget.askPreson} ",
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
              Text(
                " اجب عن السؤال يا ${widget.AwnserPerson} ",
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
                style:
                const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
          ]),
    );
  }

}

