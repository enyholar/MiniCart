import 'package:MiniCart/model/Product.dart';
import 'package:MiniCart/screen/ProductDetailPage.dart';
import 'package:MiniCart/utils/colors.dart';
import 'package:MiniCart/utils/products.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  ProductPage({Key key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage>{
  String itemSelectedCount = "0";
  Size screenSize;
  ColorUtils colorUtils = ColorUtils();

  Widget itemProductWidget(Product product){
    return Container(
      padding: const EdgeInsets.only(right: 8.0, left: 8.0),
      height: 60,
      child: Card(
        color: Colors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5)),
        child: Container(
          width: screenSize.width,
          child: Row(
            children: <Widget>[
               Container(
                 width: screenSize.width * 0.4,
                   margin: EdgeInsets.only(left: 8),
                   child: Text(product.name, style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500, fontSize: 16),)
               ),
               Text(product.price,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500, fontSize: 16)),
               Checkbox(
                 checkColor: Colors.black,
                  activeColor: Colors.grey,
                  value: product.isCheck,
                  onChanged: (bool value) {
                    setState(() {
                      product.isCheck = value;
                      itemSelectedCount = productList.where((p) => p.isCheck == true).toList().length.toString();
                    });
                  }),
              FlatButton(onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context){
                      return ProductDetailPage(product: product,itemCount: itemSelectedCount,);
                    },
                  ),
                );
              },
                  color: colorUtils.colorFromHex("C4C4C4"),
                  child: Text("View")),
              SizedBox(width: 8,)
            ],
          ),
        )
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: false,
        title: Text("MiniCart"),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Text(itemSelectedCount, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)

          )

        ],),
      body: Container(
        color:colorUtils.colorFromHex("EDEDED"),
        width: screenSize.width,
        child: Column(children: [
          SizedBox(height: 20,),
          Align(
            alignment: Alignment.topCenter,
             child: Text("Product", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
          ),
          SizedBox(height: 20,),
          ListView.builder(
            shrinkWrap: true,
            itemCount: productList.length,
            itemBuilder: (BuildContext context, int index) {
              return itemProductWidget(productList[index]);
            },

          )

        ],),
      ),
    );
  }

}