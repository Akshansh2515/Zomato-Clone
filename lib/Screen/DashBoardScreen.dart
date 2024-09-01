import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../MyBehavior.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key, required String city});

  @override
  State<StatefulWidget> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  List<String> tabs = [
    "Sort",
    "Fast Delivery",
    "Rating 4.0+",
    "New Arrivals",
    "Pure Veg",
    "Cuisines",
    "More",
  ];

  List<String> categories = [
    "Pizza",
    "Biryani",
    "Shake",
    "Burger",
    "Chicken",
    "Sandwich",
    "Noodles",
    "Fried Rice",
    "Thali",
    "Cake",
    "Paneer",
    "Dosa",
    "Ice Cream",
    "Rolls",
    "Paratha",
    "Chaat",
  ];

  String city =
      "Ghaziabad"; // Replace this with the actual city fetched from the device location

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 690));
    return SizedBox.expand(
      child: Container(
        color: Colors.pink,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              children: [
                SizedBox(height: 10.h),
                // AppBar with location
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(Icons.location_on, size: 25.sp, color: Colors.pink),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text("Rajnagar Extension",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5.w),
                                child: FaIcon(FontAwesomeIcons.angleDown,
                                    size: 15.sp),
                              ),
                            ],
                          ),
                          Text(city),
                        ],
                      ),
                      const Spacer(),
                      SizedBox(
                        height: 30.h,
                        width: 30.w,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(color: Colors.grey[300]!),
                          ),
                          child: const Center(child: Icon(Icons.g_translate)),
                        ),
                      ),
                      SizedBox(width: 5.w),
                      GestureDetector(
                        onTap: () {
                          // Handle onTap
                        },
                        child: SizedBox(
                          height: 30.h,
                          width: 30.w,
                          child: const CircleAvatar(
                            backgroundImage: NetworkImage(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQiaLO5Z4Ga_OJMvDSNnn2b_UT6iMUvWU2Btg&usqp=CAU",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Search box
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(color: Colors.grey[300]!),
                      ),
                      child: IntrinsicHeight(
                        child: Row(
                          children: [
                            const Expanded(
                              child: TextField(
                                autofocus: false,
                                decoration: InputDecoration(
                                  hintText: "Restaurant name or dish name",
                                  prefixIcon:
                                      Icon(Icons.search, color: Colors.pink),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            const VerticalDivider(),
                            const Icon(Icons.keyboard_voice_outlined,
                                color: Colors.pink),
                            SizedBox(width: 10.w),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.h,
                  child: ListView.builder(
                    itemCount: tabs.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.all(5.h),
                        child: SizedBox(
                          child: index == 0
                              ? DecoratedBox(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    border:
                                        Border.all(color: Colors.grey[300]!),
                                  ),
                                  child: Row(
                                    children: [
                                      SizedBox(width: 5.w),
                                      Icon(Icons.tune, size: 10.sp),
                                      Text("Sort",
                                          style: TextStyle(fontSize: 10.sp)),
                                      SizedBox(width: 5.w),
                                      FaIcon(FontAwesomeIcons.angleDown,
                                          size: 10.sp),
                                      SizedBox(width: 5.w),
                                    ],
                                  ),
                                )
                              : index == 5 || index == 6
                                  ? DecoratedBox(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                        border: Border.all(
                                            color: Colors.grey[300]!),
                                      ),
                                      child: Row(
                                        children: [
                                          SizedBox(width: 5.w),
                                          Text(tabs[index],
                                              style:
                                                  TextStyle(fontSize: 10.sp)),
                                          SizedBox(width: 5.w),
                                          FaIcon(FontAwesomeIcons.angleDown,
                                              size: 10.sp),
                                          SizedBox(width: 5.w),
                                        ],
                                      ),
                                    )
                                  : DecoratedBox(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                        border: Border.all(
                                            color: Colors.grey[300]!),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 5.w, vertical: 5.h),
                                        child: Center(child: Text(tabs[index])),
                                      ),
                                    ),
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: ScrollConfiguration(
                    behavior: MyBehavior(),
                    child: ListView(
                      children: [
                        SizedBox(height: 10.h),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Expanded(child: Divider()),
                              SizedBox(width: 10.w),
                              Center(
                                  child: Text("OFFERS FOR YOU",
                                      style:
                                          TextStyle(color: Colors.grey[500]))),
                              SizedBox(width: 10.w),
                              const Expanded(child: Divider()),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 100.h,
                          child: ListView.builder(
                            itemCount: 3,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: GestureDetector(
                                  onTap: () {
                                    // Handle onTap
                                  },
                                  child: SizedBox(
                                    height: 100.h,
                                    width: 100.w,
                                    child: Image.asset(
                                      "assets/images/frame${index + 1}.png",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Expanded(child: Divider()),
                              SizedBox(width: 10.w),
                              Center(
                                  child: Text("WHAT'S ON YOUR MIND?",
                                      style:
                                          TextStyle(color: Colors.grey[500]))),
                              SizedBox(width: 10.w),
                              const Expanded(child: Divider()),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 180.h,
                          child: GridView.count(
                            scrollDirection: Axis.horizontal,
                            crossAxisCount: 2,
                            children: List.generate(
                                categories.length,
                                (index) => Column(
                                      children: [
                                        SizedBox(height: 5.h),
                                        SizedBox(
                                          height: 50.h,
                                          child: Image.asset(
                                            "assets/images/category/ic_frame${index + 1}.jpg",
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        Text(categories[index]),
                                      ],
                                    )),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Expanded(child: Divider()),
                              SizedBox(width: 10.w),
                              Center(
                                  child: Text("392 RESTAURANTS",
                                      style:
                                          TextStyle(color: Colors.grey[500]))),
                              SizedBox(width: 10.w),
                              const Expanded(child: Divider()),
                            ],
                          ),
                        ),
                        ListView.builder(
                            itemCount: 2,
                            physics: const ClampingScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.w, vertical: 10.h),
                                child: Card(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.r)),
                                    child: Stack(
                                      children: [
                                        Column(
                                          children: [
                                            SizedBox(
                                                height: 150.h,
                                                width: double.infinity,
                                                child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topRight:
                                                          Radius.circular(10.r),
                                                      topLeft:
                                                          Radius.circular(10.r),
                                                    ),
                                                    child: Image.asset(
                                                      "assets/images/img${index + 1}.jpeg",
                                                      fit: BoxFit.fill,
                                                    ))),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 10.h),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "MJ Pizza and Burger Corner",
                                                    style: TextStyle(
                                                        fontSize: 12.sp,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  const Text(
                                                      "Pizza, Fast food"),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 10.h),
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.green,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.r),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(2.0),
                                                            child: Row(
                                                              children: [
                                                                const Text(
                                                                    "4.0"),
                                                                FaIcon(
                                                                  FontAwesomeIcons
                                                                      .solidStar,
                                                                  size: 8.sp,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Text(
                                                          " 34mins",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .grey[500]!),
                                                        ),
                                                        Text(
                                                          " ₹150 for one",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .grey[500]!),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        Positioned(
                                          top: 120.h,
                                          right: 0,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.pink,
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10.r),
                                                bottomLeft:
                                                    Radius.circular(10.r),
                                              ),
                                            ),
                                            child: const Padding(
                                              padding: EdgeInsets.all(5.0),
                                              child: Text(
                                                "60% OFF",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            })
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
