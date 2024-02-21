import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spy_game/business_logic/cubit/spy_game_cubit.dart';

import '../../constans/strings.dart';
import '../../data/models/category_model.dart';


Widget categoryItem(CategoryModel categoryModel,BuildContext context){
  return GestureDetector(
    onTap: (){
      BlocProvider.of<SpyGameCubit>(context).updateSpyWordsSelect(categoryModel.listOfWords);
      Navigator.pushReplacementNamed(context,addPlayerScreen,arguments: categoryModel);
    },
    child: Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.pinkAccent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Text(categoryModel.name,style: const TextStyle(color: Colors.white),),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width>350?75:100,
            width: 150,
            child:
              Image.asset(categoryModel.image),

            ),
        ],
      ),
    ),
  );

}