import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl_browser.dart';

void main() async {
  var _data = await getJson();

  Widget buildWeather(context, index) {
    DateTime date = new DateTime.fromMicrosecondsSinceEpoch(
        _data[index]["properties"]["time"]);

    return Column(children: <Widget>[
      ListTile(
        title: Text(
          _data[index]["properties"]["title"],
          style: TextStyle(color: Colors.orange),
        ),
        subtitle: Text(_data[index]["properties"]["place"]),
        leading: CircleAvatar(
          child: Text("time"),
          backgroundColor: Colors.green,
        ),
        onTap: () =>showMessage(context, _data[index]["properties"]["title"]),
      ),
    ]);
  }

  runApp(MaterialApp(
    title: "Quakes",
    home: Scaffold(
      appBar: AppBar(
        title: Text("날씨"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: _data.length,
        itemBuilder: (BuildContext context, int index) {
          return buildWeather(context, index);
        },
      ),
    ),
  ));
}

Future<List> getJson() async {
  String url =
      "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson";

  http.Response response = await http.get(url);

  return json.decode(response.body)["features"].toList();
}

 void showMessage(context, String message) {
    var alertDialog = AlertDialog(
      title: Text(message),
      actions: <Widget>[
        FlatButton(
          child: Text("ok"),
          onPressed: (){
            Navigator.pop(context);
          },
        )
      ],
    );

    showDialog(
        context: context,
        builder: (context) {
          return alertDialog;
        });
  }

// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// import 'package:make_it_rain/pages/textField.dart';

// void main() async {
//   List _data = await getJSON();

//   runApp(MaterialApp(
//       title: "BMI",
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("JSON 교환"),
//           backgroundColor: Colors.green,
//         ),
//         body: ListView.builder(
//           itemCount: _data.length,
//           itemBuilder: (BuildContext context, int index) {
//             return Column(
//               children: <Widget>[
//                 Divider(height: 3.4),
//                 ListTile(
//                   title: Text(_data[index]["title"],
//                   style: TextStyle(
//                     fontSize: 17.0,
//                     fontWeight: FontWeight.bold
//                   ),),
//                   subtitle: Text(_data[index]["body"]),

//                   leading: CircleAvatar(
//                     radius:45.6,
//                     backgroundColor: Colors.green,
//                     child: Text(_data[index]["title"][0]),
//                   ),

//                   onTap: () => showTabMessage(context, index),
//                 )
//               ],
//             );
//           },
//         ),
//       )));
// }

// void showTabMessage(BuildContext context, int index) {
//   var alertDialog = AlertDialog(
//     title: Text("Hello"),
//     actions: <Widget>[
//       FlatButton(child: Text("Ok"),
//       onPressed: () => debugPrint("Ok pressed"),)
//     ],
//   );

//   showDialog(context: context, builder: (context){
//     return alertDialog;
//   });
// }

// Future<List> getJSON() async {
//   String url = "https://jsonplaceholder.typicode.com/posts";

//   http.Response response = await http.get(url);

//   return json.decode(response.body);
// }
