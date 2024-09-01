import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../MyBehavior.dart';

class DashBoardScreen extends StatefulWidget {
  final String city; // Accept city as a parameter

  const DashBoardScreen({super.key, required this.city});

  @override
  State<StatefulWidget> createState() => DashBoardScreenState();
}

class DashBoardScreenState extends State<DashBoardScreen> {
  final List<String> tabName = [
    "sort",
    "Fast Delivery",
    "Rating 4.0+",
    "New Arrivals",
    "Pure Veg",
    "Cuisines",
    "More",
  ];

  final List<String> category = [
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

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 690));
    return Container(
      color: Colors.pink,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              SizedBox(height: 10.h),

              // Display the city name
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
                            Text(
                              widget.city, // Display the city name here
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.w),
                              child: FaIcon(
                                FontAwesomeIcons.angleDown,
                                size: 15.sp,
                              ),
                            ),
                          ],
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

              // Search box
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
                              hintText: "Restaurant name or dish name",
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

              // Tabs for sorting and filtering
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
                          child: index == 0
                              ? Row(
                                  children: [
                                    SizedBox(width: 5.w),
                                    Icon(
                                      Icons.tune,
                                      size: 10.sp,
                                    ),
                                    Text(
                                      "sort",
                                      style: TextStyle(fontSize: 10.sp),
                                    ),
                                    SizedBox(width: 5.w),
                                    FaIcon(
                                      FontAwesomeIcons.angleDown,
                                      size: 10.sp,
                                    ),
                                    SizedBox(width: 5.w),
                                  ],
                                )
                              : (index == 5 || index == 6)
                                  ? Row(
                                      children: [
                                        SizedBox(width: 5.w),
                                        Text(
                                          tabName[index],
                                          style: TextStyle(fontSize: 10.sp),
                                        ),
                                        SizedBox(width: 5.w),
                                        FaIcon(
                                          FontAwesomeIcons.angleDown,
                                          size: 10.sp,
                                        ),
                                        SizedBox(width: 5.w),
                                      ],
                                    )
                                  : Center(child: Text(tabName[index])),
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Main content: offers and categories
              Expanded(
                child: ScrollConfiguration(
                  behavior: MyBehavior(),
                  child: ListView(
                    children: [
                      SizedBox(height: 10.h),
                      _buildSectionHeader("OFFERS FOR YOU"),
                      _buildHorizontalImageList(),
                      SizedBox(height: 10.h),
                      _buildSectionHeader("WHAT'S ON YOUR MIND?"),
                      _buildCategoryGrid(),
                      SizedBox(height: 10.h),
                      _buildSectionHeader("392 RESTAURANT"),
                      _buildRestaurantGrid(),
                      SizedBox(height: 10.h),
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

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(child: Divider()),
          SizedBox(width: 10.w),
          Center(
            child: Text(
              title,
              style: TextStyle(color: Colors.grey[500]!),
            ),
          ),
          SizedBox(width: 10.w),
          const Expanded(child: Divider()),
        ],
      ),
    );
  }

  Widget _buildHorizontalImageList() {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        itemCount: 3,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: GestureDetector(
              onTap: () {
                if (index != 1) {
                  // Handle tap
                }
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
    );
  }

  Widget _buildCategoryGrid() {
    return SizedBox(
      height: 180.h,
      child: GridView.count(
        scrollDirection: Axis.horizontal,
        crossAxisCount: 2,
        children: List.generate(
          16,
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
              Text(category[index]),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRestaurantGrid() {
    return GridView.count(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      children: List.generate(
        6,
        (index) => Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(
                height: 100.h,
                child: Image.asset(
                  "assets/images/popular/ic_frame${index + 1}.jpg",
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: 10.h),
              Text("The Chocolate Room"),
              Text("Desserts, Beverages"),
            ],
          ),
        ),
      ),
    );
  }
}
