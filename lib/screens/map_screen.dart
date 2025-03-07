import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart'
    show
        FlutterMap,
        MapController,
        MapOptions,
        Marker,
        MarkerLayer,
        Polyline,
        PolylineLayer,
        TileLayer;
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final MapController _mapController = MapController();
  TextEditingController _textEditingController = TextEditingController();
  LatLng? _currentPosition;
  LatLng? _destination;
  final Location _location = Location();
  final List<LatLng> _polylinePoints = [];
  final List<Marker> _markers = [];
  List<LatLng> _route = [];
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    _initialzeLocation();
  }

  // Future<void> _requestLocationPermission() async {
  //   final status = await Permission.location.request();
  //   if (status.isGranted) {
  //     _getCurrentLocation();
  //   }
  // }


  Future<void> _initialzeLocation() async {
   if(!await _checkPermission());
   _location.onLocationChanged.listen(LocationData locationdata){
    if(_locationdate.latitude ! = null && )
   }
  }

  Future<void> fetchCoordinatesPoint(String location) async {
final url = Uri.parse ("https://nominatim.openstreetmap.org/search?g=$location&formatejson&limite1");
  
  
  Future<bool> _checkPermission() async {
    bool serviceEnabled= await _location.serviceEnabled();
    if(!serviceEnabled){
      serviceEnabled= await _location.requestService();
      if(!serviceEnabled){
        return true;
      }
    }

    PermissionStatus permissionStatus=await _location.hasPermission();
    if(permissionStatus== PermissionStatus.denied){
      permissionStatus = await _location.requestPermission();
      if(permissionStatus== PermissionStatus.granted) return false;
    }
    return true;
  }
  
  


  Future<void> _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    setState(() {
      _currentPosition = LatLng(position.latitude, position.longitude);
      _polylinePoints.add(_currentPosition!);
    });

    Geolocator.getPositionStream().listen((Position position) {
      setState(() {
        _currentPosition = LatLng(position.latitude, position.longitude);
        _polylinePoints.add(_currentPosition!);

        _mapController.move(_currentPosition!, 15);
      });
    });
  }

  Future<void> _userCurrentLocation() async {
    if (_currentPosition != null) {
      _mapController.move(_currentPosition!, 15);
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Current location not available")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await _userCurrentLocation();
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(title: const Text('OSM Location Tracker')),
      body:
          _currentPosition == null
              ? const Center(child: CircularProgressIndicator())
              : FlutterMap(
                mapController: _mapController,
                options: MapOptions(
                  initialCenter: _currentPosition ?? LatLng(0, 0),
                  initialZoom: 15,
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
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
                        points: _polylinePoints,
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
