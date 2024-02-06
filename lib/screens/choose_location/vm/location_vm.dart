import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shoppixa/resources/local_storeage/save_pincode/saved_pincode_sp.dart';
import 'package:shoppixa/utils/text_utils.dart';

import '../../../utils/logger.dart';
import '../../../utils/routes/route_names.dart';

class LocationVm with ChangeNotifier {
  LocationVm(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await handleLocationPermission(context).then((value) async {
        await getCurrentPosition(context).then((value) async {
          await getAddressFromLatLng().whenComplete(() {
            pincode =
                TextEditingController(text: currentPlace?.postalCode ?? "");
          });
        });
      });
    });
  }

  // @override
  // void dispose() {
  //   googleMapController?.dispose();
  //   super.dispose();
  // }

  String? currentAddress;
  Position? currentPosition;
  Placemark? currentPlace;

  CameraPosition initialCameraPos = const CameraPosition(
    target: LatLng(28.7041, 77.1025),
    zoom: 14.4746,
  );

  Completer<GoogleMapController> mapController = Completer();

  void onMapCreated(GoogleMapController controller) {
    mapController.complete(controller);
    googleMapController = controller;
    notifyListeners();
  }

  void updateUI() => notifyListeners();

  GoogleMapController? googleMapController;
  Set<Marker> markers = {};

  Future<bool> handleLocationPermission(BuildContext context) async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> getCurrentPosition(BuildContext context) async {
    final hasPermission = await handleLocationPermission(context);

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      currentPosition = position;
      // setLatLan(position.longitude, position.latitude);
      if (TextUtils().isTextNotEmptyOrNull(googleMapController)) {
        /// moving camera to current position
        googleMapController!
            .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
          target: LatLng(currentPosition!.latitude, currentPosition!.longitude),
          zoom: 14,
        )));

        /// place current location marker
        markers.clear();
        markers.add(Marker(
          markerId: const MarkerId("CurrentLocation"),
          position:
              LatLng(currentPosition!.latitude, currentPosition!.longitude),
        ));
        await getAddressFromLatLng();
      } else {
        AppLog.w('its else part');
      }
      notifyListeners();
    }).catchError((e) {
      AppLog.e("getCurrent Position $e");
    });
  }

  Future<void> getAddressFromLatLng() async {
    await placemarkFromCoordinates(
            currentPosition!.latitude, currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      currentAddress =
          '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
      currentPlace = place;
      AppLog.i(
          'Readable Add --- ${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode} ');
      notifyListeners();
    }).catchError((e) {
      AppLog.e('Error: $e');
    });
  }

  final formKey = GlobalKey<FormState>();

  TextEditingController add1 = TextEditingController();
  TextEditingController add2 = TextEditingController();
  TextEditingController landmark = TextEditingController();
  TextEditingController pincode = TextEditingController();

  void clearFormOut(BuildContext context) {
    add1.clear();
    add2.clear();
    landmark.clear();
    pincode.clear();
    Navigator.pop(context);
    notifyListeners();
  }

  void validateFullForm(BuildContext context) {
    final isValid = formKey.currentState?.validate();

    if (!(isValid!)) {
      return;
    }
    SavedPinCodeSp().savePinCode(pincode.text);
    context.pushReplacementNamed(MyRoutes.home);
  }
}
