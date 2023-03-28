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
import '../controllers/email_controller.dart';

class CreateEmailView extends GetView<EmailController> {
  const CreateEmailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => EmailController());
    return Scaffold(
        appBar: myappbar2(
            title: HomeName.EmailConfiguration,
            show: false,
            show2: Container()),
        body: Container(
          color: AppColors.whiteColor,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView(
              children: [
                textwidget(name: 'Email Host*', text: 'Enter'),
                const Divider(
                  thickness: 0.3,
                  height: 25,
                ),
                textwidget(name: 'Host Username*', text: 'Enter'),
                const Divider(
                  thickness: 0.3,
                  height: 25,
                ),
                textwidget(name: 'Host Password*', text: 'Enter'),
                const Divider(
                  thickness: 0.3,
                  height: 25,
                ),
                textwidget(name: 'Port*', text: 'Enter'),
                const Divider(
                  thickness: 0.3,
                  height: 25,
                ),
                textwidget(name: 'Use TLS*', text: 'Enter'),
                const Divider(
                  thickness: 0.3,
                  height: 25,
                ),
                textwidget(name: 'From Email*', text: 'Enter'),
                const Divider(
                  thickness: 0.3,
                  height: 25,
                ),
                heightSpace10,

                // heightSpace5,
                // Expanded(child: Container()),
                mybuttons(
                    // style:
                    //     BaseStyles.grey2medium16,
                    name: 'Test & Save',
                    color: AppColors.orangecolor,
                    height: 45.0)
              ],
            ),
          ),
        ));
  }
}
