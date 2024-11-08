import 'package:ninjaa/dtos/homepage_banner_dto.dart';
import 'package:ninjaa/features/homepage/data/homepage_state.dart';
import 'package:ninjaa/firebase_services/cloud_firestore.dart';
import 'package:ninjaa/utils/common_library.dart';

final homeNotifierProvider =
    NotifierProvider<HomeNotifier, HomeState>(HomeNotifier.new);

class HomeNotifier extends Notifier<HomeState> {
  late CloudFireStoreRepository cloudFireStoreRepository;

  @override
  build() {
    cloudFireStoreRepository = ref.watch(cloudStoreRepositoryProvider);
    throw UnimplementedError();
  }

  // Get Homepage Banners

  Future<List<HomePageBannerDto>> getHomepageBanners() async {
    final result = await cloudFireStoreRepository.fetchHomePageBanners();

    return result;
  }
}
