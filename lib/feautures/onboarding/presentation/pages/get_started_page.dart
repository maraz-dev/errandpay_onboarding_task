import 'package:errandoay_onboarding/core/utils/colors.dart';
import 'package:errandoay_onboarding/feautures/onboarding/presentation/pages/create_account.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/utils/size_config.dart';
import '../widgets/widgets.dart';

class GetStartedPage extends StatelessWidget {
  static const id = '/getStarted';
  const GetStartedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double? height = SizeConfig.screenHeight;
    double? width = SizeConfig.screenWidth;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: kWhite,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(FontAwesomeIcons.angleLeft, color: kBlack),
        ),
      ),
      body: Stack(
        children: [
          Image.asset(
            'images/getStartedBackground.png',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                top: height! * 0.18,
                left: width! * 0.07,
                right: width * 0.07,
              ),
              child: Center(
                child: Column(
                  children: [
                    Image.asset('images/logo_with_text.png', width: width * 0.55),
                    SizedBox(height: height * 0.09),
                    const Text(
                      kGetStartedSpecialBody,
                      textAlign: TextAlign.center,
                      style: kTextStyleOne,
                    ),
                    SizedBox(height: height * 0.055),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.023),
                        color: kSAF,
                        child: Row(mainAxisSize: MainAxisSize.min, children: [
                          const Text(
                            'see all features',
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(width: width * 0.04),
                          const Icon(Icons.arrow_right_alt),
                        ]),
                      ),
                    ),
                    SizedBox(height: height * 0.092),
                    GeneralButton(
                      height: height,
                      width: width,
                      text: 'Open an account for Free',
                      onPressed: () => Navigator.pushNamed(context, CreateAccount.id),
                    ),
                    SizedBox(height: height * 0.043),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text('Already have an account?', style: kTextStyleOne,),
                        TextButton(
                          onPressed: () {},
                          child: const Text('Sign in', style: kTextStyleTwo,),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
