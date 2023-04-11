import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class RefugeePalFirebaseUser {
  RefugeePalFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

RefugeePalFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<RefugeePalFirebaseUser> refugeePalFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<RefugeePalFirebaseUser>(
      (user) {
        currentUser = RefugeePalFirebaseUser(user);
        return currentUser!;
      },
    );
