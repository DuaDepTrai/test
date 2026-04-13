import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  Stream<String> fetchTime() async*{
    while(true){
     await Future.delayed(Duration(seconds: 1));

      var now = DateTime.now();
      String time = "${now.hour}:${now.minute}:${now.second}";
      yield time;
    }
  }
  @override
  Widget build(BuildContext context) {
    print('Build....');
    return Scaffold(
      body: Center(
        child: StreamBuilder(stream: fetchTime(), builder: (ct, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return CircularProgressIndicator();
          }

          var time = snapshot.data!;
          return Text(time);
        }),
      ),
    );
  }

}