import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ninjaa/dtos/homepage_banner_dto.dart';
import 'package:ninjaa/utils/common_library.dart';

final cloudStoreRepositoryProvider =
    Provider<CloudFireStoreRepository>((ref) => CloudFireStoreRepository());

class CloudFireStoreRepository {
  final db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<List<HomePageBannerDto>> fetchHomePageBanners() async {
    try {
      final collection =
          await FirebaseFirestore.instance.collection('homepageBanners').get();

      return collection.docs
          .map((doc) => HomePageBannerDto.fromMap(doc.data()))
          .toList();
    } catch (e) {
      print('Error fetching banners: $e');
      return [];
    }
  }

  Future<void> storeUserInfoIfNotExists() async {
    User? user = _auth.currentUser;

    if (user != null) {
      String authId = user.uid;
      String? mobileNumber = user.phoneNumber;

      // Convert mobile number to integer (example: last 9 digits)
      int mobileNumberInt = int.tryParse(
              mobileNumber?.substring(mobileNumber.length - 9) ?? "0") ??
          0;
      int authIdInt =
          authId.hashCode; // Convert authId to integer representation

      // Check if the mobile number already exists in Firestore
      final query = await db
          .collection('users')
          .where('mobileNumber', isEqualTo: mobileNumberInt)
          .get();

      if (query.docs.isEmpty) {
        // Get the current maximum userId
        final snapshot = await db
            .collection('users')
            .orderBy('userId', descending: true)
            .limit(1)
            .get();

        int newUserId = 1; // Default userId if no users are present

        if (snapshot.docs.isNotEmpty) {
          int lastUserId = snapshot.docs.first.get('userId');
          newUserId = lastUserId + 1;
        }

        // Add new user data to Firestore
        await db.collection('users').doc(authId).set({
          'mobileNumber': mobileNumberInt,
          'authId': authIdInt,
          'userId': newUserId,
        });
      } else {
        // Skip update if mobile number already exists
        print('Mobile number already exists. Skipping update.');
      }
    }
  }
}
