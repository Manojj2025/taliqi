import 'package:taliqi/app/widgets/search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/values.dart';

myappbar() {
  return PreferredSize(
      preferredSize: Size(Get.width, 55.0),
      child: AppBar(
        centerTitle: false,
        leadingWidth: 52,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: CircleAvatar(
              radius: 18,
              child: Image.asset(
                'assets/image/profile.png',
              )),
        ),
        title: mysearch(readonly: false),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: const Icon(
              Icons.notifications_none_outlined,
              size: 30,
              color: AppColors.whiteColor,
            ),
          )
        ],
      )
      //  Container(
      //   height: 70,
      //   padding: const EdgeInsets.all(5.0),
      //   color: AppColors.primaryColor,
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
      //     children: [
      //       CircleAvatar(
      //           radius: 18,
      //           child: Image.asset(
      //             'assets/image/profile.png',
      //           )),
      //       mysearch(readonly: false),
      //       const Icon(
      //         Icons.notifications_none_outlined,
      //         size: 30,
      //         color: AppColors.whiteColor,
      //       )
      //   ],
      // ),
      );
}

myappbar2({title, show, show2, widget, ontab1, icon1, ontab2}) {
  return AppBar(
    leadingWidth: 30,
    centerTitle: false,
    title: Text(
      title ?? "",
      style: BaseStyles.whiteMedium16,
    ),
    actions: [
      widget ?? Container(),
      show
          ? Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Row(
                children: [
                  show2 ??
                      InkWell(
                        onTap: ontab1,
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor2,
                            borderRadius: BorderRadius.circular(3),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 1.0,
                                blurRadius: 2,
                                offset:
                                    Offset(0, 2), // changes position of shadow
                              ),
                            ],
                          ),
                          height: 30,
                          width: 30,
                          child: Icon(
                            icon1 ?? Icons.person_add_alt_rounded,
                            color: AppColors.whiteColor,
                            size: 18,
                          ),
                        ),
                      ),
                  widthSpace10,
                  widthSpace5,
                  InkWell(
                    onTap: ontab2,
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor2,
                        borderRadius: BorderRadius.circular(3),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 1.0,
                            blurRadius: 2,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      height: 30,
                      width: 30,
                      child: Icon(
                        Icons.more_vert_sharp,
                        color: AppColors.whiteColor,
                        size: 18,
                      ),
                    ),
                  )
                ],
              ),
            )
          : Container()
    ],
  );
}
