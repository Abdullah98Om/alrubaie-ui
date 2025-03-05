import 'package:alrubaie/view/pages/about.dart';
import 'package:alrubaie/view/pages/cart.dart';
import 'package:alrubaie/view/pages/order_detailes.dart';
import 'package:alrubaie/view/pages/products_of_section.dart';
import 'package:alrubaie/view/pages/products_page.dart';
import 'package:alrubaie/view/pages/search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/pages/final_order.dart';
import '../../view/pages/index.dart';
import '../../view/pages/my_orders.dart';
import '../../view/pages/product_detaile.dart';
import '../../view/pages/shaipping_order.dart';
import '../../view/pages/splash.dart';
import '../animations/fade_scale_transition.dart';

List<GetPage<dynamic>>? pageRoutes = [
  // splash
  GetPage(
    name: '/',
    page: () => const Splash(),
    curve: Curves.easeInOut,
    transitionDuration: const Duration(milliseconds: 350),
    //  customTransition: FadeScaleTransition(),
    customTransition: FadeScaleTransition(),
  ),
  // index
  GetPage(
    name: "/${MyPages.indexPage}",
    page: () => const Index(),
    curve: Curves.easeInOut,
    transitionDuration: const Duration(milliseconds: 350),
    //  customTransition: FadeScaleTransition(),
    customTransition: FadeScaleTransition(),
  ),

  // products
  GetPage(
    name: "/${MyPages.products}",
    page: () => const ProductsPage(),
    curve: Curves.easeInOut,
    transitionDuration: const Duration(milliseconds: 350),
    //  customTransition: FadeScaleTransition(),
    customTransition: FadeScaleTransition(),
  ),

  // search
  GetPage(
    name: "/${MyPages.search}",
    page: () => const Search(),
    curve: Curves.easeInOut,
    transitionDuration: const Duration(milliseconds: 350),
    //  customTransition: FadeScaleTransition(),
    customTransition: FadeScaleTransition(),
  ),

  // products Of Section
  GetPage(
    name: "/${MyPages.productsOfSection}",
    page: () => const ProductsOfSection(),
    curve: Curves.easeInOut,
    transitionDuration: const Duration(milliseconds: 350),
    //  customTransition: FadeScaleTransition(),
    customTransition: FadeScaleTransition(),
  ),

  // About
  GetPage(
    name: "/${MyPages.about}",
    page: () => const About(),
    curve: Curves.easeInOut,
    transitionDuration: const Duration(milliseconds: 350),
    //  customTransition: FadeScaleTransition(),
    customTransition: FadeScaleTransition(),
  ),

  // Product Detaile
  GetPage(
    name: "/${MyPages.productDetaile}",
    page: () => const ProductDetaile(),
    curve: Curves.easeInOut,
    transitionDuration: const Duration(milliseconds: 350),
    //  customTransition: FadeScaleTransition(),
    customTransition: FadeScaleTransition(),
  ),

  // cart
  GetPage(
    name: "/${MyPages.cart}",
    page: () => const Cart(),
    curve: Curves.easeInOut,
    transitionDuration: const Duration(milliseconds: 350),
    //  customTransition: FadeScaleTransition(),
    customTransition: FadeScaleTransition(),
  ),

  // shaipping order
  GetPage(
    name: "/${MyPages.shaippingOrder}",
    page: () => const ShaippingOrder(),
    curve: Curves.easeInOut,
    transitionDuration: const Duration(milliseconds: 350),
    //  customTransition: FadeScaleTransition(),
    customTransition: FadeScaleTransition(),
  ),

  // final order
  GetPage(
    name: "/${MyPages.finalOrder}",
    page: () => const FinalOrder(),
    curve: Curves.easeInOut,
    transitionDuration: const Duration(milliseconds: 350),
    //  customTransition: FadeScaleTransition(),
    customTransition: FadeScaleTransition(),
  ),

  // my orders
  GetPage(
    name: "/${MyPages.myOrders}",
    page: () => const MyOrders(),
    curve: Curves.easeInOut,
    transitionDuration: const Duration(milliseconds: 350),
    //  customTransition: FadeScaleTransition(),
    customTransition: FadeScaleTransition(),
  ),

  // order detailes
  GetPage(
    name: "/${MyPages.orderDetailes}",
    page: () => const OrderDetailes(),
    curve: Curves.easeInOut,
    transitionDuration: const Duration(milliseconds: 350),
    //  customTransition: FadeScaleTransition(),
    customTransition: FadeScaleTransition(),
  ),
];

enum MyPages {
  cart,
  productDetaile,
  about,
  productsOfSection,
  search,
  products,
  indexPage,
  shaippingOrder,
  finalOrder,
  myOrders,
  orderDetailes
}
