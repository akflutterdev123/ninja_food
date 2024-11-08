import 'package:ninjaa/dtos/homepage_banner_dto.dart';
import 'package:ninjaa/features/homepage/data/home_notifier.dart';
import 'package:ninjaa/utils/common_library.dart';

final getHomePageBanners =
    FutureProvider.autoDispose<List<HomePageBannerDto>>((ref) async {
  final notifier = ref.read(homeNotifierProvider.notifier);
  return notifier.getHomepageBanners();
});
