import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

String time='loading';

  void setWorldTime() async{

   WorldTime instance= new WorldTime(location:'London',flag: 'germany.png',url: 'Europe/London' );
   await instance.getData();
   Navigator.pushReplacementNamed(context, '/home', arguments: {
     'location': instance.location,
     'time':instance.time,
     'flag':instance.flag,
     'isDaytime':instance.isDayTime
   });
 }
  @override
  void initState()
  {
    super.initState();
    setWorldTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
body: SpinKitFadingCircle(
  color: Colors.white,
  size: 50.0,
),
    );
  }
}
