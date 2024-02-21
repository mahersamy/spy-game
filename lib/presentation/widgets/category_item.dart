import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spy_game/business_logic/cubit/spy_game_cubit.dart';

import '../../constans/strings.dart';
import '../../data/models/category_model.dart';


Widget categoryItem(CategoryModel categoryModel,BuildContext context){
  return GestureDetector(
    onTap: (){
      BlocProvider.of<SpyGameCubit>(context).updateSpyWordsSelect(categoryModel.listOfWords);
      // if(categoryModel.name=="حيوانات"){
      //   print(animals);
      //   BlocProvider.of<SpyGameCubit>(context).updateSpyWordsSelect(animals);
      // }else if(categoryModel.name=="خضروات"){
      //   BlocProvider.of<SpyGameCubit>(context).updateSpyWordsSelect(vegetables);
      // }else if(categoryModel.name=="الطعام"){
      //   BlocProvider.of<SpyGameCubit>(context).updateSpyWordsSelect(foods);
      // }else if(categoryModel.name=="الاعمال"){
      //   BlocProvider.of<SpyGameCubit>(context).updateSpyWordsSelect(jobs);
      // }else if(categoryModel.name=="بلاد و مدن"){
      //   BlocProvider.of<SpyGameCubit>(context).updateSpyWordsSelect(countries);
      // }else if(categoryModel.name=="مشروبات"){
      //   BlocProvider.of<SpyGameCubit>(context).updateSpyWordsSelect(juices);
      // }else if(categoryModel.name=="افلام و مسلسلات"){
      //   BlocProvider.of<SpyGameCubit>(context).updateSpyWordsSelect(moviesAndSeries);
      // }else if(categoryModel.name=="كوره القدم"){
      //   BlocProvider.of<SpyGameCubit>(context).updateSpyWordsSelect(footballPlayers);
      // }
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
            height: 100,
            width: 150,
            child:
              Image.asset(categoryModel.image),

            ),
        ],
      ),
    ),
  );

}