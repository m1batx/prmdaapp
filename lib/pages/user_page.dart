
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prmda/pages/login_page.dart';
import 'package:prmda/pages/my_orders_page.dart';
import 'package:prmda/pages/order_management_page.dart';
import 'package:prmda/pages/settings_page.dart';

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
              leading: const Icon(Icons.shopping_bag),
              title: const Text('Управление заказами'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const OrderManagementPage()));
                // Handle Orders tap
              },
            );
    }
    return const Spacer();
    
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor:  Colors.white,
      appBar: AppBar(
        title:const Text("Профиль",
          style: TextStyle(
            color: Colors.red
            ),),
            backgroundColor: Colors.white,),
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
            return const Center(child: Text('Данные пользователя не найдены'));
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
                border: Border.all(color: Colors.grey),
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
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        userData['email'], // Replace with dynamic data
                        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.shopping_bag),
              title: const Text('Заказы'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>MyOrdersPage(userId: FirebaseAuth.instance.currentUser!.uid)));
                // Handle Orders tap
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Настройки'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Handle Settings tap
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const SettingsPage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.help),
              title: const Text('Поддержка'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Handle Help tap
              },
            ),
            const Spacer(),
            OrderManage(context),
            const Spacer(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Выйти'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                FirebaseAuth.instance.signOut();
                // Handle Log out tap
              },
            ),
          ],
        ),
      );
    }
          else{
            return const Text("No data!");
          }
        }
      ),
    
    );
  }
}