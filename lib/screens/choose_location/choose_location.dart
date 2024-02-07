import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shoppixa/screens/choose_location/vm/location_vm.dart';
import 'package:shoppixa/utils/constants/app_color.dart';
import 'package:shoppixa/utils/custom_buttons/custom_out_line_btn.dart';
import 'package:shoppixa/utils/custom_text.dart';

import '../../utils/custom_buttons/custom_back_button.dart';
import 'complete_location_form.dart';

class ChooseCurrentLocation extends StatelessWidget {
  const ChooseCurrentLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LocationVm(context),
      child: Consumer<LocationVm>(builder: (context, locationVm, _) {
        return Scaffold(
          appBar: AppBar(leading: CustomBackButton(), actions: [
            Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding:
                      const EdgeInsets.only(right: 10, top: 10, bottom: 10),
                  child: CircleAvatar(
                    backgroundColor: appBaseColor.withOpacity(0.2),
                    radius: 25,
                    child: IconButton(
                        onPressed: () async {
                          await locationVm.getCurrentPosition(context);
                        },
                        icon: const Icon(Icons.gps_fixed, color: Colors.black)),
                  ),
                )),
          ]),
          bottomNavigationBar: Container(
            width: MediaQuery.sizeOf(context).width,
            height: 42,
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 5),
            child: customOutlineButton(
                borderColor: appBaseColor,
                content: Center(
                    child: customText(
                        'Continue with the location', Colors.black, 16)),
                onTap: () async {
                  // await CustomUrlLaunch.launchUrl(
                  //     "https://www.google.com/maps/search/?api=1&query=22.5905509,88.4318821");
                  completeLocationForm(context, locationVmValue: locationVm);
                }),
          ),
          body: Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: GoogleMap(
                mapType: MapType.hybrid,
                zoomControlsEnabled: false,
                onCameraMove: (pos) {
                  // locationVm.getChangeLatLang(pos);
                },
                onTap: (value) {
                  locationVm.changeLocationTap(value);
                },
                initialCameraPosition: locationVm.initialCameraPos,
                onMapCreated: (GoogleMapController controller) {
                  locationVm.onMapCreated(controller);
                },
                markers: locationVm.markers),
          ),
        );
      }),
    );
  }
}
