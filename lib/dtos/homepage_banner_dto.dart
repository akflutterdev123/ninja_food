class HomePageBannerDto {
  final String imageUrl;

  HomePageBannerDto({required this.imageUrl});

  // Factory constructor to create a HomePageBanner object from Firestore data
  factory HomePageBannerDto.fromMap(Map<String, dynamic> data) {
    return HomePageBannerDto(
      imageUrl: data['imageUrl'] ?? '',
    );
  }
}
