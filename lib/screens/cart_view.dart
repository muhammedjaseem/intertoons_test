import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interoons_machinetest/apis/home_page_apis.dart';
import 'package:interoons_machinetest/custom/custom_text.dart';
import 'package:interoons_machinetest/providers/home_page_provider.dart';
import 'package:provider/provider.dart';
class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(130),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10,right: 10),
                child: CustomText(text: "Order Summary",size: 20,weight: FontWeight.w700,),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10,right: 10),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Note eg: add some Souce",
                  ),
                ),
              )
            ],
          ),
        ),
        body: Consumer<HomePageProvider>(builder: (context, data, child) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              children: [
                ListView.builder(
                  shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                  itemCount: data.BannerData?.data?.bestsellerProducts?.length,
                    itemBuilder: (context,index){
                  return data.ProductID.contains(data.BannerData?.data?.bestsellerProducts?[index].id)?Padding(
                    padding: const EdgeInsets.only(top: 5,bottom: 5),
                    child: SizedBox(
                      height: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           CustomText(text: '${data.BannerData?.data?.bestsellerProducts?[index].name}',size: 14,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 60,
                                width: 110,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      onPressed: (){
                                        data.DecreaseQuantity(data.BannerData?.data?.bestsellerProducts?[index].id,index,data.BannerData?.data?.bestsellerProducts?[index].specialPrice !=0?data.BannerData!.data!.bestsellerProducts![index].specialPrice.toString():data.BannerData?.data?.bestsellerProducts?[index].price.toString());
                                      },
                                      icon: const Icon(Icons.remove,size: 20,),
                                    ),
                                    FittedBox(child: CustomText(text: data.quantity[index].toString(),size: 13,)),
                                    IconButton(
                                      onPressed: (){
                                        data.AddtoCart(data.BannerData?.data?.bestsellerProducts?[index].id,index);
                                        data.getTotalprice(data.BannerData?.data?.bestsellerProducts?[index].specialPrice !=0?data.BannerData!.data!.bestsellerProducts![index].specialPrice.toString():data.BannerData?.data?.bestsellerProducts?[index].price.toString());
                                      },
                                      icon: const Icon(Icons.add,size: 20,),
                                    )
                                  ],
                                ),
                              ),
                              CustomText(text: data.BannerData?.data?.bestsellerProducts?[index].specialPrice !=0?"C\$ ${data.BannerData?.data?.bestsellerProducts?[index].specialPrice}":"C\$ ${data.BannerData?.data?.bestsellerProducts?[index].price}",size: 13,color: Colors.red.shade900,weight: FontWeight.w700,)
                            ],
                          ),
                        ],
                      ),
                    ),
                  ):const SizedBox();
                }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:  [
                    const CustomText(text: "Item Total",size: 13,color: Colors.grey,),
                    CustomText(text: "C\$ ${data.TotalcartPrice}",size: 13,color: Colors.grey),
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:  [
                    const CustomText(text: "Total",size: 16,weight: FontWeight.w700,),
                    CustomText(text: "C\$ ${data.TotalcartPrice}",size: 16,weight: FontWeight.w700,),
                  ],
                ),
              ],
            ),
          );
        }),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            height: 160,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                const CustomText(text: "Address",size: 18,weight: FontWeight.w700,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 200,
                        child: CustomText(text: "AKhil Niagra Glen Nature centre  Niagra Parkway Regional Municipality of Niagra Manitaba Canada L2E",size: 13,)),
                  TextButton(onPressed: (){}, child:  CustomText(text: "Change",color: Colors.red.shade900,weight: FontWeight.w700,))
                  ],
                ),
                SizedBox(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.red.shade900),
                      onPressed: (){
                      }, child: const CustomText(text: "Proceed to Payment",color: Colors.white,)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
