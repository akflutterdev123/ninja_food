import 'dart:developer';

import 'package:ninjaa/features/homepage/data/home_provider.dart';
import 'package:ninjaa/utils/common_library.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  Widget build(BuildContext context) {
    final homebanners = ref.watch(getHomePageBanners);
    homebanners.whenData((value) {
      log("homepage banner value is ${value.first.imageUrl}");
    });
    return Scaffold(
        appBar: AppBar(
          elevation: 10,
          title: Image.asset(
            'assets/images/ninja_logo.png',
            width: 50.w,
          ),
        ),
        body: homebanners.when(
            data: (data) {
              return RefreshIndicator(
                  child: ListView.builder(
                    itemCount: data.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final content = data[index];
                      return GestureDetector(
                          onTap: () {
                            context.goNamed(itemsMenu);
                          },
                          child: Image.network(content.imageUrl));
                    },
                  ),
                  onRefresh: () {
                    return ref.refresh(getHomePageBanners.future);
                  });
            },
            error: (error, stackTrace) => Text(error.toString()),
            loading: () => const Text('Loading')));
  }
}


// ListView(
//         shrinkWrap: true,
//         children: [
          
          // CarouselSlider(items: [
          //   Image.network(
          //       "https://mercury.akamaized.net/i/9cf284918f4ebf65792f59dd3be9ca06_284265_0.jpg"),
          //   Image.network(
          //       "https://mercury.akamaized.net/i/bbb13d2d80c3e2ee2fd4efcb26dd0b80_105180_0.jpg"),
          //   Image.network(
          //       "https://mercury.akamaized.net/i/c629e508e5a0cb94cb6092c145150e80_284271_0.jpg"),
          // ], options: CarouselOptions(autoPlay: true, aspectRatio: 3)),
          // SizedBox(
          //   height: 10.sp,
          // ),
          // const MotoMarketProductTile(index: 1),
          // ListView.builder(
          //     shrinkWrap: true,
          //     itemCount: 2,
          //     physics: const NeverScrollableScrollPhysics(),
          //     itemBuilder: (_, i) {
          //       return Column(
          //         children: [
          //           InkWell(
          //             onTap: () {
          //               context.pushNamed(giis);
          //             },
          //             child: Container(
          //                 color: Colors.blueAccent.shade400,
          //                 height: 15.h,
          //                 child: Center(child: Text(context.locale.hello))),
          //           ),
          //           SizedBox(
          //             height: 10.sp,
          //           ),
          //           InkWell(
          //               onTap: () {
          //                 context.pushNamed(motoMarket);
          //               },
          //               child: Image.asset(
          //                 'assets/images/Moto_market_2.png',
          //                 width: 100.w,
          //               )),
          //           SizedBox(
          //             height: 10.sp,
          //           ),
          //           Container(
          //               color: Colors.indigo.shade400,
          //               height: 15.h,
          //               child: const Center(child: Text("Refer & Earn"))),
          //           SizedBox(
          //             height: 10.sp,
          //           ),
          //           Container(
          //               color: Colors.deepOrangeAccent.shade100,
          //               height: 15.h,
          //               child: const Center(child: Text("Ninja Coins")))
          //         ],
          //       );
          //     }),
      //   ],
      // ),
