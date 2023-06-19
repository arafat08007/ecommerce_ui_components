


import 'package:flutter/material.dart';
import 'package:qr_code_dart_scan/qr_code_dart_scan.dart';
import 'dart:ui';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constraints.dart';
import 'package:url_launcher/url_launcher.dart';
 class UIComponents {
   //custom search bar
 //  static TextEditingController _searchTextController = TextEditingController();
 //  static FocusNode _searchFocusNode = FocusNode();
   Color cardContentColor = Colors.white;
   static Widget CustomSearch(double barH, double barW, String placeholder, TextEditingController _searchTextController, VoidCallback onMenuClick, VoidCallback onQRClick, VoidCallback onTextChange ){

     
            return Container(
              width: barW,
              height: barH,
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              color: ColorSchema.ligthBg,
                child: TextField(
                  controller: _searchTextController,
                  decoration: InputDecoration(
                    hintText: placeholder!=null?placeholder:'Search here',
                    prefixIcon: IconButton(
                      icon: Icon(Icons.menu_sharp),
                      onPressed: () {
                        onMenuClick;
                        print('Menu clicked') ;
                        // Perform the search here
                      },
                    ),
                    suffixIcon: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween, // added line
                      mainAxisSize: MainAxisSize.min, // added line
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.clear_sharp),

                          onPressed: () {
                            _searchTextController.clear()  ;
                            print('Clearing search bar') ;
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.qr_code),
                          onPressed: () {
                            ScanQRCode;
                            print('QR code clicked') ;
                            }
                        ),
                      ],
                    ),


                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(color: ColorSchema.ligthBg),

                    ),
                  ),
                )
            );
   }
// Scan QR code
   static Widget ScanQRCode () {
     return QRCodeDartScanView(
         scanInvertedQRCode:true,
         typeScan: TypeScan.live,
       onCapture: (Result result){
           print(result);
       },


     );
   }
   //Support card
   static Widget SupportCard(double sH, double sW, String backgroundImg, String whatsappnum, String phonenum, VoidCallback chatscreen, String emailintent, cardContentColor){
     return Container(

       decoration: BoxDecoration(
         color: Colors.white,
         borderRadius: BorderRadius.circular(5.0),
         boxShadow:     [
           BoxShadow(color: Colors.black12.withOpacity(0.02), spreadRadius: 3),
         ],
         image: DecorationImage(
           image: AssetImage("assets/images/${backgroundImg}.jpg"),
           fit: BoxFit.fill,
         ),

       ),
       width: sW,
         height: sH,
         padding: EdgeInsets.all(5),

         child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceAround,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
           Text ('Need support?', style: TextStyle(color: cardContentColor),),
             _separator(0,5),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween, // added line
               mainAxisSize: MainAxisSize.min,
               children: [
                 IconButton(onPressed: (){
                   String url =
                       "https://wa.me/${whatsappnum}/?text=Greetings!";
                   launch(url);

                 }, icon:FaIcon(FontAwesomeIcons.whatsapp,color: cardContentColor)),
                 IconButton(
                     onPressed: () async {
                       final Uri launchUri = Uri(
                         scheme: 'tel',
                         path: phonenum,
                       );
                       await launchUrl(launchUri);
                     },
                     icon:Icon(Icons.call, color: cardContentColor,)
                 ),
                 IconButton(
                     onPressed: () async{

                     },
                     icon:Icon(Icons.chat, color: cardContentColor)
                 ),
                 IconButton(onPressed: (){
                   final Uri emailLaunchUri = Uri(
                     scheme: 'mailto',
                     path: emailintent,
                     // query: encodeQueryParameters(<String, String>{
                     //   'subject': 'Example Subject & Symbols are allowed!',
                     //
                     // }),
                   );

                   launchUrl(emailLaunchUri);
                 }, icon:Icon(Icons.email_rounded, color: cardContentColor)),

             ],)
         ],)
     );
   }

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
  static Widget _separator (double Hspace, double Wspace){
    return SizedBox(height: Hspace, width: Wspace,)  ;
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
              fit: BoxFit.cover,
            ),
            _separator(5,0),
              Text(productName!=null?productName:'No product name found',style: TextStyle(fontWeight: FontWeight.bold)),
              _separator(5,0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              PriceTag(price, Currency)  ,
              Text('|'),
              SoldCount(soldcount),
              Text('|'),
              RatingTag(rating, 14.0),

            ],),
            _separator(5,0),
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
              _separator(5,0),
              Text(productName!=null?productName:'No product name found', style: TextStyle(fontWeight: FontWeight.bold),),
              _separator(5,0),
              Divider(),
              _separator(3,0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                Text('Color Swatch show here'),

              ],),
              _separator(3,0),
              Divider(),
              _separator(5,0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RatingTag(rating,14)  ,

                  Text('|'),
                  SoldCount(soldcount),

                ],),
              _separator(5,0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  PriceTag(price, Currency)  ,
                  Text('|'),
                  Btn_IconAddToCart('Add to cart', () { })

                ],),
              _separator(5,0),




            ],),
        ),
      ),
    );

  }
    // User image with greeting text
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