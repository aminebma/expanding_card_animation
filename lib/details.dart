import 'package:flutter/material.dart';

import 'package:expanding_card_animation/models/item.dart';

class Details extends StatelessWidget {
  final Item item;

  Details(this.item);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Hero(
                //Make sure you have the same id associated to each element in the
                //source page's list
                tag: '${item.id}',
                child: Image.network(
                  "${item.img}",
                  scale: 1.0,
                  repeat: ImageRepeat.noRepeat,
                  fit: BoxFit.fitWidth,
                  height: MediaQuery.of(context).size.height / 3,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ListTile(
                title: Text(
                  item.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                subtitle: Text(item.subTitle),
              ),
              Divider(
                height: 20,
                thickness: 1,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  item.details,
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
