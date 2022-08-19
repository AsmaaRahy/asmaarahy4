import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:asmaarahy4/second_screen.dart';
void main(){
  runApp( MyApp());
}
class MyApp extends StatelessWidget {
  //const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
class HomeScreen extends StatefulWidget {
const HomeScreen({Key? key}) : super(key: key);

@override
State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {
  Dio dio= Dio();
  String url='https://fakestoreapi.com/products';
  List<dynamic> productData=[];
  @override
  void initState() {
    super.initState();
    getData();
  }
  Future<List<dynamic>> getData() async {
    Response response = await dio.get(url);
    print(response.data);
    print(response.statusCode);
    productData = response.data.map((product) => ProductsData.fromJson(product)).toList();
    return productData;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Shop',style: TextStyle(
            fontSize: 30,fontWeight: FontWeight.bold),),
        backgroundColor: Colors.blueGrey,
      ),
      body: FutureBuilder(
        future: getData(),
        builder: ((context, snapshot) {
          return snapshot.hasData
              ? ListView.builder(
            itemCount:
            productData.length,
            itemBuilder: (context,index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: ListTile(
                  leading:Image.network(
                      '${productData[index].image}') ,
                  title:  Text('${productData[index].title}',style: TextStyle(fontSize: 17),),
                  subtitle: Container(
                   color: Colors.white,
                  child: Text('price ${productData[index].price}',
                  style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),),


                ),
              );
            },)
              : snapshot.hasError?
               Text('Sorry, Someting wrong')
              : Center(child: CupertinoActivityIndicator());

        }),) );
  }
}
