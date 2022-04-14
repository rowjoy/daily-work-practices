// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:imagetotext/controller/scaner_controller.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrcodeScaner extends StatelessWidget {
  const QrcodeScaner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  Get.to(GnarateQrCode());
                },
                child: Text("QR Code Granate"),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.to(ScannerPage());
                },
                child: Text("QR Code Scanner"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GnarateQrCode extends StatefulWidget {
  const GnarateQrCode({Key? key}) : super(key: key);

  @override
  State<GnarateQrCode> createState() => _GnarateQrCodeState();
}

class _GnarateQrCodeState extends State<GnarateQrCode> {
  final valuController = TextEditingController();
  final _value = Get.put(Scaner());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Obx(
                  () => QrImage(
                    size: 200,
                    data: _value.profileValue.value,
                    version: QrVersions.auto,
                    backgroundColor: Colors.white,
                    // embeddedImage: NetworkImage(
                    //   "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                    //   scale: 20,
                    // ),
                    // embeddedImageStyle: QrEmbeddedImageStyle(
                    //   size: Size(100, 100),
                    // ),
                    // embeddedImageEmitsError: true,
                  ),
                ),
                TextFormField(
                  controller: valuController,
                  decoration: InputDecoration(
                    suffixIcon: Obx(
                      () => IconButton(
                        onPressed: () {
                          if (_value.profileValue.value.isNotEmpty) {
                            _value.profileValue.value = "";
                          } else {
                            _value.profileValue.value = valuController.text;
                          }
                        },
                        icon: Icon(Icons.done),
                        color: _value.profileValue.value.isEmpty
                            ? Colors.grey
                            : Colors.green,
                      ),
                    ),
                    hintText: "Enter your link",
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ScannerPage extends StatefulWidget {
  const ScannerPage({Key? key}) : super(key: key);

  @override
  State<ScannerPage> createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  final qrkey = GlobalKey(debugLabel: "QR");
  QRViewController? _controller;
  final _getvalu = Get.put(Scaner());

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      _controller!.pauseCamera();
    } else {
      _controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            Expanded(
              flex: 6,
              child: QRView(
                key: qrkey,
                overlay: QrScannerOverlayShape(
                  borderLength: 30,
                  borderRadius: 10,
                  borderWidth: 10.0,
                  // overlayColor: Colors.white,
                ),
                onQRViewCreated: _onQRViewCreated,
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                width: Get.width,
                color: Colors.white,
                child: Center(
                  child: (_getvalu.ruselt != null)
                      ? Text(
                          'Barcode Type: ${describeEnum(_getvalu.ruselt!.format)}   Data: ${_getvalu.ruselt!.code}')
                      : Text('Scan a code'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onQRViewCreated(QRViewController controller) async {
    // ignore: unnecessary_this
    this._controller = controller;
    controller.scannedDataStream.listen((event) {
      setState(() {
        _getvalu.ruselt = event;
      });
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}
