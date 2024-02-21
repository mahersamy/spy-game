import 'package:flutter/material.dart';

Widget playerWidget(String text,Function() function){
  return Container(
    margin: const EdgeInsets.all(10),
    height: 50,
    width: 20,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 2,color: Colors.blueAccent)
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(onPressed: function, icon: const Icon(Icons.delete,size: 20,color: Colors.blueAccent,)),
        Text(text,style: const TextStyle(color: Colors.white,fontSize: 15),),
        const Icon(Icons.person,size: 20,color: Colors.blueAccent,)
      ],
    ),
  );
}