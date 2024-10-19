import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:prmda/api/FirebaseApi.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title:  Text(
          "Уведомления",
          style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
          ),
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<Map<String, dynamic>>>(
              future: FirebaseApi().loadNotifications(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  print('Error: ${snapshot.error} ');
                  return const Center(child: Text(''));
                }
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('Нет уведомлений', style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary,),));
                }
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    Map<String, dynamic> notification = snapshot.data![index];
                    if (notification['timestamp']==null){
                      return ListTile(
                      title: Text(notification['title'], style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary,)),
                      subtitle: Text(notification['body'], style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary,)),);
                    }
                    Timestamp timestamp = notification['timestamp'];
                    DateTime date = timestamp.toDate();
                    return ListTile(
                      title: Text(notification['title'], style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary,)),
                      subtitle: Text(notification['body'], style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary,)),
                      trailing: Text(date.toString(), style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary,)),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
