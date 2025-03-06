import 'package:flutter/material.dart';
import 'package:imc_flutter/main.dart';
import 'package:imc_flutter/pages_drawer/list_imcs.dart';

class TheDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          children: [
            ListTile(
                leading: Icon(Icons.home),
                title: Text('Home Page'),
                onTap: () {
                // Fecha o drawer antes de navegar
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage()),
                  );
                },
            ),
            ListTile(
                leading: Icon(Icons.format_list_bulleted),
                title: Text('Meus IMCs'),
                onTap: () {
                // Fecha o drawer antes de navegar
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ImcList()),
                  );
                },
            ),
          ],
        )
    ));
  }
}
