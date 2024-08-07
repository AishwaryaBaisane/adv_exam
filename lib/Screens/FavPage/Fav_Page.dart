import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Provider/quotes_provider.dart';
import '../HomePage/HomePage.dart';

class FavPage extends StatelessWidget {
  const FavPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    QuotesProvider productProviderTrue =
        Provider.of<QuotesProvider>(context, listen: true);
    QuotesProvider productProviderFalse =
        Provider.of<QuotesProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: height * double.infinity,
          width: width * double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/img/fav.jpg'), fit: BoxFit.fill),
          ),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.1,
                ),
                ...List.generate(
                  FavList2.length,
                  (index) => Row(
                    children: [
                      SizedBox(width: width * 0.05,),
                      Container(
                        width: width * 0.8,
                        child: Text(
                          textAlign: TextAlign.center,
                          '${FavList2[index]}',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          FavList2.removeAt(index);
                        },
                        icon: Icon(
                          Icons.delete_outline,
                          size: 30,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
