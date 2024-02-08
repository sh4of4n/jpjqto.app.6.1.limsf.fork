import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:camera/camera.dart';
import 'package:jpj_qto/utils/constants.dart';
import 'package:jpj_qto/utils/custom_snackbar.dart';
import 'package:jpj_qto/utils/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:path/path.dart' show join;
// import 'package:path_provider/path_provider.dart';

import 'package:jpj_qto/common_library/utils/app_localizations.dart';

@RoutePage(name: 'TakeProfilePicture')
class TakeProfilePicture extends StatefulWidget {
  final List<CameraDescription>? camera;

  const TakeProfilePicture(this.camera, {super.key});

  @override
  TakeProfilePictureState createState() => TakeProfilePictureState();
}

class TakeProfilePictureState extends State<TakeProfilePicture> {
  final customSnackbar = CustomSnackbar();
  final localStorage = LocalStorage();
  CameraController? _controller;
  Future<void>? _initializeControllerFuture;
  final primaryColor = ColorConstant.primaryColor;
  CameraDescription? cameraDescription;

  @override
  void initState() {
    super.initState();
    // initializeCamera();
    loadCamera(widget.camera![1]);
  }

  /* initializeCamera() {
    setState(() {
      cameraDescription = widget.camera[1];
    });

    _controller = CameraController(
      cameraDescription,
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  } */

  void loadCamera(CameraDescription cameraDescription) async {
    setState(() {
      this.cameraDescription = cameraDescription;
    });

    if (_controller != null) {
      await _controller!.dispose();
    }
    _controller = CameraController(
      cameraDescription,
      ResolutionPreset.low,
      enableAudio: false,
    );

    // If the controller is updated then update the UI.
    _controller!.addListener(() {
      if (mounted) setState(() {});
      if (_controller!.value.hasError) {
        customSnackbar.show(context,
            message: 'Camera error ${_controller!.value.errorDescription}',
            type: MessageType.ERROR);
      }
    });

    try {
      _initializeControllerFuture = _controller!.initialize();
    } on CameraException catch (e) {
      print(e);
    }

    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Take a picture'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              if (cameraDescription == widget.camera![1]) {
                setState(() {
                  cameraDescription = widget.camera![0];
                });
              } else {
                setState(() {
                  cameraDescription = widget.camera![1];
                });
              }

              loadCamera(cameraDescription!);
            },
            child: Text(
              AppLocalizations.of(context)!.translate('toggle_camera'),
            ),
          ),
        ],
      ),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_controller!);
          } else {
            return Center(
                child: SpinKitFoldingCube(
              color: primaryColor,
            ));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.camera_alt),
        onPressed: () async {
          try {
            await _initializeControllerFuture;

            // final path = join(
            //   (await getTemporaryDirectory()).path,
            //   '${DateTime.now()}.png',
            // );

            XFile file = await _controller!.takePicture();

            // localStorage
            //     .saveProfilePic(base64Encode(File(path).readAsBytesSync()));

            // String test = await localStorage.getProfilePic();

            // print(test);

            context.router.pop(file.path);
            /* Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DisplayPictureScreen(imagePath: path),
              ),
            ); */
          } catch (e) {
            print(e);
          }
        },
      ),
    );
  }
}

// A widget that displays the picture taken by the user.
class DisplayPictureScreen extends StatelessWidget {
  final String? imagePath;

  const DisplayPictureScreen({super.key, this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture')),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Image.file(File(imagePath!)),
    );
  }
}
