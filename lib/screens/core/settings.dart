import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String camResult = "";
  String locationResult = "";
  String locationAllwaysResult = "";
  String locationInfo = "";
  bool loading = false;

  controlPermission() async {
    var status = await Permission.camera.status;

    switch (status) {
      case (PermissionStatus.granted):
        setState(() {
          camResult = "Yetki Alinmis.";
        });
        break;
      case (PermissionStatus.denied):
        setState(() {
          camResult = "Yetki Rededilmis.";
        });
        break;
      case PermissionStatus.restricted:
        setState(() {
          camResult = "Kisitlanmis Yetki, hic turlu alamayiz.";
        });
        break;
      case PermissionStatus.limited:
        // TODO: Handle this case.
        setState(() {
          camResult = "Kisitlanmis Yetki, hKullanici kisitli yetki secmis.";
        });
        break;
      case PermissionStatus.permanentlyDenied:
        setState(() {
          camResult = "Yetki vermesin diye istemis kullanic";
        });
        break;
      case PermissionStatus.provisional:
        setState(() {
          camResult = "Provisional";
        });
        break;
    }

    await Permission.locationAlways.onDeniedCallback(() {
      // Your code
      setState(() {
        locationResult = "Yetki vermeyi reddetti";
      });
    }).onGrantedCallback(() async {
      // Your code
      setState(() {
        locationResult = "Verdi Yetgiyi";
      });

      await Permission.camera.onDeniedCallback(() {
        // Your code
        setState(() {
          locationAllwaysResult =
              "HERZAMAN KONUM ERISIM Yetki vermeyi reddetti";
        });
      }).onGrantedCallback(() {
        // Your code
        setState(() {
          locationAllwaysResult = "HERZAMAN KONUM ERISIM " + status.toString();
        });
      }).onPermanentlyDeniedCallback(() {
        // Your code
        setState(() {
          locationAllwaysResult = "HERZAMAN KONUM ERISIM " + status.toString();
        });
      }).onRestrictedCallback(() {
        // Your code
        setState(() {
          locationAllwaysResult = "HERZAMAN KONUM ERISIM " + status.toString();
        });
      }).onLimitedCallback(() {
        // Your code
        setState(() {
          locationAllwaysResult = "HERZAMAN KONUM ERISIM " + status.toString();
        });
      }).onProvisionalCallback(() {
        // Your code
        setState(() {
          locationAllwaysResult = "HERZAMAN KONUM ERISIM " + status.toString();
        });
      }).request();
    }).onPermanentlyDeniedCallback(() {
      // Your code
      setState(() {
        locationResult = "Herzaman icin engelledi";
      });
    }).onRestrictedCallback(() {
      // Your code
      setState(() {
        locationResult = "Kisitlanmis ve alinamaz";
      });
    }).onLimitedCallback(() {
      // Your code
      setState(() {
        locationResult = "Kullanici kisitlanmis yetki vermis";
      });
    }).onProvisionalCallback(() {
      // Your code
      setState(() {
        locationResult = "Provisonal";
      });
    }).request();
  }

  getLocation() async {
    setState(() {
      loading = true;
    });

    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      setState(() {
        locationInfo = "Konum Hizmetleri Ayarlardan Kapali";
      });

      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        setState(() {
          locationInfo = "Adam inat etmis yetki vermiyor";
        });
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      setState(() {
        locationInfo = "Abi bilgi vermek istemiyor, tamamen kapatmis";
      });
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    final pos = await Geolocator.getCurrentPosition();

    setState(() {
      locationInfo = '''
        accuracy: ${pos.accuracy}
        longitude: ${pos.longitude}
        latitude: ${pos.latitude}
        speed: ${pos.speed}
        speed Dikkati: ${pos.speedAccuracy}
        veri zamani: ${pos.timestamp}
        ''';
    });

    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controlPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: SizedBox.expand(
        child: ListView(
          children: [
            ExpansionTile(
              title: Text("Camera Permission"),
              children: [
                Text(camResult),
                Gap(20),
                ElevatedButton(
                  onPressed: () async {
                    final status = await Permission.camera.request();
                  },
                  child: Text("Yetki iste"),
                ),
              ],
            ),
            ExpansionTile(
              title: Text("Location Permission"),
              children: [
                Text(locationResult),
                Divider(),
                Text("Allways Status: "),
                Text(locationAllwaysResult),
              ],
            ),
            ExpansionTile(
              title: const Text("Location Info"),
              children: [
                IconButton(
                  onPressed: getLocation,
                  icon: const Icon(Icons.location_on),
                ),
                const Divider(),
                Text(locationInfo),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
