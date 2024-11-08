 import 'package:ninjaa/utils/common_library.dart';

class BottomBarButton extends StatelessWidget {
  final bool isVisible ;
  final IconData icon;
  final VoidCallback onTap;
  const BottomBarButton({super.key, required this.isVisible, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.sp),
        child:  Center(child: Icon(icon,size: 22.sp,color: isVisible?Theme.of(context).colorScheme.primary
        :Colors.black54,),),
      ),
    );
  }
}