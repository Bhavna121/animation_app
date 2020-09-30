import 'package:flutter/material.dart';

class Foo extends StatefulWidget {
  Foo({Key key, this.duration}) : super(key: key);

  final Duration duration;

  @override
  _FooState createState() => _FooState();
}

class _FooState extends State<Foo> with SingleTickerProviderStateMixin {
  var _controller;
  var animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this, // the SingleTickerProviderStateMixin
      duration: Duration(seconds: 2),
    );
    animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    animation.addListener(() {
      setState(() {
        // The state that has changed here is the animation object’s value.
      });
    });
    _controller.forward();
  }

  @override
  void didUpdateWidget(Foo oldWidget) {
    super.didUpdateWidget(oldWidget);
    _controller.duration = widget.duration;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
          children:<Widget>[ Container(
          height: 300 * animation.value,
          width: 300 * animation.value,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(150),
            color: Colors.orange,
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(0, 120, 0, 100),
          height: 280 * animation.value,
          width: 280 * animation.value,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(140),
            color: Colors.black,
          ),
          child: Text("Welcome!", 
          textDirection: TextDirection.ltr,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
          ),
        ),
        ]
      ),
    );
  }
}
