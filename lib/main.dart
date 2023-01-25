import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget{
  const Home({Key? key}) : super(key:key);
  MySnackBar(message,context){
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message))
    );
  }
  MyAlertDialog(context){
    return showDialog(
        context: context,
        builder: (BuildContext context){
          return Expanded(
              child: AlertDialog(
                title: Text('Buy Product Alert! '),
                content: Text('Do you really buy this product?'),
                actions: [
                  TextButton(onPressed: (){
                    MySnackBar("Product has been added to cart.", context);
                    Navigator.of(context).pop();
                  }, child: Text("Yes")),
                  TextButton(onPressed: (){Navigator.of(context).pop();}, child: Text("No")),
                ],
              )
          );
        }
    );
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Home Screen'),
            Padding(
              padding: EdgeInsets.all(30),
              child: SizedBox(
                width: 170,
                height: 170,
                child: CircleAvatar(
                  backgroundImage: NetworkImage("https://www.adlibbd.com/assets_front/images/banner/9628e4bd494b6c503fd82de6a4761968.jpg"),
                  radius: 45,
                ),
              ),
            ),
            ElevatedButton(onPressed: (){
               MyAlertDialog(context);
            }, child: Text('Buy Now')),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.all(0),
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: Colors.lightBlueAccent),
                  accountName: Text("Amranur Rahman",style: TextStyle(color: Colors.black87),),
                  accountEmail: Text("amranwebdeveloper@gmail.com"),
                  currentAccountPicture: Image.network("http://amranwebdeveloper.com/photo.jpg"),
                )
            ),
            ListTile(
                leading: Icon(Icons.home),
                title: Text("Home"),
                onTap: (){
                  MySnackBar("Home", context);
                }),
            ListTile(
                leading: Icon(Icons.account_balance_outlined),
                title: Text("About Us"),
                onTap: (){
                  MySnackBar("About Us", context);
                }),
            ListTile(
                leading: Icon(Icons.contact_mail),
                title: Text("Contact Us"),
                onTap: (){
                  MySnackBar("Contact Us", context);
                }),
            ListTile(
                leading: Icon(Icons.account_circle_outlined),
                title: Text("Login"),
                onTap: (){
                  MySnackBar("Login", context);
                }),
              ],
        ),
      ),
    );
  }
}