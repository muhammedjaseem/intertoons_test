import 'package:flutter/material.dart';
import 'package:interoons_machinetest/apis/home_page_apis.dart';
import 'package:interoons_machinetest/models/banner_model.dart';
import 'package:interoons_machinetest/models/category_model.dart';
import 'package:interoons_machinetest/models/products_models.dart';


class HomePageProvider with ChangeNotifier{
  BannerModel? BannerData;
  CategoryMdel? catData;
  AllProducts? getProductsDatas,getCategoryBaseProducts;
  bool isBannerloading =true,isCatLoading=true,isProductloading=true,isCatProductsloading =true;


  Future<void>getBannerDatas()async{
    try{
      isBannerloading = false;
      BannerData = await getBanner();
    }
    catch(e){
      print(e);
      isBannerloading =true;
    }
    notifyListeners();
  }
  Future<void>getCategory()async{
    try{
      isCatLoading = false;
      catData = await getCategoryData();
    }
    catch(e){
      print(e);
      isCatLoading =true;
    }
    notifyListeners();
  }

  Future<void>getProductsD()async{
    try{
      isProductloading = false;
      getProductsDatas = await getProducts();
    }
    catch(e){
      print(e);
      isProductloading =true;
    }
    notifyListeners();
  }

Future<void>getProductsbyCatid(Catid)async{
    try{
      isCatProductsloading = false;
      getCategoryBaseProducts = await getCatProducts(Catid);
    }
    catch(e){
      print(e);
      isCatProductsloading =true;
    }
    notifyListeners();
  }



  List<int> ProductID=[];
  List<int> quantity=[];
  double TotalcartPrice=0;
  AddtoCart(id,index){
    if(ProductID.contains(id)){
      quantity[index] +=1;
    }else{
      ProductID.add(id);
      quantity.add(1);
    }
    notifyListeners();
  }
  DecreaseQuantity(id,index,price){
    if(quantity[index] ==1){
      ProductID.remove(id);
    }
    else{
      quantity[index] -=1;
    }
    TotalcartPrice =TotalcartPrice - double.parse(price.toString());
    notifyListeners();
  }
  void getTotalprice(price)async {
    print(price);
     TotalcartPrice =TotalcartPrice +double.parse(price.toString());
    print(TotalcartPrice);
  }
}