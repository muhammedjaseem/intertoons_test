import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:interoons_machinetest/models/banner_model.dart';
import 'package:interoons_machinetest/models/category_model.dart';
import 'package:interoons_machinetest/models/products_models.dart';

Future<BannerModel?> getBanner() async {
  try {
    var url = Uri.parse('http://fda.intertoons.com/api/V1/home');
    var response = await http.get(url,headers: {
      "Authorization":"Bearer akhil@intertoons.com"
    });
    if (response.statusCode == 200) {
      return BannerModel.fromJson(jsonDecode(response.body));
    } else {
      print(response.statusCode.toString());
    }
  } catch (e) {
    print("Get Banner error"+e.toString());
  }
}

Future<CategoryMdel?> getCategoryData() async {
  try {
    var url = Uri.parse('http://fda.intertoons.com/api/V1/categories');
    var response = await http.get(url,headers: {
      "Authorization":"Bearer akhil@intertoons.com"
    });
    if (response.statusCode == 200) {
      return CategoryMdel.fromJson(jsonDecode(response.body));
    } else {
      print(response.statusCode.toString());
    }
  } catch (e) {
    print("Get Banner error"+e.toString());
  }
}

Future<AllProducts?> getProducts() async {
  print("products");
  try {
    var url = Uri.parse('http://fda.intertoons.com/api/V1/products');
    var response = await http.post(url,headers: {
      "Authorization":"Bearer akhil@intertoons.com"
    });
    if (response.statusCode == 200) {
      print(response.body);
      return AllProducts.fromJson(jsonDecode(response.body));
    } else {
      print(response.statusCode.toString());
    }
  } catch (e) {
    print("Get Products error"+e.toString());
  }
}
Future<AllProducts?> getCatProducts(id) async {
  print("products");
  try {
    var url = Uri.parse('http://fda.intertoons.com/api/V1/products');
    final  bodyData={
      "filter":{
        "Category":"100"
      }};
    var aa=jsonEncode(bodyData);
    var response = await http.post(url,headers: {
      "Authorization":"Bearer akhil@intertoons.com",
    },
    body:jsonEncode(bodyData));
    print(aa);
    if (response.statusCode == 200) {
      print(response.body);
      return AllProducts.fromJson(jsonDecode(response.body));
    } else {
      print(response.body);
      print(response.statusCode.toString());
    }
  } catch (e) {
    print("Get Products error"+e.toString());
  }
}
