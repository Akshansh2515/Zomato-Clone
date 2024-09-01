import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'HomeScreen.dart';

class LocationSelect extends StatefulWidget {
  const LocationSelect({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => LocationSelectState();
}

class LocationSelectState extends State<LocationSelect> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 690));
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const Spacer(),
          SizedBox(
            height: 200.h,
            child: Image.asset("assets/images/ic_location.png"),
          ),
          Text(
            "We don't have your location, yet!",
            style: TextStyle(fontSize: 16.sp),
          ),
          SizedBox(height: 10.h),
          const Text(
            "Set your location to start exploring \nrestaurants near you",
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ButtonStyle(
                  elevation: WidgetStateProperty.all(0),
                  padding: WidgetStateProperty.all(
                    EdgeInsets.all(10.h),
                  ),
                ),
                onPressed: () {
                  _enableLocationAndNavigate();
                },
                label: const Text("Enable device location"),
                icon: const Icon(Icons.location_on),
              ),
            ),
          ),
          const Spacer(),
          const Padding(
            padding: EdgeInsets.all(18.0),
            child: Center(
              child: Text(
                "We only access your location while you are using the app to improve your experience.",
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _enableLocationAndNavigate() async {
    try {
      // Fetch device location
      Position position = await _getCurrentLocation();

      // Get city from coordinates
      String city = await _getCityFromCoordinates(position);

      // Navigate to HomeScreen and pass the city
      if (!mounted) return;
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (_) => HomeScreen(city: city),
        ),
        (route) => false,
      );
    } catch (e) {
      // Handle exceptions if needed
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Unable to fetch location')),
      );
    }
  }

  // Fetch the current location of the device
  Future<Position> _getCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    LocationSettings locationSettings = const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 10, // Update as needed
    );

    return await Geolocator.getCurrentPosition(
      locationSettings: locationSettings,
    );
  }

  // Get city from coordinates using reverse geocoding
  Future<String> _getCityFromCoordinates(Position position) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      Placemark place = placemarks[0];
      return place.locality ?? 'City'; // e.g., "City"
    } catch (e) {
      return 'City'; // Default city name if error occurs
    }
  }
}
