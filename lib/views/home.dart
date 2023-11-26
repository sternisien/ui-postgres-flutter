import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uitraining/bloc/home/home_bloc.dart';
import 'package:uitraining/bloc/home/home_state.dart';
import 'package:uitraining/models/user.dart';
import 'package:uitraining/services/user_service.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  // This shows a CupertinoModalPopup which hosts a CupertinoAlertDialog.

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  UserService userService = UserService();
  List<User> mesUsers = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("hello world"),
        backgroundColor: Colors.blueGrey,
      ),
      body: FutureBuilder(
        future: userService.getAllUsers(),
        builder: (context, snapshot) {
          return SafeArea(
            child: BlocProvider(
              create: (context) => new HomeBloc(),
              child: BlocBuilder<HomeBloc, AbstractHomeState>(
                  builder: (context, state) {
                return SafeArea(
                    child: ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, idx) {
                    return ListTile(
                      title: Text(
                          '${snapshot.data?[idx].nom} ${snapshot.data?[idx].prenom} '),
                    );
                  },
                ));
              }),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (idx) {},
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit),
            label: "page1",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: "page2"),
        ],
      ),
    );
  }
}
