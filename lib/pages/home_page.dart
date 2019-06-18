import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _enterCounter = 0;
  int _exitCounter = 0;
  double x = 0.0;
  double y = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints.tight(Size(300.0, 200.0)),
          child: Listener(
            onPointerEnter: _incrementCounter,
            onPointerHover: _updateLocation,
            onPointerExit: _decrementCounter,
            child: Container(
              color: Colors.lightBlueAccent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('You have pointed at this box this many times:'),
                  Text(
                    '$_enterCounter Entries\n$_exitCounter Exits',
                    style: Theme.of(context).textTheme.display1,
                  ),
                  Text(
                    'The cursor is here: (${x.toStringAsFixed(2)}, ${y.toStringAsFixed(2)})',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _incrementCounter(PointerEnterEvent event) {
    setState(() {
      _enterCounter++;
    });
  }

  void _updateLocation(PointerHoverEvent event) {
    setState(() {
      x = event.position.dx;
      y = event.position.dy;
    });
  }

  void _decrementCounter(PointerExitEvent event) {
    setState(() {
      _enterCounter--;
    });
  }
}
