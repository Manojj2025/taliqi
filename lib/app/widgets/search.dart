import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/values.dart';
import 'decoration.dart';

mysearch(
    {width,
    height,
    verticaltext,
    title,
    action,
    controller,
    readonly,
    goto,
    decoration}) {
  return Container(
    width: width ?? Get.width * 0.70,
    // color: Colors.grey,
    height: height ?? 36,
    decoration:
        decoration ?? decorationbox2(color: AppColors.whiteColor, radius: 5.0),
    child: TextField(
      controller: controller,
      onChanged: action,
      autofocus: false,
      keyboardType: TextInputType.text,
      style: const TextStyle(color: Colors.black, fontSize: 16),
      textCapitalization: TextCapitalization.words,
      readOnly: readonly,
      onTap: goto,
      decoration: InputDecoration(
        prefixIcon: IconButton(
          padding: EdgeInsets.zero,
          constraints: BoxConstraints(minWidth: 0, minHeight: 0),
          onPressed: () {},
          icon: const Icon(
            Icons.search,
            color: AppColors.greyprimarycolor,
          ),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        contentPadding:
            EdgeInsets.symmetric(horizontal: 0, vertical: verticaltext ?? 3),
        hintText: title ?? 'Search',
        hintStyle: BaseStyles.greyMedium14,
        border: InputBorder.none,
      ),
    ),
  );
}
