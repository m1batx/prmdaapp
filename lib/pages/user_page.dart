import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prmda/pages/login_page.dart';

class UserPage extends StatelessWidget{

  UserPage({super.key});
  final User? currentUser = FirebaseAuth.instance.currentUser;

  Future<DocumentSnapshot<Map<String,dynamic>>> getUserDetails() async{
    return await FirebaseFirestore.instance
    .collection("Users").doc(currentUser!.email).get();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:const Text("Профиль",
          style: TextStyle(
            color: Colors.white
            ),),
        backgroundColor: Colors.red,
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
          else if (snapshot.hasData){
            Map<String, dynamic>? userData = snapshot.data!.data();
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    padding: const EdgeInsets.all(25),
                    child: const Icon(
                      Icons.person,
                      size: 64,
                    ),
                  ),
                  const SizedBox(height: 25,),
                   Text(
                    userData.toString(),
                    style:  const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Text(
                    "userData['email']",
                    style: TextStyle(
                        color: Colors.grey[600],
                    ),),
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
