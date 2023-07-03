import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:cource/inner_screens/feeds_screen.dart';
import 'package:cource/inner_screens/on_sale_screen.dart';
import 'package:cource/provider/dark_theme_provider.dart';
import 'package:cource/services/utils.dart';
import 'package:cource/widgets/text_widget.dart';
import 'package:provider/provider.dart';

import '../category.dart';
import '../consts/contss.dart';
import '../models/products_model.dart';
import '../providers/products_provider.dart';
import '../services/global_methods.dart';
import '../widgets/cusom_app_bar.dart';
import '../widgets/feed_items.dart';
import '../widgets/on_sale_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    final themeState = utils.getTheme;
    final Color color = Utils(context).color;
    Size size = utils.getScreenSize;
    final productProviders = Provider.of<ProductsProvider>(context);
    List<ProductModel> allProducts = productProviders.getProducts;
    List<ProductModel> productsOnSale = productProviders.getOnSaleProducts;
    return  SafeArea(
      child: Scaffold(appBar: const PreferredSize(
       preferredSize: Size.fromHeight(300),
        child: HomeHeader(),
      ),
        drawer: Drawer(


        ),
        body: SingleChildScrollView(
          child: Column(

            children: [
          //   HomeHeader(),



              Category(),
              SizedBox(height: 2,),
              Divider(
                thickness: 1,
              ),
              Padding(
                padding: const EdgeInsets.only(left:20,right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                      Text("ON SALE",style: TextStyle(color: Colors.red,fontSize: 18,fontWeight: FontWeight.bold)

                      ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Icon(
                          IconlyLight.discount,
                          color: Colors.red,
                        ),


                      ],
                    ),
                    // const Spacer(),
                    TextButton(
                      onPressed: () {
                        GlobalMethods.navigateTo(
                            ctx: context, routeName: FeedsScreen.routeName);
                      },
                      child: TextWidget(
                        text: 'See all',
                        maxLines: 1,
                        color: color,
                        textSize: 15,
                      ),
                    ),
                  ],
                ),
              ),

                     SizedBox(
                      height: size.height * 0.21,
                      child: ListView.builder(
                          itemCount: productsOnSale.length < 10
                              ? productsOnSale.length
                              : 10,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (ctx, index) {
                            return ChangeNotifierProvider.value(
                                value: productsOnSale[index],
                                child: const OnSaleWidget());
                          }),

              ),
              Divider(
                thickness: 1,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0,right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Our products",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w400)

                    ),
                    // const Spacer(),
                    TextButton(
                      onPressed: () {
                        GlobalMethods.navigateTo(
                            ctx: context, routeName: FeedsScreen.routeName);
                      },
                      child: TextWidget(
                        text: 'See all',
                        maxLines: 1,
                        color: color,
                        textSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                padding: EdgeInsets.zero,
                // crossAxisSpacing: 10,
                childAspectRatio: size.width / (size.height * 0.59),
                children: List.generate(
                    allProducts.length < 4
                        ? allProducts.length // length 3
                        : 4, (index) {
                  return ChangeNotifierProvider.value(
                    value: allProducts[index],
                    child: const FeedsWidget(),
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
