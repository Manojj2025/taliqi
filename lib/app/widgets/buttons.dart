import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/values.dart';

mybuttons(
    {name,
    action,
    color,
    gradient,
    namecolor,
    border,
    style,
    height,
    width,
    widget,
    fontSize,
    radius}) {
  return InkWell(
    onTap: action,
    child: Container(
      margin: const EdgeInsets.only(bottom: 10),
      height: height ?? 45,
      width: width ?? Get.width,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: border,
        color: color ?? AppColors.primaryColor,
        borderRadius: BorderRadius.circular(radius ?? 4.0),
      ),
      child: widget ??
          Text(
            name,
            style: style ?? BaseStyles.whitelarge16,
            textAlign: TextAlign.center,
          ),
    ),
  );
}

mybutton2({title, radius, color}) {
  return Container(
    alignment: Alignment.center,
    height: 45,
    width: Get.width,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(
        radius ?? 4,
      ),
    ),
    child: Text(
      title,
      style: BaseStyles.whitelarge16,
      textAlign: TextAlign.center,
    ),
  );
}
