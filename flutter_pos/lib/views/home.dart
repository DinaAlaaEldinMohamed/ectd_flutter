import 'package:flutter/material.dart';
import 'package:flutter_pos/utils/sql_helper.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = true;
  bool tablesCreated = false;
  @override
  void initState() {
    init();
    super.initState();
  }

  void init() async {
    tablesCreated = await GetIt.I.get<SqlHelper>().createTables();

    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('POS App'),
          backgroundColor: Colors.lightBlue,
          foregroundColor: Colors.white,
        ),
        body: Center(
          child: Container(
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.amber),
              width: 50,
              height: 50,
              child: isLoading
                  ? Transform.scale(
                      scale: .5,
                      child: const CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    )
                  : CircleAvatar(
                      radius: 10,
                      backgroundColor:
                          tablesCreated ? Colors.green : Colors.red,
                    )),
        ));
  }
}
