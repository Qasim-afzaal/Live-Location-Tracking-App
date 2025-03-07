import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:geolocator/geolocator.dart' as geolocator_package;
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart' as location_package;
import 'package:permission_handler/permission_handler.dart' as permission_package;
import 'package:http/http.dart' as http;
import 'dart:convert';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final MapController _mapController = MapController();
  final location_package.Location _location = location_package.Location();
  LatLng? _currentPosition;
  LatLng? _destination;
  final List<LatLng> _routePoints = [];
  final List<Marker> _markers = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _initializeLocation();
  }

  Future<void> _initializeLocation() async {
    if (await _checkPermission()) {
      await _getCurrentLocation();
    }
  }

  Future<bool> _checkPermission() async {
    bool serviceEnabled = await _location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _location.requestService();
      if (!serviceEnabled) return false;
    }

    location_package.PermissionStatus permissionStatus = await _location.hasPermission();
    if (permissionStatus == location_package.PermissionStatus.denied) {
      permissionStatus = await _location.requestPermission();
      if (permissionStatus != location_package.PermissionStatus.granted) return false;
    }
    return true;
  }

  Future<void> _getCurrentLocation() async {
    geolocator_package.Position position = await geolocator_package.Geolocator.getCurrentPosition(
      desiredAccuracy: geolocator_package.LocationAccuracy.high,
    );

    setState(() {
      _currentPosition = LatLng(position.latitude, position.longitude);
    });

    geolocator_package.Geolocator.getPositionStream().listen((geolocator_package.Position position) {
      setState(() {
        _currentPosition = LatLng(position.latitude, position.longitude);
        _mapController.move(_currentPosition!, 15);
        if (_destination != null) {
          _fetchRoute(_currentPosition!, _destination!);
        }
      });
    });
  }

  Future<void> fetchCoordinatesPoint(String location) async {
    final url = Uri.parse(
        "https://nominatim.openstreetmap.org/search?q=$location&format=json&limit=1");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data.isNotEmpty) {
        setState(() {
          _destination = LatLng(
              double.parse(data[0]['lat']), double.parse(data[0]['lon']));
          _markers.add(
            Marker(
              point: _destination!,
              child: const Icon(Icons.location_on, color: Colors.red), // Fixed: Added child
            ),
          );
          if (_currentPosition != null) {
            _fetchRoute(_currentPosition!, _destination!);
          }
        });
      }
    }
  }

  Future<void> _fetchRoute(LatLng start, LatLng end) async {
    final url = Uri.parse(
        "https://router.project-osrm.org/route/v1/driving/${start.longitude},${start.latitude};${end.longitude},${end.latitude}?overview=full&geometries=geojson");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final geometry = data['routes'][0]['geometry']['coordinates'];
      setState(() {
        _routePoints.clear();
        for (var point in geometry) {
          _routePoints.add(LatLng(point[1], point[0]));
        }
      });
    }
  }

  Future<void> _centerOnCurrentLocation() async {
    if (_currentPosition != null) {
      _mapController.move(_currentPosition!, 15);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Current location not available")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _centerOnCurrentLocation,
        child: const Icon(Icons.my_location),
      ),
      appBar: AppBar(title: const Text('Live Location Tracker')),
      body: _currentPosition == null
          ? const Center(child: CircularProgressIndicator())
          : FlutterMap(
              mapController: _mapController,
              options: MapOptions(
                initialCenter: _currentPosition!,
                initialZoom: 15,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.app',
                ),
                CurrentLocationLayer(
                  style: LocationMarkerStyle(
                    marker: DefaultLocationMarker(
                      child: Icon(Icons.location_city),
                    ),
                    markerDirection: MarkerDirection.heading,
                  ),
                ),
                PolylineLayer(
                  polylines: [
                    Polyline(
                      points: _routePoints,
                      color: Colors.blue,
                      strokeWidth: 4,
                    ),
                  ],
                ),
                MarkerLayer(markers: _markers),
              ],
            ),
    );
  }
}