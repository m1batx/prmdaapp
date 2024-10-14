import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prmda/pages/supportChat_page.dart';

class SupportHomePage extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  SupportHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Поддержка - Активные пользователи')),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('chats').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          // Extract unique userIds from the chat collection
          final users = snapshot.data!.docs
              .map((doc) => doc['senderId'] as String)
              .toSet()
              .toList();

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final userId = users[index];
              if (userId!="support"){
                return ListTile(
                  title: Text('Пользователь: $userId'),
                  onTap: () {
                    // Navigate to the chat screen with the selected user
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SupportChatPage(userId: userId),
                      ),
                    );
                  },
                );
              }
              else{
                return null;
              }
            },
          );
        },
      ),
    );
  }
}
