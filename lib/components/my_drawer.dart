import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prmda/components/theme_provider.dart';
import 'package:prmda/pages/chat_page.dart';
import 'package:prmda/pages/o_nas.dart';
import 'package:provider/provider.dart';


class MyDrawer extends StatelessWidget{
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          DrawerHeader(
            child: Icon(
              Icons.home,
              color: Theme.of(context).colorScheme.inversePrimary,)
          ),
          const SizedBox(height: 25,),
          ListTile(
            leading: Icon(
              Icons.storefront,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            title: Text(
              "О  Н А С",
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              ),
            onTap: (){
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const ONas()));
            },
          ),
          ListTile(
              iconColor: Theme.of(context).colorScheme.inversePrimary,
              textColor: Theme.of(context).colorScheme.inversePrimary,
              leading: const Icon(Icons.help),
              title: const Text('П О Д Д Е Р Ж К А'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const ChatPage()));
              },
            ),
          const Spacer(),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.inversePrimary,
              borderRadius: BorderRadius.circular(12),
            ),
            margin: const EdgeInsets.only(left: 25, top: 10, right: 25,bottom: 20),
            padding: const EdgeInsets.all(25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Темный режим",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.background
                  ),
                  ),
                CupertinoSwitch(
                  value: Provider.of<ThemeProvider>(context, listen:false).isDarkMode, 
                  onChanged: (value){
                    Provider.of<ThemeProvider> (context, listen: false).toggleTheme();
                  }
                )
              ],
            ),
          ),
          const SizedBox(height: 80,),
        ],
      ),
    );
  }


}