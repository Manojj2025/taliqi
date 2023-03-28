import 'package:taliqi/app/modules/jobs_screens/views/totalapplication.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:readmore/readmore.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../constants/values.dart';
import '../../../widgets/appbar.dart';
import '../../../widgets/buttons.dart';
import '../../../widgets/decoration.dart';
import '../../../widgets/jobdetailwidget.dart';
import '../../../widgets/textfiled.dart';

class CompanydeatilsView extends GetView {
  const CompanydeatilsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: myappbar2(
            title: JobsName.CompanyDetails, show: false, show2: Container()),
        body: ListView(
          children: [
            Container(
              color: AppColors.whiteColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    textwidget(name: 'Organization Name*', text: 'Enter'),
                    const Divider(
                      thickness: 0.3,
                      height: 25,
                    ),
                    textwidget(name: 'Email*', text: 'Enter'),
                    const Divider(
                      thickness: 0.3,
                      height: 25,
                    ),
                    textwidget(name: 'Website*', text: 'Enter'),
                    const Divider(
                      thickness: 0.3,
                      height: 25,
                    ),
                    textwidget(name: 'Custom Url', text: 'Enter'),
                    const Divider(
                      thickness: 0.3,
                      height: 25,
                    ),
                    textwidget(name: 'Logo', text: 'Enter'),
                    const Divider(
                      thickness: 0.3,
                      height: 25,
                    ),
                    textwidget(name: 'Timezone*', text: 'Enter'),
                    const Divider(
                      thickness: 0.3,
                      height: 25,
                    ),
                    textwidget2(name: 'Currency', text: 'Select'),
                    const Divider(
                      thickness: 0.3,
                      height: 25,
                    ),
                    textwidget(name: 'Address*', text: 'Enter'),
                    const Divider(
                      thickness: 0.3,
                      height: 25,
                    ),
                    textwidget(name: 'Landmark', text: 'Enter'),
                    const Divider(
                      thickness: 0.3,
                      height: 25,
                    ),
                    textwidget(name: 'State*', text: 'Enter'),
                    const Divider(
                      thickness: 0.3,
                      height: 25,
                    ),
                    textwidget2(name: 'City*', text: 'Select'),
                    const Divider(
                      thickness: 0.3,
                      height: 25,
                    ),
                    textwidget(name: 'Post Code*', text: 'Enter'),
                    const Divider(
                      thickness: 0.3,
                      height: 25,
                    ),
                    textwidget(
                        height: 150.0,
                        readonly: false,
                        onTap: () {},
                        minline: 8,
                        maxline: 8,
                        name: 'About*',
                        text: 'Write'),
                    const Divider(
                      thickness: 0.3,
                      height: 25,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: mybuttons(
                                style: BaseStyles.grey2normal14,
                                border: Border.all(
                                    color: AppColors.greyprimarycolor.shade200),
                                action: () {
                                  // Get.to(OppurtunityAddedView());
                                  // controller
                                  //     .index
                                  //     .value = ;
                                  print('object');
                                },
                                name: 'Post Job',
                                color: AppColors.whiteColor,
                                height: 40.0)),
                        widthSpace10,
                        Expanded(
                            child: mybuttons(
                                style: BaseStyles.whitenormal14,
                                action: () {
                                  // Get.to(AddNewClientView());
                                },
                                name: 'Save Changes',
                                color: AppColors.orangecolor,
                                height: 40.0))
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
