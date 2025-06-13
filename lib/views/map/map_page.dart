import 'dart:async';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:inn_sight/Api_key.dart';
import 'package:location/location.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Location _locationController = new Location();
  LatLng? _currentPos = null;

  final Completer<GoogleMapController> _mcontroller =
      Completer<GoogleMapController>();

  static const _pGeoLocation = LatLng(30.7688, 76.5754);
  static const _markerGeoLocation = LatLng(30.7505, 76.6401);

  Map<PolylineId, Polyline> _polylines = {};

  @override
  void initState() {
    super.initState();
    getLocation().then(
      (_) => {
        getPolyLinePoints().then((coordinates) => {print(coordinates)}),
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          _currentPos == null
              ? Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(width: 10),
                    Text("Getting Location..."),
                  ],
                ),
              )
              : GoogleMap(
                onMapCreated: (GoogleMapController controller) {
                  _mcontroller.complete(controller);
                },
                initialCameraPosition: CameraPosition(
                  target: _pGeoLocation,
                  zoom: 13,
                ),
                markers: {
                  Marker(
                    markerId: MarkerId("_currentLocation"),
                    icon: BitmapDescriptor.defaultMarker,
                    position: _currentPos!,
                  ),
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

  Future<void> getLocation() async {
    // Check if running on web platform
    if (kIsWeb) {
      // For web, skip the permission checks that are causing errors
      try {
        // Try to get location updates directly
        _locationController.onLocationChanged.listen((
          LocationData currentLocation,
        ) {
          if (currentLocation.latitude != null &&
              currentLocation.longitude != null) {
            setState(() {
              _currentPos = LatLng(
                currentLocation.latitude!,
                currentLocation.longitude!,
              );
            });
            // print(_currentPos);
            _cameraToPosition(_currentPos!);
          }
        });
      } catch (e) {
        print("Error getting location on web: $e");
        // Set a default position so the map still shows something
        setState(() {
          _currentPos = _pGeoLocation; // Use your predefined position
        });
      }
      return;
    }

    // Original code for mobile platforms
    bool _isLocationEnabled;
    PermissionStatus _permissionGranted;

    _isLocationEnabled = await _locationController.serviceEnabled();
    if (!_isLocationEnabled) {
      _isLocationEnabled = await _locationController.requestService();
    } else {
      return;
    }

    _permissionGranted = await _locationController.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _locationController.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationController.onLocationChanged.listen((
      LocationData currentLocation,
    ) {
      if (currentLocation.latitude != null &&
          currentLocation.longitude != null) {
        setState(() {
          _currentPos = LatLng(
            currentLocation.latitude!,
            currentLocation.longitude!,
          );
        });
        _cameraToPosition(_currentPos!);
      }
    });
  }

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
