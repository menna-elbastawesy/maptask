import 'package:flutter/material.dart';
import 'package:maptask/mapScreen.dart';
import 'package:maptask/models/user.dart';
import 'package:maptask/screens/MyCard.dart';
import 'package:maptask/screens/utilise.dart';
import 'package:maptask/services/userServeices.dart';
class UserDetails extends StatefulWidget {
  User user;
  UserDetails(this.user);

  @override
  _UserDetailsState createState() => _UserDetailsState();
}
class _UserDetailsState extends State<UserDetails> {
  bool loading=true;
  List<User> users=[];
  getUserList() async {
    users= await UserService().getUsers();
    loading=false;
    setState(() {

    });
  }
  @override
  void initState() {
    super.initState();
    getUserList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigoAccent,
          leading: Icon(Icons.menu,color: Colors.white,),
          elevation: 20,
          title:Text('Users',style: TextStyle(color: Colors.white),),
          actions: [Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.create,color:Colors.white,),
          )],),
        body:ListView(
          children: [
            MyCard(content:"${widget.user.name}",),
            SizedBox(height: 20,),
            Column(
              children: [
                InkWell(onTap: (){
                  launchURL('mailto:${widget.user.email}');
                },
                    child: Text("Email:${widget.user.email}")),
                SizedBox(height: 20,),
                InkWell(onTap: (){
                  launchURL('tel:${widget.user.phone}');
                },
                    child: Text("Phone:${widget.user.phone}")),
                SizedBox(height: 20,),
                InkWell(onTap: (){
                  launchURL('http://${widget.user.website}');
                },
                    child: Text("Website:${widget.user.website}")),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    color: Colors.indigoAccent,
                    child: MaterialButton(
                      onPressed: (){
                        pushPage(context,MapSample(widget.user.address.geo));
                      },
                      child: Text('Map View'),
                    ),
                  ),
                )
              ],
            ),

          ],
        )

    );
  }
}
