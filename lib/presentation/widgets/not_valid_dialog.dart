import 'package:flutter/material.dart';
import 'package:spy_game/constans/strings.dart';

class NotValidDialog extends StatelessWidget {
  const NotValidDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      backgroundColor: colorBlack,
      title: Text(
        'حدث خطا',
        style: TextStyle(color: Colors.white),
      ),
      content: Text(
        'اقل عدد من الاعبين المسموح هو ثلاثه لاعبين',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
