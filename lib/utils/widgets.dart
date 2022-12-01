import 'package:flutter/material.dart';

class NumbersBox extends StatelessWidget {
  int num = 0;
  NumbersBox({required this.num});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.orangeAccent,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(1),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(0, 1), // changes position of shadow
              ),
            ],
            border: Border.all(color: Colors.black38, width: 2),
            borderRadius: BorderRadius.circular(5)),
        child: Center(
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 30,
            child: Text(
              num.toString(),
              style: TextStyle(
                  color: Colors.brown.shade700,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}

class NumbersBox2 extends StatelessWidget {
  int num = 0;
  Color color = Colors.orangeAccent;
  double padding = 8;
  NumbersBox2({required this.num, required this.color, required this.padding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Container(
            decoration: BoxDecoration(
                color: color,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(1),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(0, 1), // changes position of shadow
                  ),
                ],
                border: Border.all(color: Colors.black38, width: 2),
                borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 30,
                child: Text(
                  num.toString(),
                  style: TextStyle(
                      color: Colors.brown.shade700,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class button extends StatelessWidget {
  var fun = () {};
  String text;
  button({required this.fun, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: fun,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.orange, borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Text(
            text,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class customText extends StatelessWidget {
  String text;
  customText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w900,
          color: Colors.brown.shade700,
          fontSize: 25,
        ),
      ),
    );
  }
}
