
import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:singing_app/data_manager/models/note.dart';
import 'package:singing_app/state_manager/screens/charts.dart';

import '../../shared.dart';

class VisualizerWidget extends StatefulWidget {
  final int rootnote;

  const VisualizerWidget({Key key, this.rootnote}) : super(key: key);
  @override
  _VisualizerWidgetState createState() => _VisualizerWidgetState();
}

class _VisualizerWidgetState extends State<VisualizerWidget> {
    static const stream = const EventChannel('com.example.singing_app/stream');
  //StreamSubscription _timerSubscription = null;
  bool isRecording=false;
  bool isShowingData=false;
  List<NoteModel> notes=[];
  Timer _timer;
  List trace = [];
  var db = 0.0;
  double maxval = 55.0;
  double minval = 75.0;
  double closestnote  = 0.0;
  double lastclosestnote  = 0.0;
  double difference = 0;
  Stopwatch stopwatch = Stopwatch();
  int samples=0;
  
  //List<gameMode> gamemodes = gameModes;

  @override
  void initState() {
    super.initState();
    //_timerSubscription = stream.receiveBroadcastStream().listen(_oc);
    stopwatch.start();
    _timer = new Timer.periodic(Duration(milliseconds: 50), callback);
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timer = null;
    super.dispose();
  }

  void saveNotes(){
    int durInKey=0;
    int durTot=0;
    notes.forEach((n){
      if (majnames.contains(n.note))durInKey+=n.samples;
      durTot+=n.samples;
      print(n.note);
    });
    print(100*(durInKey/durTot));
    notes=[];
  }

  void callback(Timer timer) {
    // setState(() {
    stream.receiveBroadcastStream().listen(_oc);
    //  });
  }
  double freqToMidi(double freq){
    return((12/log(2)) * log(freq/27.5) + 21);
  }

  void _oc(v) {
    //print(v.toString());
    //setState(() => db=v);

    if (v != -1) {
      //print(v.toString());
      double m = freqToMidi(v);


      // if (trace.length < 100) {
      
      if (m>40.0 && m<75.0){
          samples+=1;
          closestnote = m%12;
          difference = 0;
          // int i = 1;
          // while (i<11 && (closestnote> majorscale[i])  ){
          //   i+=1;
          // }
         
          // if ((closestnote- majorscale[i-1]).abs() > (closestnote-majorscale[i]).abs()){
          //     difference = closestnote - majorscale[i];
          //     closestnote= majorscale[i];
          //     //print(notenames[majorscale[i].round()]);
          //     //print(difference.toString());
          // }else{
          //   difference = closestnote - majorscale[i-1];
          //     closestnote= majorscale[i-1]; 
          // }
       // if (trace.isEmpty || ((trace[-1]-m)<30.0 && (m-trace[-1])<30.0)){
         if(isRecording && lastclosestnote.round()!=closestnote.round()){
          // print(samples);
           if(samples>4){
             
           print(lastclosestnote.round());
           print(notenames[lastclosestnote.round()]);
         //    print(notenames[lastclosestnote.round()]);
            notes.add(NoteModel(
             deviation: 0.0,
             samples: samples,
             duration: stopwatch.elapsedMilliseconds,
             note: notenames[lastclosestnote.round()]
           ));
           lastclosestnote = closestnote;
           stopwatch.reset();
           samples=0;
           
           }
          
           
           
         }
         
        if (m<minval){minval=m;}
        else if (m>maxval){maxval=m;}
       // print(m.toString());
        
        setState(() => trace.add(m));
        }
     // }
      
   /* }else if (trace.length>1){
      double o = trace.last;
      setState(() => trace.add(o));
    }*/
    }
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
        //   height: 50.0,
        // width: double.infinity,
        // color: Colors.grey[200],
        // child:
        leading: Text(notenames[lastclosestnote.round()]),
        trailing: Text(notenames[closestnote.round()]), 

        title: Row(
          children: <Widget>[
            RaisedButton(
              child: Text(isRecording? "Stop Recording":"Start Recording"),
              onPressed: () {
                setState(() {
                  if(isRecording) saveNotes();
                  isRecording = !isRecording;
                });
              },
            ),
               RaisedButton(
              child: Text(isShowingData? "hide Data":"Show Data"),
              onPressed: () {
                setState(() {
                  if(isShowingData) saveNotes();
                  isShowingData = !isShowingData;
                });
              },
            ),
          ],
        ),
        ),
        Expanded(child: NoteDurationScatterPlot(notes),),
        Expanded(
          child: 
          new Container(
                      color: getAccuracyColor(difference),
                      padding: new EdgeInsets.all(8.0),
                      child: 
                          Osc(
                            trace: trace,
                            maxval: maxval,
                            minval: minval,
                            root:widget.rootnote,
                          ),
                      
                      
                    ),
        ),
      ],
    );
  }
}
class Osc extends StatefulWidget {
  final List trace;
  final double minval;
  final double maxval;
  final int root;


  const Osc({Key key, this.trace, this.minval, this.maxval, this.root}) : super(key: key);

  @override
  _OscState createState() => _OscState();
}

class _OscState extends State<Osc> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 5.0),
      width: double.infinity,
      height: double.infinity,
      //color: Colors.black,
      child: ClipRect(
        child: CustomPaint(
          painter: _TracePainter(
              yAxisColor: Colors.green,
              dataSet: widget.trace,
              traceColor: Colors.blue,
              maxval: widget.minval,
              minval: widget.maxval,
              root: widget.root
            ),
        ),
      ),
    );
  }
}

class _TracePainter extends CustomPainter {
  final List dataSet;
  final double minval;
  final double maxval;
  final Color traceColor;
  final Color yAxisColor;
  final int root;

  //final double yRange;

  _TracePainter(
      {
     
      //this.yRange,
      this.minval,
      this.dataSet,
      this.maxval,
      this.root,
      this.yAxisColor= Colors.green,
      this.traceColor = Colors.white});

  

  @override
  void paint(Canvas canvas, Size size) {
    final tracePaint = Paint()
      ..strokeJoin = StrokeJoin.round
      ..strokeWidth = 2.0
      ..color = traceColor
      ..style = PaintingStyle.stroke;
    
    
    double step = (size.height)/(maxval-minval);
    double freqToHeight(double freq){
      return ((freq-minval)*step);
    }

    // final axisPaint = Paint()
    //   ..strokeWidth = 1.0
    //   ..color = yAxisColor;

   

    // only start plot if dataset has data
    int length = dataSet.length;
    if (length > 0) {
      // transform data set to just what we need if bigger than the width(otherwise this would be a memory hog)
      if (length > size.width) {
        dataSet.removeAt(0);
        length = dataSet.length;
      }

      // Create Path and set Origin to first data point
      Path trace = Path();
      //trace.moveTo(0.0, dataSet[0].toDouble());
      trace.moveTo(0.0, freqToHeight(dataSet[0].toDouble()));

      // generate trace path
      for (int p = 0; p < length; p++) {
        double plotPoint = freqToHeight(dataSet[p].toDouble());
        //dataSet[p].toDouble();

        trace.lineTo(p.toDouble(), plotPoint);
      }

      // display the trace
      canvas.drawPath(trace, tracePaint);

// C major
  double midiroot = root.toDouble()+48.0;
  majorscale.forEach( (f) =>  
    canvas.drawLine(
      Offset(0.0, freqToHeight((midiroot+f))), 
      Offset(size.width, freqToHeight((midiroot+f))), 
      Paint()..color=getColor(f%12)
            ..strokeWidth = 1.5
      )
      
  );
   //{

     // canvas.drawLine(Offset(0.0, freqToHeight(60.0)), Offset(size.width, freqToHeight(60.0)), axisPaint);
     // canvas.drawLine(Offset(0.0, freqToHeight(48.0)), Offset(size.width, freqToHeight(48.0)), axisPaint);
     // canvas.drawLine(Offset(0.0, freqToHeight(72.0)), Offset(size.width, freqToHeight(72.0)), axisPaint);
     // canvas.drawLine(Offset(0.0, freqToHeight(110.0)), Offset(size.width, freqToHeight(110.0)), axisPaint);
      // if yAxis required draw it here
     /* if (showYAxis) {
        Offset yStart = Offset(0.0, size.height - (0.0 - yMin) * yScale);
        Offset yEnd = Offset(size.width, size.height - (0.0 - yMin) * yScale);
        canvas.drawLine(yStart, yEnd, axisPaint);
      }*/
    }
  }

  @override
  bool shouldRepaint(_TracePainter old) => true;
}



