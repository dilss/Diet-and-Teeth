import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import '../widgets/main_drawer.dart';
import './tabs_screen.dart';
import '../providers/user_data_provider.dart';

class HomePage extends StatelessWidget {
  final myAppBar = AppBar(
    title: Text('Página Inicial'),
    actions: [
      DropdownButton(
          items: [
            DropdownMenuItem(
              child: Container(
                child: Row(
                  children: [
                    Icon(
                      Icons.exit_to_app,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text('Sair'),
                  ],
                ),
              ),
              value: 'logout',
            ),
          ],
          icon: Icon(
            Icons.more_vert,
            color: Colors.black,
          ),
          onChanged: (itemIdentifier) {
            if (itemIdentifier == 'logout') {
              FirebaseAuth.instance.signOut();
            }
          })
    ],
  );

  @override
  Widget build(BuildContext context) {
    final availableSize = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        myAppBar.preferredSize.height;
    return ChangeNotifierProvider(
      create: (ctx) => UserDataProvider(),
      child: Scaffold(
        appBar: myAppBar,
        drawer: MainDrawer(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.pushNamed(context, TabsScreen.routeName);
          },
        ),
        body: Container(
          height: availableSize,
          child: Column(
            children: [
              Card(
                margin: EdgeInsets.all(10),
                child: Container(
                  height: availableSize * 0.3,
                  child: Column(
                    children: [
                      Container(
                        height: availableSize * 0.15,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.red, Colors.red.withOpacity(0.5)],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                        ),
                      ),
                      Container(
                        height: availableSize * 0.15,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.green,
                              Colors.green.withOpacity(0.5)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                elevation: 8,
                shadowColor: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
