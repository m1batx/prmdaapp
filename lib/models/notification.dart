class NotificationModel {
  final String id;
  final String title;
  final String message;
  final DateTime timestamp;
  bool isSeen;

  NotificationModel({
    required this.id,
    required this.title,
    required this.message,
    required this.timestamp,
    this.isSeen = false,
  });

  // Factory constructor to create a NotificationModel instance from a JSON map
  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'],
      title: json['title'],
      message: json['message'],
      timestamp: DateTime.parse(json['timestamp']),
      isSeen: json['isSeen'] ?? false,
    );
  }

  // Method to convert a NotificationModel instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'message': message,
      'timestamp': timestamp.toIso8601String(),
      'isSeen': isSeen,
    };
  }
}