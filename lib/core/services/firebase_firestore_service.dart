import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:to_do_app/core/services/firebase_auth_services.dart';

class FirebaseFirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Add a new task
  Future<Result<void>> addTask(String title, String subtitle) async {
    try {
      final userId = FirebaseAuth.instance.currentUser?.uid;
      if (userId == null) {
        return Result.failure('User not authenticated');
      }

      final task = {
        'title': title,
        'subtitle': subtitle,
        'createdAt': FieldValue.serverTimestamp(),
      };

      await _firestore.collection('tasks').add(task);
      return Result.success(null);
    } catch (e) {
      return Result.failure('Error adding task: ${e.toString()}');
    }
  }

  // Fetch all tasks
  Future<Result<List<Map<String, dynamic>>>> getTasks() async {
    try {
      final querySnapshot = await _firestore.collection('tasks').get();
      final tasks = querySnapshot.docs.map((doc) {
        return {
          'id': doc.id,
          'title': doc['title'],
          'subtitle': doc['subtitle'],
        };
      }).toList();
      return Result.success(tasks);
    } catch (e) {
      return Result.failure('Error fetching tasks: ${e.toString()}');
    }
  }

  // Update a task
  Future<Result<void>> updateTask(String taskId, String title, String subtitle) async {
    try {
      await _firestore.collection('tasks').doc(taskId).update({
        'title': title,
        'subtitle': subtitle,
      });
        String userToken = await getUserToken(taskId); // Fetch user token from Firestore or FCM
  PushNotificationService().sendPushNotification(userToken, "Task Updated", "The task has been updated!");
      return Result.success(null);
    } catch (e) {
      return Result.failure('Error updating task: ${e.toString()}');
    }
  }

  // Delete a task
  Future<Result<void>> deleteTask(String taskId) async {
    try {
      await _firestore.collection('tasks').doc(taskId).delete();
      return Result.success(null);
    } catch (e) {
      return Result.failure('Error deleting task: ${e.toString()}');
    }
  }
}
