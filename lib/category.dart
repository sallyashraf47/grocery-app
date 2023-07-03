import 'package:flutter/material.dart';


import 'consts/contss.dart';

class Category extends StatelessWidget {
  const Category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left:20.0,right: 20),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("Categories", style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w400)),
            TextButton(
                child: Text(" See all",
                    style: Theme.of(context).textTheme.bodyText2),
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Category(),
                    ))),
          ]),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
                Constss.categoryList.length,
                    (index) => Column(children: [
                  Container(
                    height: 53,
                    width: 54,
                    padding: EdgeInsets.all(5),
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xff4CAD73).withOpacity(0.2),
                    ),
                    child: Image.asset(
                      Constss.categoryList[index]['imgPath'],
                    ),
                  ),
                  Text(
                    Constss.categoryList[index]['catText'],
                    style: const TextStyle(fontSize: 10),
                  )
                ])),
          ),
        ),
      ],
    );
  }
}
