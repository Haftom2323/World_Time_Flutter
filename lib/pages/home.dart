
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data={};
  @override
  Widget build(BuildContext context) {
    data=data.isEmpty?ModalRoute.of(context).settings.arguments:data;
    //print(data);
    String bgImage=data['isDaytime']?'day.png':'night.png';
    Color bgColor=data['isDaytime']?Colors.blue:Colors.indigo[700];
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child:Container(


          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 120.0, 0.0, 0.0),
            child: Column(
            children:[
              FlatButton.icon(
                onPressed:() async {
                 dynamic result=await Navigator.pushNamed(context,'/location');
                 setState(() {
                 data={
                   'time':result['time'],
                   'location':result['location'],
                   'flag':result['flag'],
                   'isDaytime':result['isDaytime']
                 };});
                },
                icon: Icon(
                  Icons.edit_location,
                  color: Colors.white
                ),

                label: Text(
                    'edit_location',
                   style: TextStyle(
                     color: Colors.white
                   ),

                ),
              ),

              SizedBox(height: 20.9),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 28,
                        letterSpacing: 2.0,
                          color: Colors.white
                      ),
                  ),

                ],
              ),
              SizedBox(height: 20.0,),
              Text(
                data['time'],
                style: TextStyle(
                  fontSize: 66.0,
                    color: Colors.white
                ),
              ),
            ]
    ),
          ),
        ),
    )
    );}
}
