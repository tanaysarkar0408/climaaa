import 'package:climaaa/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:climaaa/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }


  void getLocationData() async {
    var weatherData = await WeatherModel().getLocationWeather();
    // ignore: use_build_context_synchronously
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitFadingCircle(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}

//
//
// LocationPermission permission = await Geolocator.requestPermission();
//
// if (permission == LocationPermission.denied) {
// // The user denied location permissions. You can handle this case here.
// print("Location permissions denied.");
// } else if (permission == LocationPermission.deniedForever) {
// // The user denied location permissions permanently. You can handle this case here.
// print("Location permissions denied forever.");
// } else {
// // Location permissions granted. You can now proceed to get the location.
// Position position = await Geolocator.getCurrentPosition(
// desiredAccuracy: LocationAccuracy.high,
// );
// print(position);
// }