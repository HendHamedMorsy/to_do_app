import 'dart:convert';
import 'package:http/http.dart' as http;

class PushNotificationService {
  final String _serverKey = 'YOUR_SERVER_KEY_HERE'; // Replace with your server key

  // Send push notification via HTTP API
  Future<void> sendPushNotification(String token, String title, String body) async {
    final Uri url = Uri.parse('https://fcm.googleapis.com/fcm/send');

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'key=$_serverKey',
    };

    final data = {
      'to': token,  // Use the device token for sending the notification to the specific device
      'notification': {
        'title': title,
        'body': body,
      },
      'priority': 'high',  // You can set priority as per your need (e.g., high, normal)
    };

    try {
      final response = await http.post(url, headers: headers, body: json.encode(data));

      if (response.statusCode == 200) {
        print("Notification sent successfully!");
      } else {
        print("Failed to send notification: ${response.statusCode}");
      }
    } catch (e) {
      print("Error sending notification: $e");
    }
  }
}
