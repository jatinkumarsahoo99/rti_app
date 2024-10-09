import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rti_telangana/app/module/login_screen/login_provider/login_provider.dart';

import '../../app_theme/text_styles.dart';
import '../../common_widget/captch_container.dart';
import '../../common_widget/common_button.dart';
import '../../common_widget/footer_text_widget.dart';
import '../../common_widget/app_background_screen.dart';
import '../../common_widget/app_header_widget.dart';
import '../../common_widget/app_text_field.dart';
import '../../data/app_constant.dart';
import '../../utils/core_utility.dart';
import 'login_provider/login_captcha_provider.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  static Widget builder(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LogInCaptchaProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LogInProvider(),
        ),
      ],
      child: const LogInScreen(),
    );
  }

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackgroundScreen(
        child: [
          SingleChildScrollView(
            reverse: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const AppHeaderWidget(),
                Text(
                  "RTI Portal Authentication",
                  style: TextStyles(context)
                      .googlePoppinsFontsForText(fontSize: 18, fontWeight: FontWeight.w700, color: const Color(0xFF000000)),
                ),
                SizedBox(
                  height: AppConstant.heightBetweenWidget,
                ),
                Image.asset("assets/images/user_rti_image.png"),
                SizedBox(
                  height: AppConstant.heightBetweenWidget,
                ),
                AppTextField(
                  controller: context.read<LogInProvider>().emailTextEditingController,
                  // errorText: _errorFName,
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  titleText: "Enter your email",
                  hintText: "Enter your email",
                  keyboardType: TextInputType.name,
                  radius: 100,
                  onChanged: (String txt) {},
                ),
                SizedBox(
                  height: AppConstant.heightBetweenWidget,
                ),
                AppTextField(
                  controller: context.read<LogInProvider>().passwordTextEditingController,
                  // errorText: _errorFName,
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  titleText: "Enter your password",
                  hintText: "Enter your password",
                  keyboardType: TextInputType.name,
                  radius: 100,
                  onChanged: (String txt) {},
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 45.0, vertical: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Consumer<LogInCaptchaProvider>(
                        builder: (context, provider, child) {
                          return CustomTextWidget(
                            text: context.read<LogInCaptchaProvider>().captchaText,
                            height: 30,
                            width: 60,
                          );
                        },
                      ),
                      const SizedBox(
                        width: 13,
                      ),
                      GestureDetector(
                          onTap: () {
                            context.read<LogInCaptchaProvider>().resetCaptcha();
                          },
                          child: const Icon(
                            Icons.refresh,
                            size: 20,
                            color: Colors.black,
                          ))
                    ],
                  ),
                ),
                AppTextField(
                  controller: context.read<LogInProvider>().captchaTextEditingController,
                  // errorText: _errorFName,
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  titleText: "Enter Captcha Code",
                  hintText: "Enter Captcha Code",
                  keyboardType: TextInputType.name,
                  radius: 100,
                  onChanged: (String txt) {},
                ),
                SizedBox(
                  height: AppConstant.heightBetweenWidget,
                ),
                InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, "/forgotPassword");
                    },
                    child: Text(
                      "Forget password ?",
                      style: TextStyles(context)
                          .googlePoppinsFontsForText(fontSize: 13, fontWeight: FontWeight.w400, color: const Color(0xFF1B75BC)),
                    )),
                SizedBox(
                  height: AppConstant.heightBetweenWidget,
                ),
                CommonButton(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  buttonText: "Login",
                  onTap: () {
                   context.read<LogInProvider>().callLogFun(context);
                  },
                ),
                SizedBox(
                  height: AppConstant.heightBetweenWidget,
                ),
                FooterTextWidget(
                  onTap: () {},
                  highlightedText: "Sign Up",
                  text: "Don’t have an account ? ",
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
