import 'package:flutter/material.dart';
import 'package:google_maps/widgets/custome_google.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const TestGoogleMaps());
}

class TestGoogleMaps extends StatelessWidget {
  const TestGoogleMaps({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CustomeGoogle(),
    );
  }
}
