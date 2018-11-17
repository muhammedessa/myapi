import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

void main() async{
  List data = await getData();
  String myData = data[0]['title'];
  print(data);
  runApp(new MaterialApp(
    title: 'Muhammed Essa',
    home: new Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: new Text('data'),
      ),
      body: new Center(
        child: new ListView.builder(

          itemCount: data.length ,
            itemBuilder: (BuildContext context , int position){

           if(position.isOdd) return new Divider();
           final newPosition = position ~/ 2;
            return new ListTile(

              title: new Text('${data[newPosition]['title']}',
                style: TextStyle(
                  color: Colors.deepPurpleAccent,
                  fontSize: 22.0,
                ),
              ),
              subtitle:new Text('${data[newPosition]['body']}',
                style: TextStyle(
                  color: Colors.deepPurpleAccent,
                  fontSize: 14.0,
                ),
              ),
              leading: new CircleAvatar(
                child: new Text('P ${data[newPosition]['id']}'),
                backgroundColor: Colors.pink,
                foregroundColor: Colors.white,

              ),
              onTap: ()   { showMoreInfo(
                                          context ,
                                          '${data[newPosition]['id']}',
                                          '${data[newPosition]['title']}',
                                          '${data[newPosition]['userId']}',
                                          '${data[newPosition]['body']}');  }
            );

            }
        ),





//        child:new Text('data : $myData',
//          style: TextStyle(
//            fontStyle: FontStyle.italic,
//            fontSize: 16.0,
//            color: Colors.pink
//          ),
//        ),
      ),
    ),
  ));
}

Future<List> getData() async{
  String myUrl = 'https://jsonplaceholder.typicode.com/posts';
  http.Response response = await http.get(myUrl);
  return json.decode(response.body);
}



Future<Null>   showMoreInfo(BuildContext context ,String value
    ,String value2,String value3,String value4) async{

    return showDialog<Null>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text('$value2'),
          content: new SingleChildScrollView(
            child: new ListBody(
              children: <Widget>[
                new Text('$value4'),
                new Text('user id : $value3'),
                new Text('user id : $value'),

              ],
            ),
          ),
          actions: <Widget>[
            new FlatButton(
              child: new Text('Regret'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );

}

