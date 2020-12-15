import 'package:flutter/material.dart';
import 'package:getmoneyxapp/shared/data/data.dart';
import 'package:getmoneyxapp/shared/data/model.dart';

class ReusableReport extends StatelessWidget {
//  final handlePlaceChanged;
  final showHorizontalGridView;

  ReusableReport({this.showHorizontalGridView = false});

  @override
  Widget build(BuildContext context) {
    int itemCount;
    Axis axisDirection; // use for scroll vertical or horizontal
    // if showHorizontalGridView = true
    if (showHorizontalGridView) {
      // horizontal gallery
      itemCount = 2; // single row gallery
      axisDirection = Axis.horizontal;
    } else {
      // vertical gallery
      itemCount = 2; // two columns gallery
      axisDirection = Axis.vertical;
    }
    return Container(
      child: GridView.count(
        crossAxisCount: itemCount,
        scrollDirection: axisDirection,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        padding: EdgeInsets.all(8),
        childAspectRatio: 1 / 0.8,
        children: gridItems(),
      ),
    );
  }

  List<Widget> gridItems() {
    return Data().getInfo().map<Widget>((data) => _GridItem(data)).toList();
  }
}

class _GridItem extends StatelessWidget {
  _GridItem(this.data);

  final CardReport data;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      child: InkWell(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                data.price.toString(),
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),

              ),
              SizedBox(height: 10,),
              Text(
                data.phoneNumber.toString(),
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),

              ),
            ],
          ),
        ),
      ),
    );
  }
}
