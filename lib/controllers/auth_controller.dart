import 'package:anisync_flutter/models/anime_model.dart';
import 'package:anisync_flutter/models/user_model.dart';
import 'package:anisync_flutter/routes/app_route_named.dart';
import 'package:anisync_flutter/services/auth_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController get instance => Get.find<AuthController>(tag: "main");

  var firebaseUser = Rxn<User?>(null);
  var isSignedIn = false.obs;
  var currentUser = Rxn<UserModel>(null);

  AuthServices services = AuthServices();

  @override
  void onInit() {
    super.onInit();
    FirebaseAuth.instance.authStateChanges().listen((user) async {
      if (user == null) {
        firebaseUser.value = null;
        isSignedIn.value = false;
        return;
      }

      await _fetchOrCreateUser(user);
      firebaseUser.value = user;
      isSignedIn.value = true;
    });
  }

  Future<void> _fetchOrCreateUser(User user) async {
    final doc = FirebaseFirestore.instance.collection('users').doc(user.uid);
    final snapshot = await doc.get();

    if (!snapshot.exists) {
      final newUser = UserModel(
        id: user.uid,
        email: user.email ?? "",
        bio: "",
        fullname: user.email ?? "",
        favorites: <AnimeModel>[],
      );

      await doc.set(newUser.toMap());
      currentUser.value = newUser;
      return;
    }

    currentUser.value = UserModel.fromMap(snapshot.id, snapshot.data()!);
  }

  Future<void> updateUser(Map<String, dynamic> data) async {
    if (firebaseUser.value != null) {
      final doc = FirebaseFirestore.instance
          .collection('users')
          .doc(firebaseUser.value!.uid);
      await doc.update(data);

      // refresh
      await _fetchOrCreateUser(firebaseUser.value!);
    }
  }

  Future<void> signUp({required String email, required String password}) async {
    User? user = await services.signup(email: email, password: password);

    await _fetchOrCreateUser(user!);
    isSignedIn(true);
    Get.offAllNamed(AppRouteNamed.home);
  }

  Future<void> signIn({required String email, required String password}) async {
    User? user = await services.signin(email: email, password: password);

    await _fetchOrCreateUser(user!);
    isSignedIn(true);

    Get.offAllNamed(AppRouteNamed.home);
  }

  Future<void> logout() async {
    services.signout();
    isSignedIn(false);

    Get.offAllNamed(AppRouteNamed.login);
  }
}
