import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:zomatocloneflutter/MyBehavior.dart';
import 'package:zomatocloneflutter/Screen/LocationSelect.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<StatefulWidget> createState() => OtpScreenState();
}

class OtpScreenState extends State<OtpScreen> {
  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(
        fontSize: 20, color: Colors.black, fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
      borderRadius: BorderRadius.circular(20),
    ),
  );

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 690));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(
          color: Colors.black,
        ),
        title: const Text(
          "OTP Verification",
          style: TextStyle(color: Colors.black),
        ),
      ),
      backgroundColor: Colors.white,
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: ListView(
          children: [
            SizedBox(
              height: 40.h,
            ),
            const Center(child: Text("We have sent a verification code to")),
            SizedBox(
              height: 10.h,
            ),
            const Center(
                child: Text(
              "+91 1234567890",
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            SizedBox(
              height: 40.h,
            ),
            Pinput(
              length: 6,
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: defaultPinTheme.copyDecorationWith(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(8),
              ),
              submittedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  color: const Color.fromRGBO(234, 239, 243, 1),
                ),
              ),
              onCompleted: (pin) {
                // When OTP is fully entered, navigate to the LocationSelect screen
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const LocationSelect()),
                );
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                children: [
                  const Spacer(),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[300]!),
                        borderRadius: BorderRadius.circular(10.r)),
                    child: Padding(
                      padding: EdgeInsets.all(5.h),
                      child: ElevatedButton(
                          style: ButtonStyle(
                            elevation:
                                WidgetStateProperty.resolveWith((states) {
                              return 0.0; // No elevation
                            }),
                            backgroundColor:
                                WidgetStateProperty.resolveWith((states) {
                              return Colors.white;
                            }),
                            padding: WidgetStateProperty.resolveWith((states) {
                              return EdgeInsets.all(10.h);
                            }),
                          ),
                          onPressed: () {},
                          child: Text("Resend SMS in 16",
                              style: TextStyle(color: Colors.grey[300]!))),
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[300]!),
                        borderRadius: BorderRadius.circular(10.r)),
                    child: Padding(
                      padding: EdgeInsets.all(5.h),
                      child: ElevatedButton(
                          style: ButtonStyle(
                            elevation:
                                WidgetStateProperty.resolveWith((states) {
                              return 0.0; // No elevation
                            }),
                            backgroundColor:
                                WidgetStateProperty.resolveWith((states) {
                              return Colors.white;
                            }),
                            padding: WidgetStateProperty.resolveWith((states) {
                              return EdgeInsets.all(10.h);
                            }),
                          ),
                          onPressed: () {},
                          child: Text("Call me in 16",
                              style: TextStyle(color: Colors.grey[300]!))),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
