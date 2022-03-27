import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:courses_codes/Lecture12&13-Firebase/ArtDetails.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Art.dart';

void main() async{
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
  List<Art> artList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FireBase"),
      ),
      body: FutureBuilder<List<Art>>(
        /// Initialize FlutterFire:
        future: getArt(),
        builder: (context, snapshot) {
          /// if Error
          if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          /// On completion
          if (snapshot.connectionState == ConnectionState.done) {
            artList = snapshot.data!;
            return buildGrid(artList);
          }

          /// On Loading
          return Center(
              child: CircularProgressIndicator(
            strokeWidth: 3,
          ));
        },
      ),
    );
  }

  Future<List<Art>> getArt() async {
    List<Art> arts = [];
    await FirebaseFirestore.instance
        .collection('gallery')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((QueryDocumentSnapshot doc) {
        arts.add(Art.fromDoc(doc));
      });
    });
    return arts;
  }

  Widget buildGrid(List<Art> artList) {
    return RefreshIndicator(
      onRefresh: () async{
        artList=[];
        await getArt();
        setState(() {});
        return Future.value();
      },
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.70,
          ),
          itemCount: artList.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                Navigator.push(context, ArtDetails.getRoute(artList[index]));
              },
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      artList[index].image,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        artList[index].title,
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(Icons.remove_red_eye),
                          SizedBox(
                            width: 8,
                          ),
                          Text('${artList[index].views}'),
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
