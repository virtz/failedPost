import 'package:flutter/material.dart';
import 'package:test1/models/genre.dart';
import 'package:test1/services/api.dart';

class Post extends StatefulWidget {
  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  TextEditingController _name = TextEditingController();
  bool loading = false;
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

            loading
                ?Center(child: CircularProgressIndicator(),)
                :RaisedButton(
              onPressed: (){
                _addPost();
              },
              child: Text('Send'),
            ),
            
          ],
        ));
  }

  _addPost(){
    setState((){
      loading = true;
    });
    Api.addGenre(_name.text).then((success){
      setState((){
        loading = false;
      });
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
