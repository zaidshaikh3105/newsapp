import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/Services/customlisttile.dart';
import 'package:newsapp/Services/eg.dart';
import 'package:newsapp/User/UserProfile.dart';
import 'package:newsapp/news/ApiService.dart';
import 'package:newsapp/news/Nmodel.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiService client = ApiService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountEmail: Text(_auth.currentUser!.email.toString()),
                accountName: Text(_auth.currentUser!.displayName.toString()),
                currentAccountPicture: CircleAvatar(
                  backgroundImage:
                      NetworkImage(_auth.currentUser!.photoURL.toString()),
                ),
              ),

              // Container(
              //   height: 150.0,
              //   child: DrawerHeader(
              //     child: Text(
              //       _auth.currentUser!.displayName.toString(),
              //       textAlign: TextAlign.center,
              //     ),
              //     // decoration: BoxDecoration(
              //     //   gradient: LinearGradient(
              //     //       begin: Alignment.topCenter,
              //     //       end: Alignment.bottomCenter,
              //     //       colors: [Colors.blue, Colors.purple]),
              //     //   image: DecorationImage(
              //     //       image: NetworkImage(
              //     //           "https://images.unsplash.com/photo-1495020689067-958852a7765e?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bmV3c3BhcGVyfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
              //     //       fit: BoxFit.cover),
              //     // ),
              //   ),
              // ),
              ListTile(
                title: Text(
                  'Home Page',
                ),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white30,
            title: Text(
              "NEX",
              style: TextStyle(color: Colors.black),
            )),
        body: FutureBuilder(
          future: client.getArticle(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
            //let's check if we got a response or not
            if (snapshot.hasData) {
              //Now let's make a list of articles
              List<Article> articles = snapshot.data!;
              return PageView.builder(
                //Now let's create our custom List tile
                itemCount: articles.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) =>
                    customList(articles[index], context),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
