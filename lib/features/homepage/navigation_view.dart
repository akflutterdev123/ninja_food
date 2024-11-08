import 'package:ninjaa/features/homepage/view/home_view.dart';
import 'package:ninjaa/features/ninja_view/ninja_view.dart';
import 'package:ninjaa/utils/common_library.dart';
import 'package:ninjaa/widgets/bottombar_button.dart';

class NavigationView extends StatefulWidget {
  const NavigationView({
    super.key,
  });

  @override
  State<NavigationView> createState() => _NavigationViewState();
}

class _NavigationViewState extends State<NavigationView> {
  int selectedIndex = 0;

  void changeView({required int index}) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Stack(
          children: [
            IndexedStack(
              index: selectedIndex,
              children: const [HomeView(), NinjaAccountView()],
            ),
            buildBottomNavigationBar()
          ],
        ));
  }

  buildBottomNavigationBar() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 7.h,
        margin: EdgeInsets.only(
            left: 20.sp, right: 20.sp, bottom: 15.sp, top: 5.sp),
        padding: EdgeInsets.all(15.sp),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(25.sp)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomBarButton(
              isVisible: selectedIndex == 0,
              icon: Icons.home,
              onTap: () => changeView(index: 0),
            ),
            BottomBarButton(
                isVisible: selectedIndex == 1,
                icon: Icons.info,
                onTap: () => changeView(index: 1)),
          ],
        ),
      ),
    );
  }
}
