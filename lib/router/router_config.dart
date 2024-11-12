import 'dart:developer';

import 'package:ninjaa/features/authentication/data/auth_info_model.dart';
import 'package:ninjaa/features/authentication/data/authentication_notifier.dart';
import 'package:ninjaa/features/authentication/otp_view.dart';
import 'package:ninjaa/features/cart/cart_view.dart';
import 'package:ninjaa/features/homepage/view/home_view.dart';
import 'package:ninjaa/features/items_view/items_view.dart';
import 'package:ninjaa/features/ninja_view/ninja_view.dart';
import 'package:ninjaa/features/orders/order_details_view.dart';
import 'package:ninjaa/utils/common_library.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final sectionNavigatorKey = GlobalKey<NavigatorState>();

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: rootNavigatorKey,
    initialLocation: '/$route',
    refreshListenable: ref.watch(authNotifierProvider),
    routes: [
      GoRoute(
        path: '/$route',
        name: '/$route',
        builder: (context, state) => const NavigationView(),
        redirect: (context, state) {
          final auth = ref.watch(authNotifierProvider);
          log('Islogged in ${auth.isLoggedIn}');
          if (!auth.isLoggedIn) {
            return '/$signup';
          }
          return null;
        },
        routes: <RouteBase>[
          GoRoute(
              path: homePage,
              name: homePage,
              builder: (context, state) => const HomeView(),
              routes: [
                GoRoute(
                    parentNavigatorKey: rootNavigatorKey,
                    path: itemsMenu,
                    name: itemsMenu,
                    builder: (context, state) => const ItemsView(),
                    routes: [
                      GoRoute(
                        parentNavigatorKey: rootNavigatorKey,
                        path: cart,
                        name: cart,
                        builder: (context, state) => const CartView(),
                      ),
                      GoRoute(
                        parentNavigatorKey: rootNavigatorKey,
                        path: orderDetails,
                        name: orderDetails,
                        builder: (context, state) => const OrderDetailsView(),
                      ),
                    ]),
                GoRoute(
                  parentNavigatorKey: rootNavigatorKey,
                  path: motoMarket,
                  // redirect: (context, state) async {
                  //   if (!await authNotifier.checkIfAuthenticated()) {
                  //     return '/$signup';
                  //   }
                  //   return null;
                  // },
                  name: motoMarket,
                  builder: (context, state) => const MotomarketView(),
                ),
                GoRoute(
                  parentNavigatorKey: rootNavigatorKey,
                  path: giis,
                  name: giis,
                  builder: (context, state) => const GIISView(),
                ),
              ]),
          GoRoute(
            path: ninjaAccount,
            name: ninjaAccount,
            builder: (context, state) => const NinjaAccountView(),
          ),
        ],
      ),
      GoRoute(
          path: '/$signup',
          name: '/$signup',
          builder: (context, state) => const SignupView(),
          routes: [
            GoRoute(
              path: otp,
              name: otp,
              builder: (context, state) {
                AuthInfoDto authInfoDto = state.extra as AuthInfoDto;

                return OtpView(
                  authInfoDto: authInfoDto,
                );
              },
            ),
          ]),
    ],
  );
});
