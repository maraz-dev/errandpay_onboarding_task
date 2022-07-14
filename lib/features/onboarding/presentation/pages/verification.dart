import 'dart:async';
import 'package:errandoay_onboarding/core/utils/utils.dart';
import 'package:errandoay_onboarding/features/onboarding/presentation/pages/account_created.dart';
import 'package:errandoay_onboarding/features/onboarding/presentation/widgets/general_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationPage extends StatefulWidget {
  static const id = '/verificationScreen';
  const VerificationPage({Key? key}) : super(key: key);

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  // For the Pin Fields
  TextEditingController _controller = TextEditingController();
  bool isCompleted = false;

  // For the Timer
  Timer? countDownTimer;
  Duration timerDuration = const Duration(seconds: 40);
  bool timeElapsed = false;

  void startTimer() {
    countDownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  void setCountDown() {
    const reduceTimer = 1;
    setState(() {
      final seconds = timerDuration.inSeconds - reduceTimer;
      if (seconds < 0) {
        countDownTimer!.cancel();
        timeElapsed = true;
      } else {
        timerDuration = Duration(seconds: seconds);
      }
    });
  }

  void resetTimer() {
    setState(() => timerDuration = const Duration(seconds: 40));
    startTimer();
    timeElapsed = false;
  }

  void stopTimer() {
    setState(() => countDownTimer!.cancel());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double? height = SizeConfig.screenHeight;
    double? width = SizeConfig.screenWidth;

    int seconds = timerDuration.inSeconds.remainder(60);

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
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Verification', style: kTextStyleFour),
              SizedBox(height: height * 0.012),
              const Text(kVerificationText, style: kTextStyleOne),
              SizedBox(height: height * 0.06),
              PinCodeTextField(
                controller: _controller,
                pinTheme: PinTheme(
                    selectedColor: kButtonColor,
                    inactiveColor: const Color(0xFF4B6962),
                    fieldWidth: width! * 0.12,
                    activeColor: kBlack),
                textStyle:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                appContext: context,
                onChanged: (_) {},
                onCompleted: (_) {
                  setState(() {
                    isCompleted = true;
                    if (countDownTimer == null || countDownTimer!.isActive) {
                      stopTimer();
                    }
                  });
                },
                length: 5,
                keyboardType: TextInputType.number,
              ),
              Row(
                children: [
                  timeElapsed == false
                      ? Container()
                      : TextButton(
                          onPressed: () => resetTimer(),
                          style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: const Size(20, 20),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                          child: const Text(
                            'Try Again? ',
                            style:
                                TextStyle(fontSize: 18, color: Color(0xFFFF2A52)),
                          ),
                        ),
                  Text(
                    '00:${seconds.toString().padLeft(2, '0')}',
                    style: kTextStyleOne,
                  )
                ],
              ),
              SizedBox(height: height * 0.06),
              isCompleted == true
                  ? GeneralButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, AccountCreated.id),
                      text: 'Continue',
                      height: height,
                      width: width,
                    )
                  : Container(),
              timeElapsed == false
                  ? Container()
                  : Column(
                      children: [
                        const Text('or', style: kTextStyleFive),
                        SizedBox(height: height * 0.03,),
                        GeneralButton(
                          height: height,
                          width: width,
                          text: 'Tap to verify using USSD',
                          onPressed: () {},
                        )
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }
}
