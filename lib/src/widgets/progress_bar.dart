import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class ProgressBarCircular extends StatefulWidget {

  const ProgressBarCircular ({Key key}) : super(key: key);

  @override
  ProgressBarCircularState createState() => ProgressBarCircularState();
}

class ProgressBarCircularState extends State<ProgressBarCircular> with SingleTickerProviderStateMixin{

  double porcentaje = 0.0;
  double newPorcentaje = 0.0;
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 800));

    controller.addListener(() {
      porcentaje = lerpDouble(porcentaje, newPorcentaje, controller.value);
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 300,
          height: 300,
          child: CustomPaint(painter: _RadialCustomPainter(porcentaje)),
        ),
        Text("${porcentaje.toStringAsFixed(2)} %"),
      ],
    );
  }

  void changeProgressBar(){
    setState(() {
      porcentaje = newPorcentaje;
      newPorcentaje += 10;
      if(newPorcentaje > 100){
        newPorcentaje = 0;
        porcentaje = 0;
      }
    });

    controller.forward(from: 0.0);
  }
}

class _RadialCustomPainter extends CustomPainter{

  final porcentaje;

  _RadialCustomPainter(this.porcentaje);

  @override
  void paint(Canvas canvas, Size size) {

      final paintCirculo = new Paint()
        ..strokeWidth = 4
        ..color = Colors.grey
        ..style = PaintingStyle.stroke;

      final Offset center = Offset(size.height * 0.5, size.width * 0.5 );
      final double radius = min(size.width * 0.5, size.height * 0.5);

      canvas.drawCircle(center, radius, paintCirculo);

      final paintArc = new Paint()
        ..strokeWidth = 10
        ..color = Colors.indigo
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.stroke;

      double arcAngle = 2 * pi * (porcentaje / 100);

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        -pi / 2, 
        arcAngle, 
        false, 
        paintArc);


    }
  
    @override
    bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

}