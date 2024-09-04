import 'package:flutter/material.dart';
import 'package:prmda/pages/o_nas.dart';


class MyDrawer extends StatelessWidget{
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
            child: Icon(Icons.home)
          ),
          const SizedBox(height: 25,),
          ListTile(
            leading: const Icon(Icons.storefront),
            title: const Text("О  Н А С"),
            onTap: (){
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const ONas()));
            },
          )
        ],
      ),
    );
  }


}