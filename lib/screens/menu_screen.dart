import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interoons_machinetest/custom/custom_text.dart';
import 'package:interoons_machinetest/custom/image_shimmer.dart';
import 'package:interoons_machinetest/providers/home_page_provider.dart';
import 'package:provider/provider.dart';
class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  TabController? _controller;

  @override
  void initState() {
    super.initState();
   var data= Provider.of<HomePageProvider>(context,listen: false);
    data.getProductsbyCatid(2);
  }

  @override
  Widget build(BuildContext ctxt) {
    return Scaffold(
        body: Consumer<HomePageProvider>(
          builder: (context,data,child) {
            return DefaultTabController(
                length: data.catData!.data!.length,
                child: SafeArea(
                  child: Scaffold(
                      appBar: PreferredSize(
                        preferredSize: const Size.fromHeight(100),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 50,
                                width: MediaQuery.of(context).size.width,
                                color: Colors.red.shade900,
                                padding: const EdgeInsets.only(top: 10,left: 10),
                                child: const CustomText(text: "Explore Menu",color: Colors.white,)),
                            TabBar(
                              labelColor: Colors.red.shade900,
                            unselectedLabelColor: Colors.black,
                            indicatorColor: Colors.red.shade900,
                            onTap: (int index){
                      data.getProductsbyCatid(2);
                      },
                        isScrollable: true,
                        tabs: List<Widget>.generate(data.catData!.data!.length, (int index) {
                          return  Tab(
                              text: '${data.catData?.data?[index].catName}');
                        }),

                      ),
                          ],
                        ),
                      ),
                      body: data.isCatProductsloading ==false?ListView.builder(
                  itemCount: data.getCategoryBaseProducts?.data?.products?.length ??0,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          height: 300,
                          child: Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                data.getCategoryBaseProducts?.data?.products?[index].image !=null? Stack(
                                  children: [
                                    Image.network('${data.getCategoryBaseProducts?.data?.products?[index].image}',height: 200,width: MediaQuery.of(context).size.width,fit: BoxFit.fill,),
                                  Positioned(
                                    right: 00,
                                    bottom: 00,
                                    child: IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_border,color: Colors.grey,)),
                                  )
                                  ],
                                ):ImageShimmer(height: 200, width:  MediaQuery.of(context).size.width),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10,right: 10),
                                  child: CustomText(text: '${data.getCategoryBaseProducts?.data?.products?[index].name}'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10,right: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      data.getCategoryBaseProducts?.data?.products?[index].specialPrice !=0?CustomText(text:  ' C\$ ${data.getCategoryBaseProducts?.data?.products?[index].price}',size: 12,weight: FontWeight.w600,color: Colors.red.shade900,textDecoration: TextDecoration.lineThrough,)
                                          :CustomText(text:  ' C\$ ${data.getCategoryBaseProducts?.data?.products?[index].price}',size: 12,weight: FontWeight.w600,color: Colors.red.shade900,
                                      ),
                                      SizedBox(
                                          height: 25,width: 55,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.red.shade900),
                                              onPressed: (){
                                                /*data.AddtoCart(data.getProductsDatas?.data?.products?[index].id,index);
                                                data.getTotalprice(data.getProductsDatas?.data?.products?[index].specialPrice !=0?data.getProductsDatas!.data!.products![index].specialPrice.toString():data.getProductsDatas?.data?.products?[index].price.toString());
                                                print(data.ProductID.toString());*/
                                              }, child: const CustomText(text: "ADD",size: 10,color: Colors.white,))),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }):const CupertinoActivityIndicator(),
                  ),
                )
            );
          }
        )
    );
  }
}