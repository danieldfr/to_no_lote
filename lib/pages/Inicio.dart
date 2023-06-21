import 'dart:async';

import 'package:flutter/material.dart';
import 'package:to_no_lote/pages/CadastrarTerreno.dart';
import 'package:here_sdk/core.dart';
import 'package:here_sdk/core.engine.dart';
import 'package:here_sdk/core.errors.dart';
import 'package:here_sdk/mapview.dart';
import '../../services/SearchExample.dart';
import '../constants/contants.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

import '../services/lots_services.dart';

class Inicio extends StatefulWidget {
  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  late HereMapController hereMapController;
  late StreamController<String> _streamController;
  String address = 'Endereço';
  SearchExample? _searchExample;
  List<MapMarker> _mapMarkerList = [];
  List<dynamic> _ponters = [];
  late Position position;
  double? long, lat;
  bool servicestatus = false;
  bool haspermission = false;
  late LocationPermission permission;
  void initState() {
    super.initState();

    checkGps();
    _initializeHERESDK();

    _streamController = StreamController<String>();
    carregarDadosDaAPI();

    // _stream = _streamController.stream;
  }

  Future<void> carregarDadosDaAPI() async {
    var data = await get_lots();
    // Extraia as opções da resposta
    List<dynamic> apiOptions = data;
    // Preencha a lista de opções do select box
    setState(() {
      var ponters = apiOptions.map((option) => option).toList();
      print("teste $ponters");
      for (int i = 0; i < ponters.length; i++) {
        _ponters.add({"lat": ponters[i]['lat'], "long": ponters[i]['long']});
      }
      print("new pointer $_ponters");
    });
  }

  //Inicializar o SDK estabelecer acesso;
  void _initializeHERESDK() async {
    // Needs to be called before accessing SDKOptions to load necessary libraries.
    SdkContext.init(IsolateOrigin.main);

    SDKOptions sdkOptions =
        SDKOptions.withAccessKeySecret(accessKeyId, accessKeySecret);

    try {
      await SDKNativeEngine.makeSharedInstance(sdkOptions);
    } on InstantiationException {
      throw Exception("Failed to initialize the HERE SDK.");
    }
  }

  //gps service
  getLocation() async {
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      long = position.longitude;
      lat = position.latitude;
    });
  }

  // verificar 
  checkGps() async {
    servicestatus = await Geolocator.isLocationServiceEnabled();
    if (servicestatus) {
      permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          print('Location permissions are denied');
        } else if (permission == LocationPermission.deniedForever) {
          print("'Location permissions are permanently denied");
        } else {
          haspermission = true;
        }
      } else {
        haspermission = true;
      }

      if (haspermission) {
        setState(() {
          //refresh the UI
        });

        await getLocation();
      }
    } else {
      print("GPS Service is not enabled, turn on GPS location");
    }

    setState(() {
      //refresh the UI
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bem-vindo"),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        child: map(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CadastrarTerreno()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  //maps init
  void _onMapCreated(HereMapController hereMapController) async {
    await getLocation();
    hereMapController.mapScene.loadSceneForMapScheme(MapScheme.hybridDay,
        (MapError? error) {
      if (error != null) {
        print('Map scene not loaded. MapError: ${error.toString()}');
        return;
      }

      double distanceToEarthInMeters = 10000;
      MapMeasure mapMeasureZoom =
          MapMeasure(MapMeasureKind.distance, distanceToEarthInMeters);

      hereMapController.camera
          .lookAtPointWithMeasure(GeoCoordinates(lat!, long!), mapMeasureZoom);
      _searchExample = SearchExample(hereMapController, lat!, long!,
          _mapMarkerList, address, _streamController, _ponters);
      // GesturesExample(hereMapController, lat!, long!, _mapMarkerList);
    });
  }

  Container map() {
    return Container(
      // height: 500.0,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.white, Colors.white],
        ),
      ),
      child: HereMap(onMapCreated: _onMapCreated),
    );
  }
}
