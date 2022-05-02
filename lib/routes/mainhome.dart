import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
                  child: Text('ProductName : Shoes'),
                ),
              );
            },
          ),
          Center(child: Text('HomePage')),
          CAB(
            number: '0',
            title: 'Home',
          ),
        ],
      ),
    );
  }
}
