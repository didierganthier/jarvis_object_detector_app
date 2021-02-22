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
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/jarvis.jpg")
              )
            ),
            child: Column(
              children: [
                Stack(
                  children: [
                    Center(
                      child: Container(
                        color: Colors.black,
                        height: 360,
                        width: 360,
                        child: Image.asset("assets/camera.jpg"),
                      ),
                    ),
                    Center(
                      child: FlatButton(
                        onPressed: () {
                          initCamera();
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 35),
                          height: 270,
                          width: 360,
                          child: imgCamera == null?
                          Container(
                            height: 270,
                            width: 360,
                            child: Icon(Icons.photo_camera, color: Colors.blueAccent, size: 40,),
                          ) :
                          AspectRatio(
                            aspectRatio: cameraController.value.aspectRatio,
                            child: CameraPreview(cameraController),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
