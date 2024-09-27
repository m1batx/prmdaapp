import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _controller = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _sendMessage() async {
    if (_controller.text.isNotEmpty) {
      await _firestore.collection('chats').add({
        'text': _controller.text,
        'senderId': _auth.currentUser!.uid,
        'recipient': 'support',  // All messages are sent to support
        'timestamp': Timestamp.now(),
      });
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Поддержка")),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _firestore
                  .collection('chats')
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return CircularProgressIndicator();

                // Fetch both user and support messages
                final userMessages = snapshot.data!.docs
                  .where((message) => message['senderId'] == _auth.currentUser!.uid)
                  .toList();
                final supportMessagesStream = _firestore
                    .collection('chats')
                    .snapshots();

                return StreamBuilder<QuerySnapshot>(
                  stream: supportMessagesStream,
                  builder: (context, supportSnapshot) {
                    if (!supportSnapshot.hasData) {
                      return const Expanded(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ));
                    }

                    // Combine user and support messages
                    final supportMessages = supportSnapshot.data!.docs
                      .where((message) => message['recipient'] == _auth.currentUser!.uid)
                      .toList();
                    final allMessages = [...userMessages, ...supportMessages];

                    // Sort messages by timestamp
                    allMessages.sort((a, b) => (b['timestamp'] as Timestamp).compareTo(a['timestamp'] as Timestamp));

                    return ListView.builder(
                      reverse: true,
                      itemCount: allMessages.length,
                      itemBuilder: (context, index) {
                        final message = allMessages[index];
                        final isUserMessage = message['senderId'] == _auth.currentUser!.uid;
                        return ListTile(
                          title: Text(isUserMessage ? 'Вы' : 'Поддержка'),
                          subtitle: Text(message['text']),
                          
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(labelText: "Сообщение"),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}