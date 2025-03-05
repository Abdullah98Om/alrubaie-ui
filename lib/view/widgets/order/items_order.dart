import 'package:alrubaie/model/item_model.dart';
import 'package:alrubaie/utility/converter.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utility/constant.dart';
import '../my_divider.dart';

class ItemsOrder extends StatelessWidget {
  final List<ItemModel> items;
  const ItemsOrder({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Column(
          children: [
            SizedBox(height: 12.h),
            // titlet row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 30.w,
                  child: const Icon(
                    Icons.camera_alt_rounded,
                    size: 20,
                    color: greyColor,
                  ),
                ),
                SizedBox(
                  width: 30.w,
                ),
                // product name
                Expanded(
                  child: Text(
                    "المنتج",
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: greyColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                // count item
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.12,
                  child: Text(
                    "العدد",
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: greyColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),

                // price item
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.25,
                  child: Text(
                    "السعر",
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: greyColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            const MyDivider(),

            SizedBox(height: 8.h),

            // for (ItemModel i in items)
            SizedBox(
              // height: MediaQuery.sizeOf(context).height * 0.2,
              width: MediaQuery.sizeOf(context).width,
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.defaultDialog(
                                    title: "${items[index].product!.name}",
                                    backgroundColor: Colors.white,
                                    content: SizedBox(
                                      width: 200.w,
                                      height: 200.w,
                                      child: CachedNetworkImage(
                                          fit: BoxFit.contain,
                                          imageUrl: items[index].product!.img!),
                                    ));
                              },
                              child: Container(
                                width: 35.w,
                                height: 35.w,
                                padding: const EdgeInsets.all(3),
                                margin: EdgeInsets.only(left: 5.w),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    // borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: primaryColorShade
                                            .withOpacity(0.4))),
                                child: CachedNetworkImage(
                                    fit: BoxFit.contain,
                                    imageUrl: items[index].product!.img!),
                              ),
                            ),
                            // product name
                            Expanded(
                              child: Text(
                                "${items[index].product!.name}",
                                textAlign: TextAlign.start,
                                maxLines: 1,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: primaryColorShade,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            // count item
                            SizedBox(
                              // color: Colors.amber,
                              width: MediaQuery.sizeOf(context).width * 0.12,
                              child: Text(
                                "${items[index].count}",
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: primaryColorShade,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            // price item
                            SizedBox(
                              // color: Colors.red,
                              width: MediaQuery.sizeOf(context).width * 0.25,
                              child: Text(
                                convertPrice(items[index].getPriceItem()),
                                textAlign: TextAlign.end,
                                maxLines: 2,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: primaryColorShade,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12.h),
                      ],
                    );
                  }),
            ),
          ],
        ));
  }
}

class ItemsOrderForDetailes extends StatelessWidget {
  final List<ItemModel> items;
  const ItemsOrderForDetailes({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Column(
          children: [
            SizedBox(height: 12.h),
            // titlet row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 30.w,
                  child: const Icon(
                    Icons.camera_alt_rounded,
                    size: 20,
                    color: greyColor,
                  ),
                ),
                SizedBox(
                  width: 30.w,
                ),
                // product name
                Expanded(
                  child: Text(
                    "المنتج",
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: greyColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                // count item
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.12,
                  child: Text(
                    "العدد",
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: greyColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),

                // price item
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.25,
                  child: Text(
                    "السعر",
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: greyColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            const MyDivider(),

            SizedBox(height: 8.h),

            // for (ItemModel i in items)
            SizedBox(
              // height: MediaQuery.sizeOf(context).height * 0.25,
              width: MediaQuery.sizeOf(context).width,
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.defaultDialog(
                                    title: "${items[index].product!.name}",
                                    backgroundColor: Colors.white,
                                    content: SizedBox(
                                      width: 200.w,
                                      height: 200.w,
                                      child: CachedNetworkImage(
                                          fit: BoxFit.contain,
                                          imageUrl: items[index].product!.img!),
                                    ));
                              },
                              child: Container(
                                width: 35.w,
                                height: 35.w,
                                padding: const EdgeInsets.all(3),
                                margin: EdgeInsets.only(left: 5.w),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    // borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: primaryColorShade
                                            .withOpacity(0.4))),
                                child: CachedNetworkImage(
                                    fit: BoxFit.contain,
                                    imageUrl: items[index].product!.img!),
                              ),
                            ),
                            // product name
                            Expanded(
                              child: Text(
                                "${items[index].product!.name}",
                                textAlign: TextAlign.start,
                                maxLines: 1,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: primaryColorShade,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            // count item
                            SizedBox(
                              // color: Colors.amber,
                              width: MediaQuery.sizeOf(context).width * 0.12,
                              child: Text(
                                "${items[index].count}",
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: primaryColorShade,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            // price item
                            SizedBox(
                              // color: Colors.red,
                              width: MediaQuery.sizeOf(context).width * 0.25,
                              child: Text(
                                convertPrice(items[index].getPriceItem()),
                                textAlign: TextAlign.end,
                                maxLines: 2,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: primaryColorShade,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12.h),
                      ],
                    );
                  }),
            ),
          ],
        ));
  }
}
