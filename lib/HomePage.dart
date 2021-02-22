import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool isWorking = false;
  String result = "";
  CameraController cameraController;
  CameraImage imgCamera;

  initCamera()
  {
    cameraController = CameraController(cameras[0], ResolutionPreset.medium);
    cameraController.initialize().then((value)
    {
      if(!mounted)
      {
        return;
      }

      setState(() {
        cameraController.startImageStream((image) =>
        {
          if(!isWorking)
          {
            isWorking = true,
            imgCamera = image,
          }
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
