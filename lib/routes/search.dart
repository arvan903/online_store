import 'package:flutter/material.dart';

import '../widgets/customactionbar.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Center(
            child: Text('Search'),
          ),
          CAB(
            number: '0',
            title: 'Search',
          ),
        ],
      ),
    );
  }
}
