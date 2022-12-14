import 'package:flutter/material.dart';
import 'package:kss/core/utils/size_config.dart';
import 'package:kss/core/widgets/custom_text.dart';
import 'package:kss/view/auth/OTP/widgets/OTP_Form.dart';

import '../../../core/widgets/custom_buttom.dart';
import '../forgot_password_screen.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  TextEditingController password = new TextEditingController();
  TextEditingController confirmpassword = new TextEditingController();
  TextEditingController phone = new TextEditingController();

  GlobalKey<FormState> formStatelogin = new GlobalKey<FormState>();
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    SizeConfig();
    return WillPopScope(
        onWillPop: () async {
      final shouldPop = await showDialog<bool>(
        context: context,
        builder: (context) {
          return ForgotPasswordScreen();
        },
      );
      return shouldPop!;
    },
    child:
      Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: ListView(children: [
              Container(
                height: SizeConfig.screenheight! / 2.5,
                child: Image.asset("lib/assets/images/new_Password.jpg"),
              ),
              CustomText(
                text: "أدخل رمز التحقق الذي تم إرساله لك",
                fontSize: 20,
                fontWeight: FontWeight.bold,
                alignment: Alignment.center,
              ),
              SizedBox(height: SizeConfig.screenheight! * .05),
              Directionality(
                  textDirection: TextDirection.ltr,
                  child: OtpForm()),
              // OtpForm()
            ]),
          ),
        )));
  }
}
