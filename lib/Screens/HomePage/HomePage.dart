import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Modal/modal.dart';
import '../../Provider/quotes_provider.dart';

class QuotePage extends StatelessWidget {
  const QuotePage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    QuotesProvider quotesProviderTrue =
        Provider.of<QuotesProvider>(context, listen: true);
    QuotesProvider quotesProviderFalse =
        Provider.of<QuotesProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: Icon(
          Icons.menu,
          color: Colors.white,
          size: 25,
        ),
        title: Text(
          'Quotes',
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),
        ),
        actions: [
          Icon(
            Icons.search,
            size: 25,
            color: Colors.white,
          ),
          SizedBox(
            width: width * 0.06,
          ),
        ],
      ),
      body: Container(
        height: height * double.infinity,
        width: width * double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/img/fav.jpg'), fit: BoxFit.cover)),
        child: FutureBuilder(
          future:
              Provider.of<QuotesProvider>(context, listen: false).FromJson(),
          builder: (context, snapshot) {
            QuotesModal? apiModal = snapshot.data;
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: apiModal!.quotes.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(color: Colors.black12),
                          ],

                        ),
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(
                                '${apiModal.quotes[index].quote}',
                                style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: Colors.black),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // SizedBox(width: width * 0.01,),
                                 InkWell(onTap: () {
                                   FavList2.add(quotesProviderTrue
                                       .quotesModal!.quotes[index].quote);
                                   print(FavList2);
                                 },child: Text('   Fav',style: TextStyle(fontSize: 20),)),
                                Text(
                                  '-${apiModal.quotes[index].author}  ',
                                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ],
                        )
                      ),
                    )
                  ],
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/fav');
        },
        child: Icon(Icons.favorite),
      ),
    );
  }
}

var selectIndex = 0;
List <dynamic> FavList2 = [];
