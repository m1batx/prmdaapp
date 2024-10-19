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
                if (!snapshot.hasData) return const CircularProgressIndicator();

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
                        // return ListTile(
                        //   title: Text(isUserMessage ? 'Вы' : 'Поддержка',textAlign: isUserMessage? TextAlign.right : TextAlign.left, style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary,),),
                        //   subtitle: Text(message['text'], style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),)
                          
                        // );
                        return Align(
                          alignment: isUserMessage ? Alignment.centerRight : Alignment.centerLeft,
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                            decoration: BoxDecoration(
                              color: isUserMessage ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.secondary,
                              borderRadius: BorderRadius.circular(15.0),
                              // boxShadow:  [
                              //   BoxShadow(
                              //     color: Theme.of(context).colorScheme.inversePrimary,
                              //     blurRadius: 4.0,
                              //     offset: Offset(2, 2),
                              //   ),
                              // ],
                            ),
                            child: Column(
                              crossAxisAlignment:
                                  isUserMessage ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                              children: [
                                Text(
                                  isUserMessage ? "Вы" : "Поддержка",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: isUserMessage ? Colors.white : Colors.black,
                                  ),
                                ),
                                Text(
                                  message['text'],
                                  style: TextStyle(
                                    color: isUserMessage ? Colors.white : Colors.black,
                                    fontSize: 16.0,
                                  ),
                                ),
                                const SizedBox(height: 4.0),
                                
                              ],
                            ),
                          ),
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
                    style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
                    controller: _controller,
                    decoration: InputDecoration(
                      labelText: "Сообщение", 
                      labelStyle: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
                    ),
                  ),
                ),
                IconButton(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  icon: Icon(Icons.send),
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