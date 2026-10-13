
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Register a new account. Public registration creates Learners only.
  Future<UserCredential> registerAccount({
    required String email,
    required String password,
    required String displayName,
    required String role,
  }) async {
    if (!['Learner', 'Employer', 'Admin'].contains(role)) {
      throw ArgumentError('Invalid account role.');
    }

    final cleanEmail = email.trim().toLowerCase();
    final cleanName = displayName.trim();

    if (cleanName.isEmpty) {
      throw ArgumentError('Please enter your name.');
    }

    final credential = await _auth.createUserWithEmailAndPassword(
      email: cleanEmail,
      password: password,
    );

    final user = credential.user;

    if (user == null) {
      throw StateError('Firebase did not return a user account.');
    }

    try {
      await _db.collection('users').doc(user.uid).set({
        'email': cleanEmail,
        'displayName': cleanName,
        'role': role,
        'createdAt': FieldValue.serverTimestamp(),
      });
    } catch (_) {
      await _auth.signOut();
      rethrow;
    }

    return credential;
  }

  /// Sign in and retrieve the role assigned to this account.
  Future<String> signIn({
    required String email,
    required String password,
  }) async {
    final credential = await _auth.signInWithEmailAndPassword(
      email: email.trim().toLowerCase(),
      password: password,
    );

    final user = credential.user;

    if (user == null) {
      throw StateError('Firebase did not return a user account.');
    }

    try {
      final profile = await _db.collection('users').doc(user.uid).get();

      if (!profile.exists) {
        throw StateError(
          'Your account profile is missing. Please contact support.',
        );
      }

      final role = profile.data()?['role'];

      if (role is! String ||
          !['Learner', 'Employer', 'Admin'].contains(role)) {
        throw StateError(
          'Your account has an invalid role. Please contact support.',
        );
      }

      return role;
    } catch (_) {
      await _auth.signOut();
      rethrow;
    }
  }

  /// Sign out the current user.
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
