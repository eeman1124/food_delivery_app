import 'package:firebase_database/firebase_database.dart';

class FirestoreService {
  final DatabaseReference _db = FirebaseDatabase.instance.ref();

  Future<void> saveOrderToDatabase(String receipt) async {
    await _db.child('orders').push().set({
      'date': DateTime.now().toString(),
      'order': receipt,
    });
  }

  Stream getOrders() {
    return _db.child('orders').onValue;
  }
}