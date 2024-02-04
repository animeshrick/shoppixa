import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shoppixa/screens/choose_location/vm/location_vm.dart';
import 'package:shoppixa/utils/constants/app_color.dart';
import 'package:shoppixa/utils/custom_buttons/custom_out_line_btn.dart';
import 'package:shoppixa/utils/custom_text.dart';
import 'package:shoppixa/utils/custom_text_field.dart';
import 'package:shoppixa/utils/launch_url/custom_url_launch.dart';

import 'complete_location_form.dart';

class ChooseLocation extends StatelessWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late GoogleMapController mapController;

    final LatLng _center = const LatLng(45.521563, -122.677433);

    void _onMapCreated(GoogleMapController controller) {
      mapController = controller;
    }

    return ChangeNotifierProvider(
      create: (_) => LocationVm(context),
      child: Consumer<LocationVm>(builder: (context, locationVm, _) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 35,
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.maybeOf(context)?.pop();
                        },
                        icon: const Icon(Icons.arrow_back_ios)),
                    Expanded(
                      child: customTextField(
                          // isAutoFocus: true,
                          controller: null,
                          isNeedDesign: true,
                          suffixIcon: const Icon(Icons.abc),
                          hintText: "Search Anything",
                          inputbroder: const OutlineInputBorder()),
                    ),
                  ],
                ),
                /*Text('LAT: ${_currentPosition?.latitude ?? ""}'),
                  Text('LNG: ${_currentPosition?.longitude ?? ""}'),
                  Text('ADDRESS: ${_currentAddress ?? ""}'),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: _getCurrentPosition,
                    child: const Text("Get Current Location"),
                  )*/
                const SizedBox(
                  height: 20,
                ),
                Container(
                    height: MediaQuery.sizeOf(context).height * 0.75,
                    color: Colors.black12,
                    child: Stack(
                      children: [
                        GoogleMap(
                            mapType: MapType.normal,
                            zoomControlsEnabled: false,
                            initialCameraPosition: locationVm.initialCameraPos,
                            onMapCreated: (GoogleMapController controller) {
                              locationVm.onMapCreated(controller);
                            },
                            markers: locationVm.markers),
                        Align(
                            alignment: Alignment.bottomRight,
                            child: IconButton(
                                onPressed: () async {
                                  await locationVm.getCurrentPosition(context);
                                },
                                icon: const Icon(Icons.gps_fixed,
                                    color: Colors.green))),
                      ],
                    )),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: 42,
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: customOutlineButton(
                      borderColor: appBaseColor,
                      content: Center(
                          child: customText(
                              'Continue with the location', Colors.black, 16)),
                      onTap: () async {
                        // await CustomUrlLaunch.launchUrl(
                        //     "https://www.google.com/maps/search/?api=1&query=22.5905509,88.4318821");
                        completeLocationForm(context);
                      }),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
