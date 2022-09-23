import 'package:flutter/material.dart';
import 'package:recipebook/models/recipe_info.dart';
import 'package:recipebook/views/Widgets/recipe_card.dart';
import 'package:recipebook/Api/recipe_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.restaurant_menu_rounded, color: Colors.black,),
            SizedBox(width: 10,),
            Text('RecipeBook', style: TextStyle(color: Colors.black),
            )
          ],
        ),
      ),
      body: Container(
        child:  FutureBuilder(
          future: getRequest(),
          builder: (BuildContext ctx, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return nodata();

            } else {
              return  RecipeCard(ctx, snapshot);
            }
          },
        ),
      ),
    );
  }
}


