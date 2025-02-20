import 'package:flutter/material.dart';
import 'package:flutter_application/pages/home.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage>{

  static const LatLng _pGooglePlex = LatLng(35.712479, 139.716924);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: //Column(
        //crossAxisAlignment: CrossAxisAlignment.center,
        //children: [
          GoogleMap(initialCameraPosition: CameraPosition(
        target: _pGooglePlex, 
        zoom:15)),
         // _bottomButton()
        //]
      );
      //  bottomNavigationBar: _bottomBar(context),
          
        
    //);
  }

/*  FloatingActionButton _bottomButton() {
    return FloatingActionButton(
          onPressed: (){print('menu');},
          child: const  Icon(Icons.add),
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
  }*/


}
