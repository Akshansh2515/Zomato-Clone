import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zomatocloneflutter/MyBehavior.dart';
import 'package:zomatocloneflutter/Screen/OtpScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  var coutry = {"name": "India", "countryCode": "IN", "phoneCode": "+91"};

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 690));
    return Scaffold(
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: ListView(
          children: [
            SizedBox(
              height: 270.h,
              width: double.infinity,
              child: Image.asset(
                "assets/images/login_illustration_2.webp",
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                "India's #1 Food Delivery \n      and Dining App",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Expanded(child: Divider()),
                      SizedBox(
                        width: 10.w,
                      ),
                      const Center(child: Text("Log in or sign up")),
                      SizedBox(
                        width: 10.w,
                      ),
                      const Expanded(child: Divider()),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    height: 40.h,
                    width: double.infinity,
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            border: Border.all(color: Colors.grey[300]!),
                          ),
                          child: CountryListPick(
                            appBar: AppBar(
                              backgroundColor: Colors.pink,
                              title: const Text('Select Country'),
                            ),
                            pickerBuilder: (context, CountryCode? countryCode) {
                              return Row(
                                children: [
                                  Image.asset(
                                    countryCode!.flagUri!,
                                    package: 'country_list_pick',
                                  ),
                                  const Icon(
                                    Icons.expand_more,
                                    color: Colors.grey,
                                  ),
                                ],
                              );
                            },
                            theme: CountryTheme(
                              isShowFlag: true,
                              isShowTitle: false,
                              isShowCode: false,
                              isDownIcon: true,
                              showEnglishName: true,
                            ),
                            initialSelection: '+91',
                            onChanged: (CountryCode? code) {
                              setState(() {
                                coutry = {
                                  "name": "${code!.name}",
                                  "countryCode": "${code.code}",
                                  "phoneCode": "${code.dialCode}"
                                };
                              });
                            },
                            useUiOverlay: true,
                            useSafeArea: false,
                          ),
                        ),
                        SizedBox(
                          width: 19.w,
                        ),
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.number,
                            textAlignVertical: TextAlignVertical.center,
                            autofocus: true,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 10.w, vertical: 10.h),
                              prefixText: "${coutry['phoneCode']} ",
                              prefixStyle: const TextStyle(color: Colors.black),
                              hintText: "Enter Phone Number",
                              hintStyle: TextStyle(color: Colors.grey[300]!),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1, color: Colors.grey[300]!),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1, color: Colors.grey[300]!),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1, color: Colors.grey[300]!),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        padding: WidgetStateProperty.resolveWith(
                            (states) => EdgeInsets.all(15.h)),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const OtpScreen()),
                        );
                      },
                      child: const Text("Continue"),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Expanded(child: Divider()),
                      SizedBox(
                        width: 10.w,
                      ),
                      const Center(child: Text("or")),
                      SizedBox(
                        width: 10.w,
                      ),
                      const Expanded(child: Divider()),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.grey[300]!),
                          color: Colors.white,
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            "assets/images/ic_google.png",
                            width: 24.0, // Adjust width as needed
                            height: 24.0, // Adjust height as needed
                          ),
                          padding: const EdgeInsets.all(
                              8.0), // Optional: adjust padding around the icon
                        ),
                      ),
                      const Spacer(),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.grey[300]!),
                        ),
                        child: IconButton(
                          onPressed: () {
                            showModalBottomSheet(
                              isDismissible: false,
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (BuildContext context) {
                                return SizedBox(
                                  height: 300.h,
                                  child: Stack(
                                    children: [
                                      Column(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              color: Colors.transparent,
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                              color: Colors.white,
                                            ),
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: 20.h,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10.0.w),
                                                  child: SizedBox(
                                                    width: double.infinity,
                                                    child: ElevatedButton.icon(
                                                      style: ButtonStyle(
                                                        padding:
                                                            WidgetStateProperty
                                                                .resolveWith(
                                                          (states) => EdgeInsets
                                                              .symmetric(
                                                                  vertical:
                                                                      20.h),
                                                        ),
                                                        elevation:
                                                            WidgetStateProperty
                                                                .resolveWith(
                                                                    (states) =>
                                                                        0.0),
                                                        backgroundColor:
                                                            WidgetStateProperty
                                                                .resolveWith(
                                                                    (states) =>
                                                                        Colors
                                                                            .white),
                                                        shape:
                                                            WidgetStateProperty
                                                                .resolveWith(
                                                          (states) =>
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        18.0),
                                                            side: BorderSide(
                                                                color:
                                                                    Colors.grey[
                                                                        300]!),
                                                          ),
                                                        ),
                                                      ),
                                                      onPressed: () {},
                                                      icon: const Icon(
                                                        Icons.facebook,
                                                        color: Colors.blue,
                                                      ),
                                                      label: const Text(
                                                        "Continue with Facebook",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 20.h,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10.0.w),
                                                  child: SizedBox(
                                                    width: double.infinity,
                                                    child: ElevatedButton.icon(
                                                      style: ButtonStyle(
                                                        padding:
                                                            WidgetStateProperty
                                                                .resolveWith(
                                                          (states) => EdgeInsets
                                                              .symmetric(
                                                                  vertical:
                                                                      20.h),
                                                        ),
                                                        elevation:
                                                            WidgetStateProperty
                                                                .resolveWith(
                                                                    (states) =>
                                                                        0.0),
                                                        backgroundColor:
                                                            WidgetStateProperty
                                                                .resolveWith(
                                                                    (states) =>
                                                                        Colors
                                                                            .white),
                                                        shape:
                                                            WidgetStateProperty
                                                                .resolveWith(
                                                          (states) =>
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        18.0),
                                                            side: BorderSide(
                                                                color:
                                                                    Colors.grey[
                                                                        300]!),
                                                          ),
                                                        ),
                                                      ),
                                                      onPressed: () {},
                                                      icon: const Icon(
                                                        Icons.email,
                                                        color: Colors.black,
                                                      ),
                                                      label: const Text(
                                                        "Continue with Email",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 20.h,
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      Positioned(
                                        top: 20.h,
                                        left: 170.w,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                          child: Center(
                                            child: IconButton(
                                              color: Colors.black,
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              icon: const Icon(
                                                Icons.cancel_outlined,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          icon: const Icon(Icons.more_horiz),
                        ),
                      ),
                      const Spacer(),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
    );
  }
}
