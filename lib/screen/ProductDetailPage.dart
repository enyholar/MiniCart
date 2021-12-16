import 'package:MiniCart/model/Product.dart';
import 'package:MiniCart/utils/colors.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  String itemCount;
  Product product;
  ProductDetailPage({Key key, this.itemCount, this.product}) : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage>{

  ColorUtils colorUtils = ColorUtils();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text("MiniCart"),
        automaticallyImplyLeading: false,
        centerTitle: false,
        backgroundColor: Colors.black,
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Text(widget.itemCount, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)
          )
        ],),

      body: Container(
        width: screenSize.width,
        height: screenSize.height,
        color: colorUtils.colorFromHex("EEEEEE"),
        child: Column(children: [
          SizedBox(height: 40,),
          Align(
            alignment: Alignment.topCenter,
            child: Text(widget.product.name, style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),) ,
          ),
          // Flexible(child:
          // ),
          Container(
            margin: EdgeInsets.only(left: 16, right: 16, top: 40),
            child: Row(children: [

            Text("Name:", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),),
              SizedBox(width: 4,),
              Text(widget.product.name, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),) ,

            ],),
          ),
          Container(
            margin: EdgeInsets.all(16),
            child: Row(children: [

              Text("Price:", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),),
              SizedBox(width: 4,),
              Text(widget.product.price, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),) ,

            ],),
          ),
          SizedBox(height: 20,),
          FlatButton(onPressed: (){
           Navigator.pop(context);
          },
              color: colorUtils.colorFromHex("C4C4C4"),
              child: Text("Back to Products"))
        ],),
      ),
    );
  }

}