import 'package:flutter/material.dart';

class Product {
  const Product({this.name, this.price});
  final String name;
  final double price;
}

typedef void CartChangedCallback(Product product, bool inCart);

class ShoppingListItem extends StatelessWidget {
  ShoppingListItem({this.product, this.inCart, this.onCartChanged}): super(key: ObjectKey(product));
  final Product product;
  final bool inCart;
  final CartChangedCallback onCartChanged;

  Color _getColor(BuildContext context) {
    return inCart ? Colors.black54 : Theme.of(context).primaryColor;
  }

  TextStyle _getTextStyle(BuildContext context) {
    if(!inCart) return null;
    return TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){
        onCartChanged(product, inCart);
      },
      leading: CircleAvatar(
        backgroundColor: _getColor(context),
        child: Text(product.name[0]),
      ),
      title: Text(product.name, style: _getTextStyle(context),),
      trailing: Text('¥${product.price}'),
    );
  }
}

class ShoppingList extends StatefulWidget {
  ShoppingList({Key key, this.products}): super(key: key);
  final List<Product> products;
  @override
  _ShoppingListState createState() => new _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  Set<Product> _shoppingCart = Set<Product>();

  void _handleCartChanged(Product product, bool inCart) {
    setState(() {
      if(!inCart) {
        _shoppingCart.add(product);
      } else {
        _shoppingCart.remove(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping List'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: ListView.separated(
              itemCount: widget.products.length,
              padding: EdgeInsets.symmetric(vertical: 8.0),
              separatorBuilder: (context, index) => Divider(height: 1.0,),
              itemBuilder: (context, index) {
                return ShoppingListItem(
                  product: widget.products[index],
                  inCart: _shoppingCart.contains(widget.products[index]),
                  onCartChanged: _handleCartChanged,
                );
              },
            ),
          ),
          Container(
            height: 100.0,
            decoration: BoxDecoration(border: Border(top: BorderSide(color: Colors.black54))),
            child: ListTile(
                title: Text('总价格: ¥${widget.products.fold(0.00, (preItem, item) => preItem + (_shoppingCart.contains(item) ? 0 : item.price))}',textAlign: TextAlign.right,)
            ),
          )
        ],
      )
    );
  }
}