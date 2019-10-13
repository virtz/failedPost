import 'package:flutter/material.dart';
import 'package:test1/models/genre.dart';
import 'package:test1/services/api.dart';

class Post extends StatefulWidget {
  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  TextEditingController _name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: <Widget>[
           Material(
                        child: Container(
                  decoration: BoxDecoration(
                    //color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: (MediaQuery.of(context).size.height) * 0.075,
                  width: (MediaQuery.of(context).size.width) / 0.02,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                    child: TextField(
                      controller:_name,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: "Enter something"),
                    
                    ),
                  ),
                ),
           ),
           RaisedButton(
             onPressed: (){
               _addPost();
             },
             child: Text('Send'),
           )
            
          ],
        ));
  }
  _addPost(){
  //  final genre = Genre(
  //    genreName: _name.text,
  //  ); 
  final genre = {
    "name":_name.text,
  };
    Api.addGenre(genre).then((success){
      String title, text;
      if(success){
        title = "Success";
        text = "Your post has been successfully submitted";
      }else{
         title = "Error";
        text = "An error occurred";
      }
    });
  }
 
}
