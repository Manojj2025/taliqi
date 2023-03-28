import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/dimensions.dart';
import '../../../constants/values.dart';

class BottomNavItem extends StatelessWidget {
  final String iconData;
  final String name;
  final Function() onTap;
  final bool isSelected;
  BottomNavItem(
      {required this.iconData,
      required this.onTap,
      required this.isSelected,
      required this.name});

  @override
  Widget build(BuildContext context) {
    print(isSelected);
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          // width: Get.width,

          height: 50,
          child: Column(
            children: [
              SizedBox(
                height: 6,
              ),
              Image.asset(
                iconData,
                height: 25,
                width: 25,
                color: isSelected
                    ? AppColors.secondarydarkColor
                    : AppColors.greyprimarycolor,
              ),
              Text(
                name,
                style: robotoMedium.copyWith(
                  fontSize: Dimensions.fontSizeSmall,
                  color: isSelected
                      ? AppColors.secondarydarkColor
                      : AppColors.greyprimarycolor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
