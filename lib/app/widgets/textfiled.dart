import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/values.dart';
import 'decoration.dart';

textfiled(
    {text,
    height,
    prifixshow,
    prifixcolor,
    prifixtext,
    borderSidecolor,
    prifixiconshow,
    prefixicon,
    suffixIconcolor,
    onFieldSubmitted,
    suffixicon,
    fillColor,
    width,
    controller,
    ontap,
    suffixsize,
    onchange,
    prefixtext,
    focusNode,
    eyeshow,
    readonly,
    suffixontab,
    radius,
    minline,
    horizontalpadd,
    maxline,
    style}) {
  return TextFormField(
    // autofocus: true,

    // cursorHeight: ,
    focusNode: focusNode,
    onChanged: onchange,

    onTap: ontap,
    readOnly: readonly,
    minLines: minline ?? 1,
    maxLines: maxline ?? 1,
    controller: controller,
    // inputFormatters: [LengthLimitingTextInputFormatter(10)],
    keyboardType: TextInputType.text,
    style: style ?? BaseStyles.blacNormal14,
    onFieldSubmitted: onFieldSubmitted,
    decoration: InputDecoration(
      filled: true,
      fillColor: fillColor ?? AppColors.greyprimarycolor.shade100,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius ?? 4.0),
        borderSide: BorderSide(
          color: borderSidecolor ?? AppColors.greyprimarycolor.shade100,
        ),
      ),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius ?? 4.0),
          borderSide: BorderSide(
            color: borderSidecolor ?? AppColors.greyprimarycolor.shade100,
          )),
      prefixStyle: BaseStyles.grey1Medium14,
      prefixIcon: prifixshow == true
          ? prefixtext ??
              Container(
                width: 50,
                margin: EdgeInsets.only(right: 10),
                decoration: MyDecoration.radiusonlydecoration(
                    color: prifixcolor ?? AppColors.greyprimarycolor.shade300,
                    tlradius: 4.0,
                    blradius: 4.0),
                alignment: Alignment.center,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: prifixiconshow != true ? 0.0 : 8.0),
                      child: Text(
                        prifixtext ?? '+91',
                        style: BaseStyles.grey1Medium14,
                      ),
                    ),
                    prifixiconshow == true
                        ? Icon(
                            prefixicon ?? Icons.keyboard_arrow_down_sharp,
                            color: AppColors.greyprimarycolor,
                            size: 20,
                          )
                        : Container()
                  ],
                ),
              )
          : null,
      suffixIcon: eyeshow == true
          ? IconButton(
              padding: EdgeInsets.zero,
              constraints: BoxConstraints(minWidth: 0, minHeight: 0),
              onPressed: suffixontab,
              icon: Icon(
                suffixicon ?? Icons.remove_red_eye_outlined,
                color: AppColors.greyprimarycolor,
                size: suffixsize ?? 20.0,
              ))
          : const SizedBox(),
      hintStyle: BaseStyles.grey3Normal16,
      isDense: true,
      contentPadding:
          EdgeInsets.symmetric(horizontal: horizontalpadd ?? 15, vertical: 10),
      hintText: text,
      border: InputBorder.none,
    ),
  );
}

textfiled5({text, height, width, controller, ontap, onclear, suffixIcon}) {
  return Container(
    decoration: decorationbox3(
      border: Border.all(color: AppColors.greyprimarycolor.shade100),
      color: AppColors.greyprimarycolor.shade100,
      radius: 4.0,
    ),
    width: width,
    // margin: const EdgeInsets.only(left: 5, right: 5),
    height: height ?? 45,
    child: TextField(
      onTap: ontap,
      // maxLines: 10,
      controller: controller,
      // inputFormatters: [LengthLimitingTextInputFormatter(10)],
      keyboardType: TextInputType.text,
      // cursorColor: Theme.of(context).primaryColor,
      style: BaseStyles.blacNormal14,

      decoration: InputDecoration(
        hintStyle: BaseStyles.grey3Normal14,
        // isDense: true,

        contentPadding: EdgeInsets.only(top: 13, left: 10),
        suffixIcon: IconButton(onPressed: onclear, icon: suffixIcon),
        // prefix: ,
        prefixIcon: Padding(
            padding: EdgeInsets.all(10),
            child: Icon(
              Icons.search,
              color: AppColors.greyprimarycolor,
            )),
        hintText: text,
        border: InputBorder.none,
      ),
    ),
  );
}

// textfiled2({text, title, show, controller, labeltxt}) {
//   return TextField(
//     // autofocus: true,
//     controller: controller,

//     keyboardType: show == true ? TextInputType.number : TextInputType.text,
//     // cursorColor: Theme.of(context).primaryColor,
//     style: BaseStyles.purpleMedium16,
//     decoration: InputDecoration(
//       filled: true, fillColor: Colors.white,
//       disabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10.0),
//           borderSide: BorderSide(color: AppColors.greycolor, width: 0.2)),
//       enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10.0),
//           borderSide: BorderSide(color: AppColors.greycolor, width: 0.2)),
//       focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10.0),
//           borderSide: BorderSide(
//             color: AppColors.greycolor,
//           )),
//       // hintStyle: BaseStyles.grey18,
//       isDense: true,
//       labelStyle: BaseStyles.greyMedium15,
//       labelText: labeltxt ?? "",
//       contentPadding: const EdgeInsets.all(15),

//       // suffixIcon: Padding(
//       //     padding: const EdgeInsets.only(right: 8),
//       //     child: show == 'true' ? Icon(Icons.add_link) : Container()),

//       // prefixStyle: BaseStyles.blacklight15,
//       // hintText: text,
//       // border: InputBorder.none,
//     ),
//   );
// }

// alltextfiled({text, controller, show, icon}) {
//   return Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: TextField(
//       controller: controller,
//       inputFormatters: [
//         show == true
//             ? LengthLimitingTextInputFormatter(10)
//             : LengthLimitingTextInputFormatter(50)
//       ],
//       keyboardType: show == true ? TextInputType.number : TextInputType.text,
//       // keyboardType: TextInputType.text,
//       // cursorColor: Theme.of(context).primaryColor,
//       style: BaseStyles.whiteMedium16,
//       decoration: InputDecoration(
//         enabledBorder: const UnderlineInputBorder(
//             borderSide: BorderSide(color: AppColors.whiteColor)),
//         focusedBorder: const UnderlineInputBorder(
//             borderSide: BorderSide(
//           color: AppColors.whiteColor,
//         )),
//         hintStyle: BaseStyles.whiteMedium16,
//         isDense: true,
//         contentPadding: const EdgeInsets.all(15),
//         prefixIcon: Padding(
//             padding: const EdgeInsets.only(right: 8),
//             child: Icon(
//               icon,
//               color: AppColors.whiteColor,
//               size: 25,
//             )),
//         prefixStyle: BaseStyles.blacNormal14,
//         hintText: text,
//         border: InputBorder.none,
//       ),
//     ),
//   );
// }

textwidget(
    {name,
    text,
    minline,
    readonly,
    height,
    onTap,
    borderSidecolor,
    fillColor,
    nameicon,
    maxline,
    controller,
    onchange,
    showtext}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      showtext ??
          Row(
            children: [
              Text(
                name,
                style: BaseStyles.grey1Medium14,
              ),
              widthSpace5,
              nameicon ?? Container()
            ],
          ),
      heightSpace5,
      textfiled(
        borderSidecolor: borderSidecolor,
        fillColor: fillColor,
        onchange: onchange,
        controller: controller,
        maxline: maxline,
        ontap: onTap,
        readonly: readonly ?? false,
        text: text,
        height: height ?? 40.0,
        minline: minline,
      )
    ],
  );
}
