import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey _globalKey = GlobalKey();

  _saveScreen() async {
    RenderRepaintBoundary boundary =
        _globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage();
    ByteData? byteData = await (image.toByteData(format: ui.ImageByteFormat.png) as FutureOr<ByteData?>);
    if (byteData != null) {
      final result =
          await ImageGallerySaver.saveImage(byteData.buffer.asUint8List());
      print(result);
      _toastInfo(result.toString());
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            RepaintBoundary(
              key: _globalKey,
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/V.png'),
                      fit: BoxFit.cover,
                    )),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _saveScreen();
        },
        child: Icon(
          Icons.save_alt_rounded,
          color: Colors.white,
        ),
      ),
    );
  }

  _toastInfo(String info) {
    Fluttertoast.showToast(msg: "Image Saved to Gallery", toastLength: Toast.LENGTH_LONG);
  }
}
