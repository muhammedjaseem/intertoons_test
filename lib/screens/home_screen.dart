import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interoons_machinetest/custom/custom_text.dart';
import 'package:interoons_machinetest/custom/image_shimmer.dart';
import 'package:interoons_machinetest/providers/home_page_provider.dart';
import 'package:interoons_machinetest/providers/products_and_cart_provider.dart';
import 'package:interoons_machinetest/screens/cart_view.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<HomePageProvider>(context,listen: false).getBannerDatas();
    Provider.of<HomePageProvider>(context,listen: false).getCategory();
    Provider.of<HomePageProvider>(context,listen: false).getProductsD();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: HomeAppBar(),
        ),
        body: Consumer<HomePageProvider>(builder: (context, data, child) {
          return Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              children: [
                SizedBox(
                  height: 120,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: data.BannerData?.data?.sliderBanners?.length,
                      itemBuilder: (context, index) {
                        return data.isBannerloading == false
                            ? Padding(
                                padding: const EdgeInsets.only(
                                    left: 5, right: 5, bottom: 10),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: data.BannerData?.data?.sliderBanners?[index].bannerImg !=null?Image.network(
                                      '${data.BannerData?.data?.sliderBanners?[index].bannerImg}',
                                      height: double.infinity,
                                      width: 200,
                                      fit: BoxFit.fill,
                                    ):ImageShimmer(height: 120.0,width: 200.0,)),
                              )
                            : const CircularProgressIndicator();
                      }),
                ),
                const CustomText(
                  text: "Explore Menu",
                  size: 14,
                  weight: FontWeight.w700,
                ),
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: data.catData?.data?.length,
                      itemBuilder: (context, index) {
                        return data.isCatLoading == false
                            ? Column(
                                children: [
                                  Container(
                                    height: 80,
                                    width: 100,
                                    padding:
                                        const EdgeInsets.only(left: 5, right: 5),
                                    child: Card(
                                      child: data.catData?.data?[index].catImg !=null?Image.network(
                                        '${data.catData?.data?[index].catImg}',
                                        fit: BoxFit.fill,
                                      ):ImageShimmer(height: 80.0,width: 100.0),
                                    ),
                                  ),
                                  CustomText(
                                    text: '${data.catData?.data?[index].catName}',
                                    size: 12,
                                    weight: FontWeight.w600,
                                  )
                                ],
                              )
                            : const CircularProgressIndicator();
                      }),
                ),
                 const Padding(
                   padding: EdgeInsets.only(top: 20,bottom: 10),
                   child: CustomText(
                    text: "Featured",
                    size: 14, weight: FontWeight.w700,
                ),
                 ),
                SizedBox(
                  height: 180,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: data.BannerData?.data?.sliderBanners?.length,
                      itemBuilder: (context, index) {
                        if (data.isBannerloading == false) {
                          return Padding(
                                padding: const EdgeInsets.only(
                                    left: 5, right: 5, bottom: 10),
                                child: Container(
                                  height: 200,
                                  decoration: const BoxDecoration(color: Colors.white),
                                  child: Column(
                                    children: [
                                      data.BannerData?.data?.featuredProducts?[index].image !=null?Image.network(
                                        '${data.BannerData?.data?.featuredProducts?[index].image}',
                                        height: 120,
                                        width: 200,
                                        fit: BoxFit.fill,
                                      ):ImageShimmer(height: 120.0,width: 200.0),
                                      Row(
                                        children: [
                                          const Icon(Icons.indeterminate_check_box,color: Colors.green,size: 20,),
                                          CustomText(text:  '${data.BannerData?.data?.featuredProducts?[index].name}',size: 12,weight: FontWeight.w600,),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          CustomText(text:  'ADD C\$ ${data.BannerData?.data?.featuredProducts?[index].specialPrice}',size: 12,weight: FontWeight.w600,color: Colors.red.shade900,),
                                          CustomText(text:  '  C\$ ${data.BannerData?.data?.featuredProducts?[index].price} ',size: 12,weight: FontWeight.w600,color: Colors.grey,),
                                          const CustomText(text:  '  Option \n available',size:8,weight: FontWeight.w600,color: Colors.grey,),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                        } else {
                          return const CircularProgressIndicator();
                        }
                      }),
                ),
                SizedBox(
                  height: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: data.BannerData?.data?.additionalBanners?[0].bannerImg !=null?
                    Image.network('${data.BannerData?.data?.additionalBanners?[0].bannerImg}'):ImageShimmer(height: 100.0,width: MediaQuery.of(context).size.width),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: SizedBox(
                    height: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: data.BannerData?.data?.additionalBanners?[1].bannerImg !=null?
                      Image.network('${data.BannerData?.data?.additionalBanners?[1].bannerImg}'):ImageShimmer(height: 100.0,width: MediaQuery.of(context).size.width),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20,bottom: 10),
                  child: CustomText(
                    text: "BestSeller",
                    size: 14, weight: FontWeight.w700,
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  itemCount: data.BannerData?.data?.bestsellerProducts?.length ?? 1,
                    itemBuilder: (context,index){
                  return data.isProductloading ==false?Padding(
                    padding: const EdgeInsets.only(top: 5,bottom: 5),
                    child: SizedBox(
                      height: 80,
                      child: ListTile(
                        leading: SizedBox(
                          height: 60,
                            width: 60,
                            child: data.BannerData?.data?.bestsellerProducts?[index].image !=null? Image.network('${data.BannerData?.data?.bestsellerProducts?[index].image}',fit: BoxFit.fill,):ImageShimmer(height: 50.0,width: 50.0)),
                        title: CustomText(text: '${data.BannerData?.data?.bestsellerProducts?[index].name}',size: 14,),
                        subtitle: SizedBox(
                          height: 40,
                          child: Row(
                            children: [
                              SizedBox(
                                height: 25,width: 55,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.red.shade900),
                                      onPressed: (){
                                      data.AddtoCart(data.BannerData?.data?.bestsellerProducts?[index].id,index);
                                      data.getTotalprice(data.BannerData?.data?.bestsellerProducts?[index].specialPrice !=0?data.BannerData!.data!.bestsellerProducts![index].specialPrice.toString():data.BannerData?.data?.bestsellerProducts?[index].price.toString());
                                      print(data.ProductID.toString());
                                      }, child: const CustomText(text: "ADD",size: 10,color: Colors.white,))),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      CustomText(text:  data.BannerData?.data?.bestsellerProducts?[index].specialPrice !=0?'  C\$ ${data.BannerData?.data?.bestsellerProducts?[index].specialPrice}' :'',size: 12,weight: FontWeight.w600,color: Colors.red.shade900,),
                                      data.BannerData?.data?.bestsellerProducts?[index].specialPrice !=0?CustomText(text:  ' C\$ ${data.BannerData?.data?.bestsellerProducts?[index].price}',size: 10,weight: FontWeight.w600,color: Colors.grey,textDecoration: TextDecoration.lineThrough,)
                                          :CustomText(text:  ' C\$ ${data.BannerData?.data?.bestsellerProducts?[index].price}',size: 12,weight: FontWeight.w600,color: Colors.red.shade900,
                                      ),
                                    ],
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: CustomText(text: "Option Available",size: 8.0,),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        trailing: IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_border))
                      ),
                    ),
                  ):const CircularProgressIndicator();
                }),
                const SizedBox(height: 30,),
              ],
            ),
          );
        }),
        bottomNavigationBar: Consumer<HomePageProvider>(
          builder: (context,data,child) {
            return data.ProductID.isNotEmpty?Container(
              height: 30,
              color: Colors.red.shade900,
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:  [
                   CustomText(text: '${data.ProductID.length} item(S) in cart C\$ ${data.TotalcartPrice}',size: 13,color: Colors.white,),
                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const CartView()));
                }, child: const CustomText(text: "View Cart",size: 13,color: Colors.white,))
                ],
              ),
            ):Container(
              height: 10,
            );
          }
        ),
      ),
    );
  }

  HomeAppBar() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 10, bottom: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(
            text: "Deliver to",
            size: 14,
          ),
          const CustomText(
            text: "Akhil Niagara Geln Nature Centre Niagra",
            size: 11,
            color: Colors.grey,
          ),
          Container(
            margin: const EdgeInsets.only(top: 5),
            height: 5,
            width: 100,
            color: Colors.red.shade900,
          )
        ],
      ),
    );
  }

}
