
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spy_game/business_logic/cubit/spy_game_cubit.dart';

import 'my_button.dart';




Widget selectItem({required int count,required String name,required Function() function}){
  return Container(
    padding: const EdgeInsets.all(10),
    child: Column(
      children: [
        Text(" اختر من تعتقد انه الجسوس $name ",style: const TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
        const SizedBox(height: 10,),
        Expanded(
          child: ListView.separated(separatorBuilder: (context,index)=>const SizedBox(height: 5,),itemBuilder: (context,index){
            if(BlocProvider.of<SpyGameCubit>(context).players[index]!=name){
            return mainButton(BlocProvider.of<SpyGameCubit>(context).players[index], (){
              BlocProvider.of<SpyGameCubit>(context).changeScoreBoard(name,BlocProvider.of<SpyGameCubit>(context).players[index]);
              print(BlocProvider.of<SpyGameCubit>(context).score);
              function();
            });
            }else{
              return const SizedBox();
            }
            },itemCount: count,),
        ),
      ],
    ),
  );
}