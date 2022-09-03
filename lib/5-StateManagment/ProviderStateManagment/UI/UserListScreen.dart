import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/UserProvider.dart';
import '../data/UserApi.dart';

class MyProviderPage extends StatefulWidget {
  MyProviderPage({Key? key}) : super(key: key);

  @override
  State<MyProviderPage> createState() => _MyProviderPageState();
}

class _MyProviderPageState extends State<MyProviderPage> {
  bool change = true;
  List<User> users = [];
  late UserProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = context.watch<UserProvider>();
    users = provider.userList;
    return Scaffold(
      body: buildProvider(context),
    );
  }

  /**  --------------- Focus Here  ----------------------- **/
  Widget buildProvider(context) {
    return users.isEmpty ? buildButton() : buildUserList(users);
  }
  /** 
   --------------- Focus Here  -----------------------
     **/

  Widget buildUserList(List<User> users) {
    return ListView.builder(
        itemCount: users.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Icon(Icons.person),
            title: Text("${users[index].name}"),
            subtitle: Text("${users[index].email}"),
            trailing: IconButton(
              icon: Icon(Icons.delete,color: Colors.red,),
              onPressed: () {
                provider.removeUser(users[index]);
              },
            ),
          );
        });
  }

  buildButton() {
    return Center(
      child: ElevatedButton(
          onPressed: () {
            provider.getUsers();
          },
          child: Text("Get User Api")),
    );
  }
}
