import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:random_string/random_string.dart';

class FirebaseServices {
  // Firebase Authentication instance
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  // Firestore instance
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Current user getter
  User? get currentUser => _auth.currentUser;
  
  // Check if user is logged in
  bool get isUserLoggedIn => _auth.currentUser != null;

  // Sign up with email and password
  Future<User?> signUpWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      // Create user with email and password
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      
      // Generate a unique ID for the user document
      String userId = randomAlphaNumeric(16);
      
      // Create user data map
      Map<String, dynamic> userDataMap = {
        "userId": userId,
        "name": name,
        "email": email,
        "createdAt": Timestamp.now(),
        "profileUrl": "",
      };
      
      // Save user data to Firestore
      await _firestore.collection("users").doc(userCredential.user!.uid).set(userDataMap);
      
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      print("Sign up error: ${e.message}");
      rethrow;
    }
  }

  // Sign in with email and password
  Future<User?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      print("Sign in error: ${e.message}");
      rethrow;
    }
  }

  // Sign out
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print("Sign out error: $e");
      rethrow;
    }
  }

  // Reset password
  Future<void> resetPassword({required String email}) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      print("Password reset error: ${e.message}");
      rethrow;
    }
  }

  // Get user details from Firestore
  Future<Map<String, dynamic>?> getUserDetails() async {
    try {
      if (_auth.currentUser != null) {
        DocumentSnapshot userDoc = await _firestore
            .collection("users")
            .doc(_auth.currentUser!.uid)
            .get();
        
        return userDoc.data() as Map<String, dynamic>?;
      }
      return null;
    } catch (e) {
      print("Error getting user details: $e");
      return null;
    }
  }

  // Update user profile
  Future<void> updateUserProfile({
    String? name,
    String? profileUrl,
  }) async {
    try {
      Map<String, dynamic> updateData = {};
      
      if (name != null && name.isNotEmpty) {
        updateData['name'] = name;
      }
      
      if (profileUrl != null && profileUrl.isNotEmpty) {
        updateData['profileUrl'] = profileUrl;
      }
      
      if (updateData.isNotEmpty && _auth.currentUser != null) {
        await _firestore
            .collection("users")
            .doc(_auth.currentUser!.uid)
            .update(updateData);
      }
    } catch (e) {
      print("Error updating profile: $e");
      rethrow;
    }
  }
}
