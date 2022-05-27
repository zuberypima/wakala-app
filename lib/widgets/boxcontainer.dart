import 'package:flutter/material.dart';

class Boxone extends StatefulWidget {
  final Color color;
  String tabname;
  String valuetsh;
   String percent;



  Boxone(this.color, this.tabname,this.percent,this.valuetsh, {Key? key}) : super(key: key);

  @override
  State<Boxone> createState() => _BoxoneState();
}

class _BoxoneState extends State<Boxone> {


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(color: widget.color, borderRadius: BorderRadius.circular(20)),
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width * 0.4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("${widget.tabname}",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w600)),
          ),
          Text('${widget.valuetsh}',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w600)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("${widget.percent}",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w600)),
          )
        ],
      ),
    );
  }
}
