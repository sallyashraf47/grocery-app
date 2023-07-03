import 'package:badges/badges.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:cource/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

import '../consts/contss.dart';
import '../providers/cart_provider.dart';





class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(height:300,),
        ClipPath(
          clipper:OvalBottomBorderClipper() ,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Container(height:290,
decoration: BoxDecoration(
 // borderRadius: BorderRadius.only(bottomRight: Radius.circular(40),bottomLeft: Radius.circular(40)),
  color: Color(0xff277747)
),
              padding:
              EdgeInsets.symmetric(horizontal: (10),vertical: 15),
              child:
              Column(

                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Happy Healty",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,
                        fontSize: 20,letterSpacing: 2
                      ),),
                      Image.asset("assets/images/Vector.png")
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(


                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SearchField(),
                    Icon( IconlyLight.bag,color: Colors.white),
                      GestureDetector(
                        onTap: () {

                        },
                        child:
                        Consumer<CartProvider>(builder: (context, myCart, child) {
                          return Badge(
                            position: BadgePosition.topEnd(top: -7, end: -7),
                            badgeContent:
                            TextWidget(
                                text: myCart.getCartItems.length.toString(),
                                color: Colors.white,
                                textSize: 15),
                            child: Icon(
                                 IconlyLight.buy ,color: Colors.white),);
                        }),
                      ),

                    ],
                  ),


             ]   ),
        ),
        ) ,
        Positioned(

          right: 20,
          left: 20,
          top: 125,

          child:
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.21,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(30.0)),
              child: Swiper(
                  itemCount: Constss.offerImages.length,
                  autoplay: true,
                  itemBuilder: (context, index) => Image.asset(
                    Constss.offerImages[index],
                    fit: BoxFit.fill,
                  ),
                  pagination: const SwiperPagination(
                      alignment: Alignment.bottomCenter,
                      builder: DotSwiperPaginationBuilder(
                          color: Colors.white, activeColor: Color(0xff5D9C59))),
                  duration: 20),
            ),
          ),),
      ],
    );
  }


}
class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        onChanged: (value) => print(value),
        decoration: const InputDecoration(

            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintText: "Search for fruits, vegetables, groce...",
            prefixIcon: Icon(Icons.search)),
      ),
    );
  }
}

