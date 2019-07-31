import 'item.dart';
import 'meta.dart';

class ShoppiingCart extends Meta {
  String name;
  DateTime date;
  String code;
  List<Item> booking;

  double get price =>booking.reduce((value,element)=>value+element).price;


  ShoppiingCart({name}):this.withCode(name:name,code:null);

  ShoppiingCart.withCode({name, this.code})
      : date = DateTime.now(),
        super(0, name);

  getInfo()=>'''
     购物车信息
     --------------------
     用户名: $name 
     优惠码: ${code??"没有"} 
     总价: $price
     Date :$date

     
     -------------
  
  ''';


}
