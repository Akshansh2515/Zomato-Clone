import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../MyBehavior.dart';

class DiningScreen extends StatefulWidget {
  final String city; // Updated to only require city

  const DiningScreen({Key? key, required this.city}) : super(key: key);

  @override
  State<StatefulWidget> createState() => DiningScreenState();
}

class DiningScreenState extends State<DiningScreen> {
  final List<String> tabName = [
    "Filter",
    "Book Table",
    "Nearest",
    "Rating 4.0+",
    "Outdoor Seating",
    "Serves Alcohol",
    "Pure Veg",
    "Open Now",
    "Cafes",
    "Fine Dining",
    "Rating",
    "Cost",
  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 690));

    // Use the city parameter directly
    final city = widget.city;

    return Container(
      color: Colors.pink,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              SizedBox(height: 10.h),

              // AppBar dynamic creation
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 25.sp,
                      color: Colors.pink,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          city, // Display City
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
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
                      onTap: () {},
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(color: Colors.grey[300]!),
                  ),
                  child: IntrinsicHeight(
                    child: Row(
                      children: [
                        const Flexible(
                          child: TextField(
                            autofocus: false,
                            decoration: InputDecoration(
                              hintText: "Search",
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.pink,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        const VerticalDivider(),
                        const Icon(
                          Icons.keyboard_voice_outlined,
                          color: Colors.pink,
                        ),
                        SizedBox(width: 10.w),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40.h,
                child: ListView.builder(
                  itemCount: tabName.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.all(5.h),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(color: Colors.grey[300]!),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.w, vertical: 5.h),
                          child: index == 0 ||
                                  index == tabName.length - 1 ||
                                  index == tabName.length - 2
                              ? Row(
                                  children: [
                                    if (index == 0)
                                      Icon(
                                        Icons.tune,
                                        size: 10.sp,
                                      ),
                                    Text(
                                      tabName[index],
                                      style: TextStyle(fontSize: 10.sp),
                                    ),
                                    if (index == 0 ||
                                        index == tabName.length - 1 ||
                                        index == tabName.length - 2)
                                      FaIcon(
                                        FontAwesomeIcons.angleDown,
                                        size: 10.sp,
                                      ),
                                  ],
                                )
                              : Center(child: Text(tabName[index])),
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
                              child: Text(
                                "CURATED COLLECTIONS",
                                style: TextStyle(color: Colors.grey[500]!),
                              ),
                            ),
                            SizedBox(width: 10.w),
                            const Expanded(child: Divider()),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 120.h,
                        child: ListView.builder(
                          itemCount: 2,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.r),
                                child: Stack(
                                  children: [
                                    SizedBox(
                                      height: 120.h,
                                      width: 100.w,
                                      child: Image.asset(
                                        "assets/images/img_dining${index + 1}.jpeg",
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Positioned(
                                      left: 5.w,
                                      bottom: 20.h,
                                      child: Text(
                                        "Collection ${index + 1}",
                                        style: const TextStyle(
                                            fontSize: 18, color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        children: [
                          const Spacer(),
                          DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              border: Border.all(color: Colors.grey[300]!),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(5.h),
                              child: const Row(
                                children: [
                                  Text(
                                    "Explore More",
                                    style: TextStyle(color: Colors.pink),
                                  ),
                                  Icon(
                                    Icons.arrow_forward,
                                    color: Colors.pink,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Expanded(child: Divider()),
                            SizedBox(width: 10.w),
                            Center(
                              child: Text(
                                "POPULAR RESTAURANTS AROUND YOU",
                                style: TextStyle(color: Colors.grey[500]!),
                              ),
                            ),
                            SizedBox(width: 10.w),
                            const Expanded(child: Divider()),
                          ],
                        ),
                      ),
                      ListView.builder(
                        itemCount: 12,
                        physics: const ClampingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 10.h),
                            child: Card(
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: Stack(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 150.h,
                                          width: double.infinity,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(10.r),
                                              topLeft: Radius.circular(10.r),
                                            ),
                                            child: Image.asset(
                                              "assets/images/1image.jpeg",
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10.h, horizontal: 10.w),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(height: 10.h),
                                              Row(
                                                children: [
                                                  Text(
                                                    "TGT-The Grand Thakar",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 15.sp),
                                                  ),
                                                  const Spacer(),
                                                  DecoratedBox(
                                                    decoration: BoxDecoration(
                                                      color: Colors.green,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.r),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(5.h),
                                                      child: const Row(
                                                        children: [
                                                          Text(
                                                            "4.2",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                          Icon(
                                                            Icons.star,
                                                            color: Colors.white,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 10.h),
                                              Text("₹ 1,000 for 2"),
                                              SizedBox(height: 10.h),
                                              const Text(
                                                "Gujarati, South Indian, Punjabi",
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(height: 10.h),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Positioned(
                                      left: 10.w,
                                      top: 10.h,
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                          color: Colors.pink,
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.w, vertical: 5.h),
                                          child: const Text(
                                            "Promoted",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
