import 'dart:async';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:inn_sight/Api_key.dart';
// import 'package:location/location.dart'; // Removed

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  // Location _locationController = new Location(); // Removed
  // LatLng? _currentPos = null; // Removed

  final Completer<GoogleMapController> _mcontroller =
      Completer<GoogleMapController>();

  static const _pGeoLocation = LatLng(30.7688, 76.5754);
  static const _markerGeoLocation = LatLng(30.7505, 76.6401);

  Map<PolylineId, Polyline> _polylines = {};

  @override
  void initState() {
    super.initState();
    // getLocation().then( // Modified
    //   (_) => {
    getPolyLinePoints().then(
      (coordinates) => {print(coordinates), generatePolylines(coordinates)},
    );
    //   },
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      // _currentPos == null // Removed
      //     ? Center(
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.center,
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           CircularProgressIndicator(),
      //           SizedBox(width: 10),
      //           Text("Getting Location..."),
      //         ],
      //       ),
      //     )
      //     : // Removed
      GoogleMap(
        onMapCreated: (GoogleMapController controller) {
          _mcontroller.complete(controller);
        },
        initialCameraPosition: CameraPosition(target: _pGeoLocation, zoom: 13),
        markers: {
          // Marker( // Removed
          //   markerId: MarkerId("_currentLocation"), // Removed
          //   icon: BitmapDescriptor.defaultMarker, // Removed
          //   position: _currentPos!, // Removed
          // ), // Removed
          Marker(
            markerId: MarkerId("_sourceLocation"),
            icon: BitmapDescriptor.defaultMarker,
            position: _pGeoLocation,
          ),
          Marker(
            markerId: MarkerId("_destinationLocation"),
            icon: BitmapDescriptor.defaultMarker,
            position: _markerGeoLocation,
          ),
        },
        polylines: Set<Polyline>.of(_polylines.values),
      ),
    );
  }

  Future<void> _cameraToPosition(LatLng pos) async {
    final GoogleMapController controller = await _mcontroller.future;
    CameraPosition _newCamaraPosition = CameraPosition(target: pos, zoom: 13);
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(_newCamaraPosition),
    );
  }

  // Future<void> getLocation() async { // Removed
  //   // Check if running on web platform // Removed
  //   if (kIsWeb) { // Removed
  //     // For web, skip the permission checks that are causing errors // Removed
  //     try { // Removed
  //       // Try to get location updates directly // Removed
  //       _locationController.onLocationChanged.listen(( // Removed
  //         LocationData currentLocation, // Removed
  //       ) { // Removed
  //         if (currentLocation.latitude != null && // Removed
  //             currentLocation.longitude != null) { // Removed
  //           setState(() { // Removed
  //             _currentPos = LatLng( // Removed
  //               currentLocation.latitude!, // Removed
  //               currentLocation.longitude!, // Removed
  //             ); // Removed
  //           }); // Removed
  //           // print(_currentPos); // Removed
  //           _cameraToPosition(_currentPos!); // Removed
  //         } // Removed
  //       }); // Removed
  //     } catch (e) { // Removed
  //       print("Error getting location on web: $e"); // Removed
  //       // Set a default position so the map still shows something // Removed
  //       setState(() { // Removed
  //         _currentPos = _pGeoLocation; // Use your predefined position // Removed
  //       }); // Removed
  //     } // Removed
  //     return; // Removed
  //   } // Removed

  //   // Original code for mobile platforms // Removed
  //   bool _isLocationEnabled; // Removed
  //   PermissionStatus _permissionGranted; // Removed

  //   _isLocationEnabled = await _locationController.serviceEnabled(); // Removed
  //   if (!_isLocationEnabled) { // Removed
  //     _isLocationEnabled = await _locationController.requestService(); // Removed
  //   } else { // Removed
  //     return; // Removed
  //   } // Removed

  //   _permissionGranted = await _locationController.hasPermission(); // Removed
  //   if (_permissionGranted == PermissionStatus.denied) { // Removed
  //     _permissionGranted = await _locationController.requestPermission(); // Removed
  //     if (_permissionGranted != PermissionStatus.granted) { // Removed
  //       return; // Removed
  //     } // Removed
  //   } // Removed

  //   _locationController.onLocationChanged.listen(( // Removed
  //     LocationData currentLocation, // Removed
  //   ) { // Removed
  //     if (currentLocation.latitude != null && // Removed
  //         currentLocation.longitude != null) { // Removed
  //       setState(() { // Removed
  //         _currentPos = LatLng( // Removed
  //           currentLocation.latitude!, // Removed
  //           currentLocation.longitude!, // Removed
  //         ); // Removed
  //       }); // Removed
  //       _cameraToPosition(_currentPos!); // Removed
  //     } // Removed
  //   }); // Removed
  // } // Removed

  Future<List<LatLng>> getPolyLinePoints() async {
    List<LatLng> polyLine = [];
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleApiKey: GOOGLE_MAP_API,
      request: PolylineRequest(
        origin: PointLatLng(_pGeoLocation.latitude, _pGeoLocation.longitude),
        destination: PointLatLng(
          _markerGeoLocation.latitude,
          _markerGeoLocation.longitude,
        ),
        mode: TravelMode.driving,
      ),
    );

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polyLine.add(LatLng(point.latitude, point.longitude));
      });
    } else {
      print(result.errorMessage);
    }

    return polyLine;
  }

  void generatePolylines(List<LatLng> polylineCoordinate) async {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.red,
      points: polylineCoordinate,
      width: 7,
    );
    setState(() {
      _polylines[id] = polyline;
    });
  }
}
