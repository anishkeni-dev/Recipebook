import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:recipebook/models/recipe_info.dart';

Future<List<Item>> getRequest() async {
  var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
      {"limit": "18", "start": "0", "tag": "list.recipe.popular"});

  final response = await http.get(uri, headers: {
    "x-rapidapi-key":  '66d7f2a3aamshd93077188d687a8p1eaadfjsn016140f5546d',
    "x-rapidapi-host": "yummly2.p.rapidapi.com",
    "useQueryString": "true"
  });
  //replace your restFull API here.
  // String choice = 'chicken';
  // final response = await http.get(Uri.https('tasty.p.rapidapi.com','recipes/auto-complete/steak'));


  //Creating a list to store input data;
  Map data = jsonDecode(response.body);
  List _temp = [];

  for (var i in data['feed']) {
    _temp.add(i['content']['details']);
  }
  List<Item> recipes = [];
  for (var singleProduct in _temp) {
    Item items = Item(
      name: singleProduct["name"].toString(),
      images: singleProduct["images"][0]['hostedLargeUrl'].toString(),
      rating: singleProduct["rating"].toString(),
      totaltime: singleProduct["totalTime"].toString(),

    );
    print(singleProduct['rating']);
    //Adding Product to the list.
    recipes.add(items);


  }
  return recipes;
}