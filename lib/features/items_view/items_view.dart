import 'package:ninjaa/utils/common_library.dart';
import 'package:ninjaa/widgets/addtocart_button.dart';

class ItemsView extends ConsumerStatefulWidget {
  const ItemsView({super.key});

  @override
  ConsumerState<ItemsView> createState() => _ItemsViewState();
}

class _ItemsViewState extends ConsumerState<ItemsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ninja Foods Menu Card'),
      ),
      body: Stack(
        children: [
          ListView(padding: EdgeInsets.all(15.sp), children: [
            Image.network(
              'https://yummyindiankitchen.com/wp-content/uploads/2021/07/fish-biryani-machhali-biryani-768x1024.jpg',
            ),
            SizedBox(
              height: 15.sp,
            ),
            Text(
              "Ninja Chicken 65 Briyani",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18.sp,
              ),
            ),
            SizedBox(
              height: 15.sp,
            ),
            Row(
              children: [
                Text(
                  "₹ 149",
                  style:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 20.sp),
                ),
                SizedBox(
                  width: 15.sp,
                ),
                Text(
                  "₹ 249",
                  style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    fontWeight: FontWeight.w400,
                    fontSize: 17.sp,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15.sp,
            ),
            const Text(
                'Ninja special Biryani is a rich, aromatic rice dish with perfectly blended spices and tender meat or veggies. Each layer of basmati rice and marinated ingredients offers deep, flavorful satisfaction. Loved for its warmth and spice, biryani is a true celebration of taste and tradition!'),
            SizedBox(
              height: 15.sp,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AddTocartButton(
                  onTap: () {},
                  cartCount: 1,
                )
              ],
            ),
            SizedBox(
              height: 20.h,
            )
          ]),
          buildCartItemsCard()
        ],
      ),
    );
  }

  Widget buildCartItemsCard() {
    return Align(
        alignment: Alignment.bottomRight,
        child: GestureDetector(
          onTap: () {
            context.goNamed(cart);
          },
          child: Container(
            margin: EdgeInsets.all(15.sp),
            decoration: BoxDecoration(
                color: context.colorScheme.primary,
                borderRadius: BorderRadius.circular(10.sp)),
            padding: EdgeInsets.all(15.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '1 item added',
                  style: TextStyle(
                      color: context.colorScheme.onPrimary,
                      fontWeight: FontWeight.w500),
                ),
                Row(
                  children: [
                    Text(
                      "View Cart",
                      style: TextStyle(
                          color: context.colorScheme.onPrimary,
                          fontWeight: FontWeight.w500),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: context.colorScheme.onPrimary,
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
