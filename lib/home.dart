import 'package:flutter/material.dart';

import 'package:expanding_card_animation/details.dart';
import 'package:expanding_card_animation/models/item.dart';

class Home extends StatelessWidget {
  List<Item> listItems = [
    Item(
        id: 1,
        title: 'Title 1',
        subTitle: 'SubTitle 1',
        details: 'Details 1',
        img:
            'https://d1fmx1rbmqrxrr.cloudfront.net/cnet/i/edit/2019/04/eso1644bsmall.jpg'),
    Item(
        id: 2,
        title: 'Title 2',
        subTitle: 'SubTitle 2',
        details: 'Details 2',
        img:
            'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg'),
    Item(
        id: 3,
        title: 'Title 3',
        subTitle: 'SubTitle 3',
        details: 'Details 3',
        img: 'https://miro.medium.com/max/1200/1*mk1-6aYaf_Bes1E3Imhc0A.jpeg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home screen'),
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(40, 10, 40, 0),
        child: ListView.builder(
            itemCount: listItems.length,
            itemBuilder: (BuildContext c, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Details(listItems[index])),
                  );
                },
                child: Card(
                  elevation: 7,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.grey[400], width: 1.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: Column(
                    children: [
                      //Wrap the image widget inside a Hero widget
                      Hero(
                        //The tag must be unique for each element, so we used an id attribute
                        //in the item object for that
                        tag: '${listItems[index].id}',
                        child: Image.network(
                          "${listItems[index].img}",
                          scale: 1.0,
                          repeat: ImageRepeat.noRepeat,
                          fit: BoxFit.fill,
                          height: 250,
                        ),
                      ),
                      Divider(
                        height: 10,
                      ),
                      Text(
                        listItems[index].title,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
