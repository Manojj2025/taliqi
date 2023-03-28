import 'package:flutter/material.dart';

import '../constants/values.dart';

class MyDecoration {
  static simpledecoration({radius, color}) {
    return BoxDecoration(
      color: color ?? Colors.white,
      borderRadius: BorderRadius.circular(radius ?? 30),
    );
  }

  static radiusonlydecoration(
      {tlradius, trradius, blradius, brradius, color, boxShadow}) {
    return BoxDecoration(
      boxShadow: boxShadow,
      color: color ?? Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(tlradius ?? 0),
        topRight: Radius.circular(trradius ?? 0),
        bottomLeft: Radius.circular(blradius ?? 0),
        bottomRight: Radius.circular(brradius ?? 0),
      ),
    );
  }

  static decorationradiusonly(topleft, topright, color) {
    return BoxDecoration(
        color: color ?? AppColors.whiteColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0.2,
            blurRadius: 3,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(topleft ?? 0),
            topRight: Radius.circular(topright ?? 0)));
  }

  static simple3decoration() {
    return BoxDecoration(
      color: AppColors.whiteColor,
      shape: BoxShape.circle,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 0.2,
          blurRadius: 2,
          offset: const Offset(0, 2), // changes position of shadow
        ),
      ],
    );
  }

  static simple2decoration({color, radius, boxshadow}) {
    return BoxDecoration(
        color: color == null ? AppColors.whiteColor : AppColors.whiteColor,
        borderRadius: BorderRadius.circular(radius ?? 10),
        boxShadow: boxshadow);
  }
}

BoxDecoration decorationbox2({color, radius, opacity}) {
  return BoxDecoration(
    color: color == null ? Colors.white : color,
    borderRadius: BorderRadius.circular(radius ?? 0.0),
  );
}

BoxDecoration decorationbox({color, border, radius}) {
  return BoxDecoration(
    border: border,
    color: color == null ? Colors.white : color,
    borderRadius: BorderRadius.circular(radius ?? 5),
    // boxShadow: [
    //   BoxShadow(
    //     color: Colors.grey.shade100,
    //     spreadRadius: 0.2,
    //     blurRadius: 0,
    //     offset: Offset(0, 1), // changes position of shadow
    //   ),
    // ],
  );
}

BoxDecoration decorationbox3({color, radius, border}) {
  return BoxDecoration(
    // gradient: gradient ?? null,
    color: color ?? Colors.white,
    border: border,
    borderRadius: BorderRadius.circular(radius ?? 0.0),
  );
}
