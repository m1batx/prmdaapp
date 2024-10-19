import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SupportChatPage extends StatefulWidget {
  final String userId; // The selected userId for the chat

  const SupportChatPage({super.key, required this.userId});

  @override
  _SupportChatPageState createState() => _SupportChatPageState();
}

class _SupportChatPageState extends State<SupportChatPage> {
  final TextEditingController _controller = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> _sendMessage() async {
    if (_controller.text.isNotEmpty) {
      await _firestore.collection('chats').add({
        'text': _controller.text,
        'senderId': 'support',
        'recipient': widget.userId, // Send the message to the selected user
        'timestamp': Timestamp.now(),
      });
      _controller.clear();
    }
  }

  Widget _buildMessage(Map<String, dynamic> messageData, bool isSupportMessage) {
    return Align(
      alignment: isSupportMessage ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        decoration: BoxDecoration(
          color: isSupportMessage ? Colors.blueAccent : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow:  [
            BoxShadow(
              color: Theme.of(context).colorScheme.primary,
              blurRadius: 4.0,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment:
              isSupportMessage ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(
              messageData['text'],
              style: TextStyle(
                color: isSupportMessage ? Colors.white : Colors.black87,
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 4.0),
            Text(
              isSupportMessage ? "Support" : "User",
              style: TextStyle(
                fontSize: 12.0,
                color: isSupportMessage ? Colors.white70 : Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(
          'Chat with User: ${widget.userId}',
          style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _firestore
                  .collection('chats')
                  .where('recipient', isEqualTo: widget.userId)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return const CircularProgressIndicator();

                // Fetch all messages between support and this user
                final userMessages = snapshot.data!.docs;
                final supportMessagesStream = _firestore
                    .collection('chats')
                    .where('senderId', isEqualTo: widget.userId)
                    .snapshots();

                return StreamBuilder<QuerySnapshot>(
                  stream: supportMessagesStream,
                  builder: (context, supportSnapshot) {
                    if (!supportSnapshot.hasData) return const CircularProgressIndicator();

                    // Combine user and support messages
                    final supportMessages = supportSnapshot.data!.docs;
                    final allMessages = [...userMessages, ...supportMessages];

                    // Sort messages by timestamp
                    allMessages.sort((a, b) => (a['timestamp'] as Timestamp)
                        .compareTo(b['timestamp'] as Timestamp));

                    return ListView.builder(
                      //reverse: true,
                      itemCount: allMessages.length,
                      itemBuilder: (context, index) {
                        final message = allMessages[index];
                        final isSupportMessage = message['senderId'] == 'support';
                        return _buildMessage(
                            message.data() as Map<String, dynamic>, isSupportMessage);
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
                    decoration: InputDecoration(
                      labelText: "Сообщение",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _sendMessage,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
