import 'package:flutter/material.dart';
import 'package:spy_game/presentation/widgets/category_item.dart';

import '../../constans/strings.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: colorBlack,
        width: double.infinity,
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // number of items in each row
              mainAxisSpacing: 8.0, // spacing between rows
              crossAxisSpacing: 8.0, // spacing between columns
            ),
            itemBuilder: (context,index){
              return categoryItem(categoryList[index],context);
            },
            itemCount: categoryList.length,

        ),
      ),
    );
  }
}
