import 'package:flutter/material.dart';
import 'package:ktzh_app/model/product_model.dart';
import 'package:ktzh_app/widgets/product_page_widgets.dart';

class ProductPage extends StatefulWidget {
  final Product product;

  const ProductPage({Key key, this.product}) : super(key: key);
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            productDetails(),
            SizedBox(
              height: 50,
            ),
            orderTimeLine()
          ],
        ),
      ),
    );
  }
}
