import 'meta.dart';

class Item extends Meta{
  double price;
  String name;

  Item(name,price)  : super (name,price);


  Item operator+(Item item)=>Item(name+item.name,price+item.price);

}