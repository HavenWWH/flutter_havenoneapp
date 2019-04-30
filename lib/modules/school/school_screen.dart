import 'package:flutter/material.dart';

typedef void CartChangeCallBack(Product product, bool inCart);

class Product {
  const Product({this.name});
  final String name;
}

const List<Product> _productsList = <Product>[

  const Product(name: 'Eggs'),
  const Product(name: 'Flour'),
  const Product(name: 'oranger'),
  const Product(name: 'fisher'),
  const Product(name: 'banana'),
  const Product(name: 'apple'),
];

class School_screen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('School_screen'),),
      body: SchoolPage(),
    );
  }
}

class SchoolPage extends StatefulWidget {
  SchoolPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _SchoolPageState createState() => _SchoolPageState();
}

class _SchoolPageState extends State<SchoolPage> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ShoppingList(
      products: _productsList,
    );
  }
}


// 商品列表
class ShoppingList extends StatefulWidget {
  ShoppingList({Key key, this.products}) : super(key: key);

  final List<Product> products;

  @override
  _ShoppingListState createState() => new _ShoppingListState();
}
class _ShoppingListState extends State<ShoppingList> {

  Set<Product> _shoppingCart = new Set<Product>();

  void _handleOnChanged(Product product, bool inCart) {
    setState(() {
      if (inCart) {

        _shoppingCart.add(product);
      } else {

        _shoppingCart.remove(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        color: Colors.white,
        padding: new EdgeInsets.symmetric(vertical: 8.0),
        child: new ListView(
          children: widget.products.map((Product product) {
            return new ShoppinglistItem(
              product: product,
              inCart: _shoppingCart.contains(product),
              onCartChanged: _handleOnChanged,
            );
          }).toList(),
        ),
      ),
    );
  }
}

// 商品列表行
class ShoppinglistItem extends StatelessWidget {

  ShoppinglistItem({Key key, this.product, this.inCart, this.onCartChanged}) : super(key: key);

  final Product product;
  final bool inCart;
  final CartChangeCallBack onCartChanged;

  Color _getColor(BuildContext context) {

    return inCart ? Colors.black38 : Theme.of(context).primaryColor;
  }

  TextStyle _getTextStyle(BuildContext context) {

    if(!inCart) return new TextStyle(
      color: Colors.orange,
      fontSize: 20,
    );
    return new TextStyle(
      color: Colors.black38,
      fontSize: 14,
      decoration: TextDecoration.lineThrough,
    );
  }

  // 弹窗
  void _showAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
            title: new Text("Dialog Title"),
            content: new Text("This is my content"),
            actions:<Widget>[
              new FlatButton(child:new Text("CANCEL"), onPressed: (){
//                  Navigator.pop(context);
              },),
              new FlatButton(child:new Text("OK"), onPressed: (){
//                  Navigator.pop(context);
              },)
            ]

        ));
  }

  void _buttonClickT() {

    print('888');
  }

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      onTap: () {
        onCartChanged(product, !inCart);
      },
      leading: new CircleAvatar(
        backgroundColor: _getColor(context),
        child: new Text(
          product.name[0],
          style: new TextStyle(
            fontSize: 20,
            color: Colors.black54),
        ),
      ),
      trailing: new RaisedButton(
        color: Colors.cyanAccent,
        onPressed: () {
          _showAlert(context);
        },
        child: new Text(
          product.name,
          style: new TextStyle(fontSize: 14, color: Colors.black38),
        ),
      ),
      title: new Text(product.name, style: _getTextStyle(context)),
      subtitle: new Text(
        '数量 10',
        style: new TextStyle(fontSize: 14, color: Colors.black38),
      ),
    );
  }
}