import 'package:errandoay_onboarding/features/onboarding/presentation/pages/verification.dart';
import 'package:errandoay_onboarding/features/onboarding/presentation/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/utils/utils.dart';

class CreateAccount extends StatefulWidget {
  static const id = '/createAccount';
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double? height = SizeConfig.screenHeight;
    double? width = SizeConfig.screenWidth;

    TextEditingController _firstNameController = TextEditingController();
    TextEditingController _lastNameController = TextEditingController();
    TextEditingController _phoneNumberController = TextEditingController();
    TextEditingController _emailAddressController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    TextEditingController _referralCodeController = TextEditingController();

    return Scaffold(
      extendBodyBehindAppBar: true,
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
      body: Padding(
        padding: EdgeInsets.only(
          top: height * 0.14,
          left: width! * 0.046,
          right: width * 0.046,
          bottom: height * 0.02,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Sign Up',
                style: kTextStyleFour,
              ),
              SizedBox(height: height * 0.012),
              const Text('Let\'s help you create your Free Account.',
                  style: kTextStyleThree),
              SizedBox(height: height * 0.06),
              NormalTextField(
                controller: _firstNameController,
                height: height,
                text: 'First Name',
                prefixIcon: FontAwesomeIcons.user,
                suffixIcon: null,
                inputType: TextInputType.text,
              ),
              NormalTextField(
                controller: _lastNameController,
                height: height,
                text: 'Last Name',
                prefixIcon: FontAwesomeIcons.user,
                suffixIcon: null,
                inputType: TextInputType.text,
              ),
              NormalTextField(
                controller: _phoneNumberController,
                height: height,
                text: 'Phone Number',
                prefixIcon: FontAwesomeIcons.mobileScreenButton,
                suffixIcon: Image.asset('images/countryNormal.png'),
                inputType: TextInputType.phone,
              ),
              NormalTextField(
                controller: _emailAddressController,
                height: height,
                text: 'Email Address',
                prefixIcon: FontAwesomeIcons.at,
                suffixIcon: null,
                inputType: TextInputType.emailAddress,
              ),
              PasswordTextField(
                controller: _passwordController,
                height: height,
                text: 'Password',
                prefixIcon: FontAwesomeIcons.lock,
                suffixIcon: null,
                inputType: TextInputType.text,
              ),
              NormalTextField(
                controller: _referralCodeController,
                height: height,
                text: 'Referral Code',
                prefixIcon: FontAwesomeIcons.shareNodes,
                inputType: TextInputType.text,
                suffixIcon: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Optional',
                    style: kTextStyleThree,
                  ),
                ),
              ),
              SizedBox(height: height * 0.001),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'You hereby agree to the ',
                            style: kTextStyleThree,
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: const Size(20, 20),
                                tapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap),
                            onPressed: () {},
                            child: const Text(
                              'Terms & Conditions',
                              style: TextStyle(
                                  fontSize: 14,
                                  decoration: TextDecoration.underline,
                                  color: Color(0x66000428),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        'guiding this service.',
                        style: kTextStyleThree,
                      )
                    ],
                  ),
                  SizedBox(width: width * 0.08),
                  CupertinoSwitch(
                    value: false,
                    onChanged: (answer) {},
                  )
                ],
              ),
              SizedBox(height: height * 0.03),
              GeneralButton(
                height: height,
                width: width,
                text: 'Create my Account',
                onPressed: () => Navigator.pushNamed(context, VerificationPage.id),
              ),
              SizedBox(height: height * 0.05)
            ],
          ),
        ),
      ),
    );
  }
}
