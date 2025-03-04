import 'package:flutter/material.dart';
import 'package:flutter_application/pages/home.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage>{

        Location _locationController = new Location();

        late GoogleMapController mapController;
      
        final LatLng _center = const LatLng(35.712479, 139.716924);
      
        void _onMapCreated(GoogleMapController controller) {
          mapController = controller;
        }

        LatLng? _currentP = null;

        @override
        void initState() {
          super.initState();
          getLocationUpdates();
        }

        @override
        Widget build(BuildContext context) {
          return Scaffold(
            body: Stack( 
              children: [
                GoogleMap(
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: _center,
                    zoom: 15,
                  ),
                  markers: {
                    Marker(
                      markerId: MarkerId("_currentLocation"),
                      icon: BitmapDescriptor.defaultMarker,
                      position: _center,
                    ),
                  },
                ),

                Positioned(
                  top: 40,
                  left: 20,
                  right: 20,
                  child: _searchBar(), 
                ),
              ],
            ),
            bottomNavigationBar: _bottomBar(context),
          );
        }

  Future<void> getLocationUpdates() async{
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    _serviceEnabled = await _locationController.serviceEnabled();
    
    if (_serviceEnabled){
      _serviceEnabled = await _locationController.requestService();
    }else{
      return;
    }

    _permissionGranted = await _locationController.hasPermission();
    if(_permissionGranted == PermissionStatus.denied){
      _permissionGranted = await _locationController.requestPermission();
      if(_permissionGranted == PermissionStatus.granted){
        return;
      }
    }
    _locationController.onLocationChanged.listen((LocationData currentLocation){
      if(currentLocation.latitude != null &&
         currentLocation.longitude != null){
           setState(() {
             _currentP = LatLng(currentLocation.latitude!, currentLocation.longitude!);
             print(_currentP);
           });
         }
    });
  }
}

  Container _searchBar() {
    return Container(
          margin: EdgeInsets.only(top: 20, left: 20, right: 20),
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color.fromARGB(255, 216, 216, 216),
              contentPadding: EdgeInsets.all(15),
              hintText: 'Search for location',
              prefixIcon: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(
                  Icons.search,
                  size: 30,
                )
              ),

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              )
            ),
          ),
        );
  }

  BottomAppBar _bottomBar(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: (){Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );},
            child: const Icon(Icons.home),
          ),
          FloatingActionButton(
            onPressed: (){print('map');},
            child: const Icon(Icons.map),
          ),
          FloatingActionButton(
            onPressed: (){print('profile');},
            child: const Icon(Icons.account_circle_outlined),
          ),
        ],
      ),
    );
  }