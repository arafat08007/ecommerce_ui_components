import 'package:flutter/material.dart';
import 'package:ecomuicomponents/Components/UIComponents.dart';
import 'package:ecomuicomponents/Components/constraints.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-commerce UI Components Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: ColorSchema.primaryColor),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Component home page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  TextEditingController searchTextController = TextEditingController();
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    double sW = MediaQuery.of(context).size.width;
    double sH = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: sW-15,
            height: sH,
            padding: const EdgeInsets.all(10) ,
            child: Center(
              // Center is a layout widget. It takes a single child and positions it
              // in the middle of the parent.

              child: Column(

                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  UIComponents.CustomSearch(50, sW-10, '', searchTextController, () { }, () { }, () { }),
                  Divider(),
                  UIComponents.SupportCard(60, sW-50, 'support', '01717998754', '01713060427', (){}, 'arafat.ba@pakizatvl.com',Colors.white)   ,
                  Divider(),
                  UIComponents.UserImageWithGreetings('Good Evening', 'https://picsum.photos/250?image=9', 'Tanveer'),
                  UIComponents.Btn_AddToCart('+ Add to cart ', () { })  ,
                  UIComponents.ProductCardnormal('https://picsum.photos/250?image=9', 'Demo product', '22', '989', '4.5', 100, 100,'EURO'),
              UIComponents.ProductCardColorSwitch('https://picsum.photos/250?image=9', 'Computer', '33.93', '100', '3.9', 200, 200, 5, 'USD')



                ],
              ),
            ),
          ),
        ),
      ),
    // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
