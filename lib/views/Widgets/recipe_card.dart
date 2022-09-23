import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:recipebook/Api/recipe_api.dart';
import 'package:recipebook/models/recipe_info.dart';

Widget nodata() {
  return const Center(
    child: CircularProgressIndicator(),
  );
}

RecipeCard(context, snapshot) {
  return ListView.separated(
    padding: const EdgeInsets.all(7),
    itemCount: snapshot.data.length,
    itemBuilder: (BuildContext context, int index) {
      return Container(
        height: MediaQuery.of(context).size.width * 0.5,
        width: MediaQuery.of(context).size.height * 0.45,
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.7),
                offset: Offset(
                  0.0,
                  15.0,
                ),
                blurRadius: 10.0,
                spreadRadius: -6.0,
              ),
            ],
            image: DecorationImage(
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.55),
                BlendMode.darken,
              ),
              image: NetworkImage(snapshot.data[index]!.images),
              fit: BoxFit.cover,
            ),)
        ,
        child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [

                   Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 20,
                        ),
                        SizedBox(width: 2),
                        AutoSizeText(
                          snapshot.data[index]!.rating,
                          minFontSize: 18,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w800),
                        ),


                SizedBox(width: 190,),

                      Icon(
                        Icons.watch_later_outlined,
                        color: Colors.yellow,
                        size: 20,
                      ),
                      SizedBox(width: 2),
                      AutoSizeText(
                        snapshot.data[index]!.totaltime,
                        overflow: TextOverflow.ellipsis,
                        minFontSize: 18,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),






                  SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                Align(
                  alignment: Alignment.centerLeft,
                  child: AutoSizeText(
                    snapshot.data[index]!.name,
                    presetFontSizes: [26.0],
                    overflow: TextOverflow.fade,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w800),
                  ),
                ),

          ],
          ),
      ),
      );

    },
    separatorBuilder: (BuildContext context, int index) => const Divider(),
  );

}

// Align(
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Container(
// padding: EdgeInsets.all(5),
// margin: EdgeInsets.all(10),
// decoration: BoxDecoration(
// color: Colors.black.withOpacity(0.4),
// borderRadius: BorderRadius.circular(15),
// ),
// child: Row(
// children: [
// Icon(
// Icons.star,
// color: Colors.yellow,
// size: 18,
// ),
// SizedBox(width: 7),
// Text(rating),
// ],
// ),
// ),
// Container(
// padding: EdgeInsets.all(5),
// margin: EdgeInsets.all(10),
// decoration: BoxDecoration(
// color: Colors.black.withOpacity(0.4),
// borderRadius: BorderRadius.circular(15),
// ),
// child: Row(
// children: [
// Icon(
// Icons.schedule,
// color: Colors.yellow,
// size: 18,
// ),
// SizedBox(width: 7),
// Text(cookTime),
// ],
// ),
// )
// ],
// ),
// alignment: Alignment.bottomLeft,
// ),
