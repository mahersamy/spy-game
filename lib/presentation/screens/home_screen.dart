import 'package:flutter/material.dart';
import 'package:spy_game/constans/strings.dart';
import 'package:spy_game/presentation/widgets/my_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        color: colorBlack,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: SizedBox(
                  height: 200,
                  width: 200,
                  child: Image.asset("images/recruitment.png")),
            ),
            const Text("مين برا السالفه ؟",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
            const SizedBox(height: 50,),
            mainButton("ابدا اللعب",(){
              Future.delayed(Duration.zero, () async {
                Navigator.pushNamed(context, "/categoryScreen");
              });

            }),
          ],
        ),
      ),
    );
  }
}
