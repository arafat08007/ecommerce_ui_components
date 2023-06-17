
import 'package:flutter/material.dart';

import 'constraints.dart';
 class UIComponents {
   // Default Add to cart without icon
  static Widget Btn_AddToCart (String label, VoidCallback  onPressed) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(


          style: ElevatedButton.styleFrom(

            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.0), // <-- Radius
            ),

            backgroundColor: ColorSchema.primaryBtn3, // background (button) color
            foregroundColor: ColorSchema.ThemeBlack, // foreground (text) color
          ),
          onPressed: onPressed,
          child: Text(label)
      ),
    );
  }
  // Default Add to cart with icon
  static Widget Btn_IconAddToCart (String label, VoidCallback  onPressed) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(
        Icons.shopping_cart_rounded,
        size: 24.0,
        color: ColorSchema.primaryColor,
      ),
      label: Text(label!=null?label:'Add to cart'),
    );
  }
  // Default Add to cart with  icon    & outline
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
  // Default button
  static Widget Btn_Default (String label, VoidCallback  onPressed) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(

          style: ElevatedButton.styleFrom(

            backgroundColor: ColorSchema.primaryBtn1, // background (button) color
            foregroundColor: Colors.white, // foreground (text) color
          ),
          onPressed: onPressed,
          child: Text(label!=null?label:'Action button')
      ),
    );
  }
  //Use to show price with Euro/USD/BDT
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
  // Item sold count
  static Widget SoldCount (String count){
    return Container(
      color: Colors.white,
      child: Padding(
          padding: EdgeInsets.all(3),
          child
              : Text (count+' sold', style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black54),)
      ),
    );
  }
  // Item rating
  static Widget RatingTag (String rating, double Size) {
    return   Container(
      margin:   EdgeInsets.only(left: 10, right: 10),
      child: RichText(
        text: TextSpan(
          children: [

            WidgetSpan(
              child: Icon(Icons.star_half, size: Size, color: ColorSchema.primaryGrey),
            ),
            TextSpan(
              style: TextStyle(color: ColorSchema.ThemeBlack),
              text: rating,

            ),
          ],
        ),
      ),
    );

  }
  //Dynamic separetor
  static Widget _separtor (double space){
    return SizedBox(height: space)  ;
  }
  // Product Card
  static Widget ProductCardnormal(String imagepath, String productName, String price, String soldcount, String rating, double imgH, double imgW, String Currency){
    return Padding(
      padding: EdgeInsets.all(10),
      child: Center(
        child: Card(
          semanticContainer: true,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FadeInImage.assetNetwork(
                width: imgW,
                height: imgH,
                placeholder: 'assets/no_image.png',
              image: imagepath,
              fit: BoxFit.contain,
            ),
            _separtor(5),
              Text(productName!=null?productName:'No product name found',style: TextStyle(fontWeight: FontWeight.bold)),
              _separtor(5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              PriceTag(price, Currency)  ,
              Text('|'),
              SoldCount(soldcount),
              Text('|'),
              RatingTag(rating, 14.0),

            ],),
            _separtor(5),
            Btn_AddToCart('Add to cart', () {

            })   ,



          ],),
        ),
      ),
    );

  }
  // Product card with color swatch (modify if needed)
  static Widget ProductCardColorSwitch(String imagepath, String productName, String price, String soldcount, String rating, double imgH, double imgW, int countColorSwitch, String Currency){
    return Padding(
      padding: EdgeInsets.all(5),
      child: Center(
        child: Card(
          semanticContainer: true,
          elevation: 0,
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
                fit: BoxFit.contain,
              ),
              _separtor(5),
              Text(productName!=null?productName:'No product name found', style: TextStyle(fontWeight: FontWeight.bold),),
              _separtor(5),
              Divider(),
              _separtor(3),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                Text('Color Swatch show here'),

              ],),
              _separtor(3),
              Divider(),
              _separtor(5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RatingTag(rating,14)  ,

                  Text('|'),
                  SoldCount(soldcount),

                ],),
              _separtor(5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  PriceTag(price, Currency)  ,
                  Text('|'),
                  Btn_IconAddToCart('Add to cart', () { })

                ],),
              _separtor(5),




            ],),
        ),
      ),
    );

  }

  static Widget UserImageWithGreetings(String grettingText, String UserImage, String UserName) {
    return Container(
      width: 200,
      child: Row (
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            radius: 48, // Image radius
          
            backgroundImage: NetworkImage(UserImage),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text(grettingText!=null?grettingText:'Greetings!',style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal))   ,
             Text(UserName!=null?UserName:'User Name not found', style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal),)   ,
          ],)

      ],) ,

    )     ;


  }

 }