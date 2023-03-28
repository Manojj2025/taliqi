import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../constants/values.dart';
import 'decoration.dart';

rating() {
  return SizedBox(
    height: 100,
    child: ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 80,
          child: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
            backgroundImage: AssetImage('assets/rate.png'),
            child: Stack(
              children: [
                Positioned(
                  bottom: 5,
                  left: 10,
                  // right: 10,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                    decoration: decorationbox2(radius: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.star_border,
                          color: AppColors.whiteColor,
                          size: 12,
                        ),
                        widthSpace5,
                        Text(
                          '3.0',
                          style: BaseStyles.whitenormal12,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

Widget chartRow(BuildContext context, String label, int pct) {
  return Row(
    children: [
      Text(label, style: BaseStyles.blacNormal12),
      SizedBox(width: 8),
      Icon(
        Icons.star,
        color: AppColors.blackColor,
        size: 15,
      ),
      SizedBox(
        width: 8,
      ),
      Padding(
        padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
        child: Stack(children: [
          Container(
            height: 6,
            width: MediaQuery.of(context).size.width * 0.40,
            decoration: BoxDecoration(
                color: AppColors.greyprimarycolor.shade200,
                borderRadius: BorderRadius.circular(20)),
            child: Text(''),
          ),
          Container(
            height: 6,
            width: MediaQuery.of(context).size.width * (pct / 100) * 0.40,
            decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(20)),
            child: Text(''),
          ),
        ]),
      ),
      SizedBox(width: 30, child: Text('$pct', style: BaseStyles.greyNormal12)),
    ],
  );
}

Widget Circularwidget({rate, text}) {
  return Column(
    children: [
      SizedBox(
        width: 40,
        height: 50,
        child: CircularPercentIndicator(
          animation: true,
          radius: 18.0,
          lineWidth: 3.0,
          percent: 0.8,
          center: Text(
            rate,
            style: BaseStyles.grey2normal12,
          ),
          progressColor: AppColors.primaryColor,
        ),
      ),
      Text(
        text,
        style: BaseStyles.grey2normal12,
      )
    ],
  );
}
