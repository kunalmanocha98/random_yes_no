
import 'package:flutter/material.dart';
import 'package:random_yes_no/conts/strings.dart';
import 'package:random_yes_no/models/resposnemodel.dart';
import 'package:random_yes_no/networkcall/netwrokcall.dart';




class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ResponseData responseData = ResponseData();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Align(child:Text(widget.title),alignment: Alignment.center,),
      ),
      body: Center(
        child: Wrap(
          spacing: 32,
          crossAxisAlignment: WrapCrossAlignment.center,
          direction: Axis.vertical,
          children: <Widget>[
            Text(responseData.answer!=null?responseData.answer.toUpperCase():"Answer",
              style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Source Sans Pro'
              ),
            ),
            Container(

              height: 200,
              width: 300,
              child: Image(
                image: NetworkImage(responseData.image!=null?responseData.image:"https://media0.giphy.com/media/SufoKsersIO2Y/giphy.gif"),
              ),
            ),
            RaisedButton(
                onPressed: _fetchData,
              shape: StadiumBorder(side: BorderSide(
                color: Colors.red
              )),
              color: Colors.white,
              highlightColor: Colors.red[100],

              child: Padding(
                padding: EdgeInsets.only(top: 16,bottom: 16,left: 16,right: 16),
                child: Text("Generate Answer",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      fontFamily: 'Source Sans Pro',
                      color: Colors.red[500]
                  ),
                ),
              )
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _fetchData() async{
    var data  = await NetworkUtils().fetchData(Strings.API_CALL);
    setState(() {
      responseData = ResponseData.fromJson(data);
      print(responseData.answer);
    });
  }
}
