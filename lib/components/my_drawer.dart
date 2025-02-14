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
      backgroundColor: Theme.of(context).colorScheme.surface,
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
          
          Container(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Icon(
                  Icons.dark_mode,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                const SizedBox(width: 10,),
                Text(
                  "ТЕМНЫЙ РЕЖИМ",
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.inversePrimary
                  ),
                  ),
                const SizedBox(width: 30,),
                CupertinoSwitch(
                  value: Provider.of<ThemeProvider>(context, listen:false).isDarkMode, 
                  onChanged: (value){
                    Provider.of<ThemeProvider> (context, listen: false).toggleTheme();
                  }
                )
              ],
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }


}