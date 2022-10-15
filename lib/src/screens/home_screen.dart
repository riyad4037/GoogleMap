import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:googlmap/src/blocks/application_block.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final applicationBloc = Provider.of<Applicationbloc>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: (applicationBloc.currentLocation == null)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: ListView(
                children: [
                  SizedBox(
                    height: size.height * 0.8,
                    child: GoogleMap(
                      mapType: MapType.normal,
                      myLocationEnabled: true,
                      initialCameraPosition: CameraPosition(
                        target: LatLng(
                          applicationBloc.currentLocation!.latitude,
                          applicationBloc.currentLocation!.longitude,
                        ),
                        zoom: 14,
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
