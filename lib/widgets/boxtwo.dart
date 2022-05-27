import 'package:flutter/material.dart';

class BoxTwo extends StatelessWidget {
  const BoxTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 12,
      decoration: BoxDecoration(
          color: Colors.blueGrey, borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        title: Text("Name of the Customer", style: TextStyle(color: Colors.white,fontSize: 16),),
        subtitle: Text("+255789765432", style: TextStyle(color: Colors.white70,fontSize: 14),),
        trailing: Wrap(
          children: [
            Icon(
              Icons.arrow_back_sharp,
              color: Colors.white,
            ),
            Text(
              "8000",
              style: TextStyle(color: Colors.white,fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
