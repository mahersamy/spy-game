import 'package:flutter/material.dart';

import '../../constans/strings.dart';



class AddPlayerDialog extends StatelessWidget {
  AddPlayerDialog({super.key, required this.controller,required this.onTap, required this.formKey});
  final GlobalKey<FormState> formKey;
  final TextEditingController controller;
  Function() onTap;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: colorBlack,
      title: const Text(
        'اضافة لاعب جديد',
        style: TextStyle(color: Colors.white),
      ),
      content: Form(
        key: formKey,
        child: TextFormField(
          textDirection: TextDirection.rtl,
          style: const TextStyle(
            color: Colors.white,
          ),
          controller: controller,
          validator: (value){
            if(value!.trim().isEmpty){
              print(value);
              return "لقد قمت بادخال اسم فارغ";
            }
          },
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide:
                const BorderSide(color: Colors.blueAccent, width: 5.0),
              )),
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: (){
            if(formKey.currentState!.validate()){
              onTap();
            }
          },
          child: const Text('اضافة'),
        ),
      ],
    );
  }
}
