import 'package:flutter/material.dart';
import 'widgets/forms.dart';
import 'widgets/burntrack.dart';
void main() async {

  runApp(const MyApp());
  }


class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    const appTitle = 'FitQuest';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const CustomForm(),
        drawer: Drawer(
  child: Builder(
    builder: (BuildContext context) {
      return ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: const Text('Item 1'),
            onTap: () {
                 Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HelloWorld()));
            }
            

          ),
          ListTile(
            title: const Text('Item 2'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  ),
),
      ),
    );
  }
}
