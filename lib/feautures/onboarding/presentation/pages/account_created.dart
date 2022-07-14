import 'package:errandoay_onboarding/core/utils/utils.dart';
import 'package:errandoay_onboarding/feautures/onboarding/presentation/widgets/general_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AccountCreated extends StatelessWidget {
  static const id = '/accountCreated';
  const AccountCreated({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double? height = SizeConfig.screenHeight;
    double? width = SizeConfig.screenWidth;

    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: height! * 0.1,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(FontAwesomeIcons.angleLeft, color: kBlack),
        ),
        actions: [Image.asset('images/countryCircle.png')],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('images/done.png'),
                SizedBox(height: height * 0.044),
                const Text('Account Created', style: kTextStyleFour),
                SizedBox(height: height * 0.018),
                const Text(
                  kAccountCreated,
                  style: kTextStyleOne,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: height * 0.04),
                GeneralButton(
                  onPressed: () {},
                  text: 'Continue',
                  height: height,
                  width: width,
                ),
                SizedBox(height: height * 0.04),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Complete KYC Now',
                    style: TextStyle(fontSize: 20, color: Color(0xFFFF2A52)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
