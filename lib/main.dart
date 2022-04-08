import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:courses_codes/Lecture12&13-Firebase/ArtDetails.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Lecture12&13-Firebase/Art.dart';
import 'firebase/Art.dart';
import 'firebase/MemeDetails.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.deepPurple,
              accentColor: Colors.deepOrangeAccent)),
      home: MyArtApp(),
    );
  }
}

class MyArtApp extends StatefulWidget {
  MyArtApp({Key? key}) : super(key: key);

  @override
  State<MyArtApp> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyArtApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FireBase"),
      ),
      body: FutureBuilder<String>(
        future: doSomething(),
        builder: (context, snapshot){
          // 1- on Error
          if(snapshot.hasError){
            return Center(child: Text("Error"));
          }

          // 2- on Success
          if(snapshot.connectionState == ConnectionState.done){
              String data = snapshot.data!;
            return Center(child: Text("Success we got $data"));
          }

          // 3 - on Loading
          return Center(child: CircularProgressIndicator(strokeWidth: 3,));

        },
      ),
    );
  }


  Future<String> doSomething() async {
   await Future.delayed(Duration(seconds: 3));
   throw NullThrownError();
    return Future.value("Hi I returned");
  }


  FutureBuilder<Object?> buildFutureBuilder() {
    return FutureBuilder(

      /// Initialize FlutterFire:
      future: getArt(),
      builder: (context, snapshot) {
        /// if Error
        if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        /// On completion
        if (snapshot.connectionState == ConnectionState.done) {
          List<Meme> list = snapshot.data as List<Meme>;
          return buildGridView(list);
        }

        /// On Loading
        return Center(
            child: CircularProgressIndicator(
              strokeWidth: 3,
            ));
      },
    );
  }

  getArt() async {
    List<Meme> memes = [];
    await FirebaseFirestore.instance
        .collection("gallery")
        .get()
        .then((QuerySnapshot querySnapshot) {
      print(querySnapshot.size);
      querySnapshot.docs.forEach((QueryDocumentSnapshot element) {
        memes.add(Meme.fromDoc(element));
      });
    });
    return memes;
  }

  Widget buildGridView(List<Meme> list) {
    return RefreshIndicator(
      onRefresh: () async {
        await getArt();
        setState(() {});
        return Future.value();
      },
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 0.7),
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context, MemeDetailsScreen.getRoute(list[index]));
              },
              child: Card(
                color: Colors.amber,
                child: Column(
                  children: [
                    Image.network(list[index].image),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                          child: Text(
                            '${list[index].title}',
                            style: TextStyle(fontSize: 18),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(Icons.remove_red_eye),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            '${list[index].views}',
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
