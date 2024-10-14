
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prmda/pages/chat_page.dart';
import 'package:prmda/pages/login_page.dart';
import 'package:prmda/pages/my_orders_page.dart';
import 'package:prmda/pages/order_management_page.dart';
import 'package:prmda/pages/settings_page.dart';
import 'package:prmda/pages/supportHome_page.dart';

class UserPage extends StatelessWidget{

  UserPage({super.key});
  final User? currentUser = FirebaseAuth.instance.currentUser;

  Future<DocumentSnapshot<Map<String,dynamic>>> getUserDetails() async{
    return await FirebaseFirestore.instance
    .collection("Users").doc(currentUser!.email).get();
  }
  
  Widget OrderManage(context){
    if (currentUser?.email=="mubinjon9009@mail.ru"||currentUser?.email=="behit@mail.ru"){
      return 
            ListTile(
              iconColor: Theme.of(context).colorScheme.inversePrimary,
              textColor: Theme.of(context).colorScheme.inversePrimary,
              leading:  const Icon(Icons.shopping_bag),
              title:  const Text('Управление заказами'),
              trailing:  const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const OrderManagementPage()));
                // Handle Orders tap
              },
            );
    }
    return const Spacer();
    
  }
  Widget chatManage(context){
    if (currentUser?.email=="mubinjon9009@mail.ru"||currentUser?.email=="behit@mail.ru"){
      return 
            ListTile(
              iconColor: Theme.of(context).colorScheme.inversePrimary,
              textColor: Theme.of(context).colorScheme.inversePrimary,
              leading: const Icon(Icons.message),
              title: const Text('Чаты'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> SupportHomePage()));
                // Handle Orders tap
              },
            );
    }
    return const Spacer();
    
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor:  Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text("Профиль",
          style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary
            ),),
        backgroundColor: Theme.of(context).colorScheme.tertiary,
      ),
      body: FutureBuilder(
        future: getUserDetails(), 
        builder: (context,snapshot){
          
          if(snapshot.connectionState==ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          else if (snapshot.hasError){
            return const LoginPage();
          }
          else if (!snapshot.hasData || !snapshot.data!.exists) {
            return  Center(child: Text('Данные пользователя не найдены', style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary,),));
          }
          else if (snapshot.hasData){
            var userData = snapshot.data!.data()!;
            return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).colorScheme.tertiary,),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('lib/images/logo.png'), // Local image asset for the profile picture
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userData['name'], // Replace with dynamic data
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.inversePrimary),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        userData['email'], // Replace with dynamic data
                        style: TextStyle(fontSize: 16, color: Theme.of(context).colorScheme.tertiary,),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              iconColor: Theme.of(context).colorScheme.inversePrimary,
              textColor: Theme.of(context).colorScheme.inversePrimary,
              leading: const Icon(Icons.shopping_bag),
              title: const Text('Заказы'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>MyOrdersPage(userId: FirebaseAuth.instance.currentUser!.uid)));
                // Handle Orders tap
              },
            ),
            ListTile(
              iconColor: Theme.of(context).colorScheme.inversePrimary,
              textColor: Theme.of(context).colorScheme.inversePrimary,
              leading: const Icon(Icons.settings),
              title: const Text('Настройки'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Handle Settings tap
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const SettingsPage()));
              },
            ),
            ListTile(
              iconColor: Theme.of(context).colorScheme.inversePrimary,
              textColor: Theme.of(context).colorScheme.inversePrimary,
              leading: const Icon(Icons.help),
              title: const Text('Поддержка'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const ChatPage()));
              },
            ),
            const Spacer(),
            OrderManage(context),
            chatManage(context),
            const Spacer(),
            ListTile(
              iconColor: Theme.of(context).colorScheme.inversePrimary,
              textColor: Theme.of(context).colorScheme.inversePrimary,
              leading: const Icon(Icons.logout),
              title: const Text('Выйти'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                FirebaseAuth.instance.signOut();
                // Handle Log out tap
              },
            ),
            const SizedBox(height: 80,),
          ],
        ),
      );
    }
          else{
            return Text("No data!", style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),);
          }
        }
      ),
    
    );
  }
}