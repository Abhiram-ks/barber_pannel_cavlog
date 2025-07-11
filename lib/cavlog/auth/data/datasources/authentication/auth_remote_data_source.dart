
import 'package:barber_pannel/core/common/common_hashfunction_class.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRemoteDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> signUpBarber({
    required String barberName,
    required String ventureName,
    required String phoneNumber,
    required String address,
    required String email,
    required String password,
    required bool isVerified,
    required bool isblok,
    String? image,
    int? age,
  }) async {
    try {
      QuerySnapshot emailQuery = await _firestore
          .collection('barbers')
          .where(
            'email',
            isEqualTo: email,
          ).get();

      if (emailQuery.docs.isNotEmpty) {
        return false;
      }
      final String hashedPassword = Hashfunction.generateHash(password);
      UserCredential response = await _auth.createUserWithEmailAndPassword(
          email: email, password: hashedPassword);

      if (response.user != null) {
        await _firestore.collection('barbers').doc(response.user!.uid).set({
          'barberName': barberName,
          'ventureName': ventureName,
          'phoneNumber': phoneNumber,
          'address': address,
          'email': email,
          'isVerified': isVerified,
          'image': image ?? '',
          'age': age ?? 0,
          'isBlok': isblok,
          'Uid':response.user!.uid,
          'createdAt': FieldValue.serverTimestamp(),
        });
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
