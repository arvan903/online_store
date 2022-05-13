import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:online_store/routes/const.dart';
import '../widgets/customactionbar.dart';

class MainHome extends StatelessWidget {
  MainHome({Key? key}) : super(key: key);

  final Stream<QuerySnapshot> _product =
      FirebaseFirestore.instance.collection('products').snapshots();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          StreamBuilder(
            stream: _product,
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              //if connection has error
              if (snapshot.hasError) {
                return Center(
                  child: Text('Error ${snapshot.error}'),
                );
              }
              // if connection is loading ;
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Center(
                child: Container(
                  child: ListView(
                      children:
                          snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data()! as Map<String, dynamic>;
                    return Center(
                        child: Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 13.0, horizontal: 23.0),
                          width: double.infinity,
                          height: 500.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12)),
                          child: Center(
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(
                                    data['image'][3],
                                    fit: BoxFit.cover,
                                  ))),
                        ),
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(3.0),
                                ),
                                child: Text(
                                  data['name'],
                                  style: Constans.textStyleOne,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(3.0),
                                ),
                                child: Text(data['price'].toString(),
                                    style: Constans.textStyleOne),
                              ),
                            ],
                          ),
                        )
                      ],
                    ));
                  }).toList()),
                ),
              );
            },
          ),
          CAB(
            number: '0',
            title: 'Home',
          ),
        ],
      ),
    );
  }
}
