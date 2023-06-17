
import 'package:flutter/material.dart';

import 'constraints.dart';
 class UIComponents {
  static Widget Btn_AddToCat (String label, VoidCallback  onPressed) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(

          style: ElevatedButton.styleFrom(

            backgroundColor: ColorSchema.primaryBtn3, // background (button) color
            foregroundColor: Colors.white, // foreground (text) color
          ),
          onPressed: onPressed,
          child: Text(label)
      ),
    );
  }
  static Widget Btn_IconAddToCart (String label, VoidCallback  onPressed) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(
        Icons.shopping_cart_rounded,
        size: 24.0,
      ),
      label: Text(label!=null?label:'Add to cart'),
    );
  }
  static Widget Btn_IconOutLine (String label, VoidCallback  onPressed) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: Icon(
        Icons.shopping_cart_rounded,
        size: 24.0,
      ),
      label:Text(label!=null?label:'Add to cart'),
    );
  }
  static Widget Btn_Default (String label, VoidCallback  onPressed) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(

          style: ElevatedButton.styleFrom(

            backgroundColor: ColorSchema.primaryBtn1, // background (button) color
            foregroundColor: Colors.white, // foreground (text) color
          ),
          onPressed: onPressed,
          child: Text(label!=null?label:'Add to cart')
      ),
    );
  }
  //Use to show price with uro
  static Widget PriceTag (String price, String currency){
    if(currency!=null && currency =='EURO') {
      return Text(price != null ? '£' + price : '£ 0.0');
    }
    else if (currency!=null && currency =='USD')  {
      return Text(
          price!=null?
          (String.fromCharCodes(new Runes('\u0024'))+''+price)
              :(String.fromCharCodes(new Runes('\u0024'))+'0.0')
      );
    }
    else if (currency!=null && currency =='BDT')  {
      return Text(
          price!=null?
          (String.fromCharCodes(new Runes('\u09F3'))+''+price)
              :(String.fromCharCodes(new Runes('\u09F3'))+'0.0')
      );
    }
    else
      return Text(price);


  }
  static Widget SoldCount (String count){
    return Container(
      color: Colors.white,
      child: Padding(
          padding: EdgeInsets.all(3),
          child
              : Text (count, style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black54),)
      ),
    );
  }
  static Widget RatingTag (String rating, double Size) {
    return   RichText(
      text: TextSpan(
        children: [

          WidgetSpan(
            child: Icon(Icons.star_half, size: Size, color: ColorSchema.primaryGrey),
          ),
          TextSpan(
            text: "rating",
          ),
        ],
      ),
    );

  }
  static Widget _separtor (double space){
    return SizedBox(height: space)  ;
  }
  static Widget ProductCardnormal(String imagepath, String productName, String price, String soldcount, String rating, double height, double width){
    return Padding(
      padding: EdgeInsets.all(5),
      child: Center(
        child: Card(
          semanticContainer: true,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FadeInImage.assetNetwork(
                width: 100,
                height: 100,
                placeholder: 'assets/no_image.png',
              image: imagepath,
              fit: BoxFit.fill,
            ),
            _separtor(5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              PriceTag('25', 'EURO')  ,
              Text('|'),
              SoldCount('229'),
              Text('|'),
              RatingTag('4.5', 14.0),

            ],),
            _separtor(5),
            Btn_AddToCat('Add to cart', () {

            })   ,



          ],),
        ),
      ),
    );

  }


}