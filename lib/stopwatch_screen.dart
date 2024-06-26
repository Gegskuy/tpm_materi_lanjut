import 'dart:async';

import 'package:flutter/material.dart';

class StopwatchScreen extends StatefulWidget {
  const StopwatchScreen({super.key});

  @override
  State<StopwatchScreen> createState() => _StopwatchScreenState();
}

class _StopwatchScreenState extends State<StopwatchScreen> {


  int seconds = 0, minutes = 0, hours = 0;
  String digitSeconds = "00", digitMinutes = "00", digitHours = "00";
  Timer? timer;
  bool started = false;
  List laps = [];

  //stop timer function
  void stop(){
    timer!.cancel();
    setState(() {
      started = false;
    });
  }

  //reset function
  void reset(){
    timer!.cancel();
    setState(() {
      seconds = 0;
      minutes = 0;
      hours = 0;

      digitSeconds = "00";
      digitMinutes = "00";
      digitHours = "00";

      started = false;
      laps.clear();
    });
  }

  void addLaps() {
    String lap = "$digitHours:$digitMinutes:$digitSeconds";
    setState(() {
      laps.add(lap);
    });
  }

  //start timer
  void start(){
    started = true;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      int localSeconds = seconds+1;
      int localMinutes = minutes;
      int localHours = hours;

      if(localSeconds > 59){
        if(localMinutes > 59){
          localHours++;
          localMinutes = 0;
        }else{
          localMinutes++;
          localSeconds = 0;
        }
      }
      setState(() {
        seconds = localSeconds;
        minutes = localMinutes;
        hours = localHours;
        digitSeconds = (seconds>=10) ? "$seconds" : "0$seconds";
        digitMinutes = (minutes>=10) ? "$minutes" : "0$minutes";
        digitHours = (hours>=10) ? "$hours" : "0$hours";
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C2757),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "Stopwatch",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              SizedBox(height: 20.0,),
              Center(
                  child: Text("$digitHours:$digitMinutes:$digitSeconds",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 82.0,
                          fontWeight: FontWeight.bold
                      )
                  )
              ),
              Container(
                height: 400.0,
                decoration: BoxDecoration(
                    color: Color(0xff323f68),
                    borderRadius: BorderRadius.circular(8.0)
                ),
                //list builder
                child: ListView.builder(
                    itemCount: laps.length,
                    itemBuilder: (context, index){
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Lap n${index+1}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize:16.0
                              ),
                            ),
                            Text(
                              "${laps[index]}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize:16.0
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                ),
              ),
              SizedBox(height: 20.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: RawMaterialButton(
                        onPressed: () {
                          (!started) ? start() : stop();
                        },
                        shape: const StadiumBorder(
                            side: BorderSide(color: Colors.white)
                        ),
                        child: Text(
                            (!started) ? "Start" : "Pause",
                            style: TextStyle(
                                color: Colors.white
                            )
                        ),
                      )
                  ),
                  SizedBox(height: 8.0),
                  IconButton(
                      color: Colors.white,
                      onPressed: (){
                        addLaps();
                      },
                      icon: Icon(Icons.flag_circle)
                  ),
                  Expanded(
                      child: RawMaterialButton(
                        onPressed: () {
                          reset();
                        },
                        fillColor: Colors.blue,
                        shape: const StadiumBorder(),
                        child: Text("Reset", style: TextStyle(color: Colors.white)),
                      )
                  ),
                ],
              )
            ],
          ),
        ),
      )
    );
  }
}
