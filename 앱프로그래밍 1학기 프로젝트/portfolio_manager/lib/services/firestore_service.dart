import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> savePortfolio({
    required String title,
    required String description,
    required List<String> techStack,
    required String url,
  }) async {
    final uid = _auth.currentUser?.uid;
    if (uid == null) return;

    final docRef = _firestore
        .collection('portfolios')
        .doc(uid)
        .collection('userPortfolios')
        .doc(); // 자동 생성 ID

    await docRef.set({
      'title': title,
      'description': description,
      'techStack': techStack,
      'url': url,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  Stream<QuerySnapshot> getMyPortfolios() {
    final uid = _auth.currentUser?.uid;
    if (uid == null) {
      return const Stream.empty();
    }

    return _firestore
        .collection('portfolios')
        .doc(uid)
        .collection('userPortfolios')
        .orderBy('createdAt', descending: true)
        .snapshots();
  }
}
