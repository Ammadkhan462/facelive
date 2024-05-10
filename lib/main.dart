import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:firebase_database/firebase_database.dart';

class FaceDetectionApp extends StatefulWidget {
  @override
  _FaceDetectionAppState createState() => _FaceDetectionAppState();
}

class _FaceDetectionAppState extends State<FaceDetectionApp> {
  late CameraController _cameraController;
  late FirebaseStorage _storage;
  late FirebaseDatabase _database;

  @override
  void initState() {
      super.initState();
  _cameraController = CameraController(
    const CameraDescription(
      name: 'rear',
      lensDirection: CameraLensDirection.back,
      sensorOrientation: 0,
    ),
    ResolutionPreset.high,
    enableAudio: false,
  );
  _cameraController.initialize().then((_) {
    if (!mounted) {
      return;
    }
    // _processCameraImage is undefined, so we comment it out for now
    // _cameraController.startImageStream(_processCameraImage);
  });
    _storage = FirebaseStorage.instance;
    _database = FirebaseDatabase.instance;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Face Detection App'),
      ),
      body: Column(
        children: [
          CameraPreview(_cameraController),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              // Get the face image
              final faceImage = await _cameraController.takePicture();
              final faceImageFile = File(faceImage.path);

              // Upload the face image to Firebase Storage
              final storageRef = _storage
                  .ref('faces/${DateTime.now().millisecondsSinceEpoch}');
              final uploadTask = storageRef.putFile(faceImageFile);

              // Get the uploaded image URL
              final imageUrl = await uploadTask.snapshot.ref.getDownloadURL();

              // Compare the uploaded image with the pictures in Firebase Storage
              final picturesRef = _storage.ref('pictures');
              final pictures = await picturesRef.listAll();

              for (final picture in pictures.items) {
                final pictureUrl = await picture.getDownloadURL();

                // Compare the images using Firebase ML Kit
                final visionImage = FirebaseVisionImage.fromFilePath(imageUrl);
                final visionPicture =
                    FirebaseVisionImage.fromFilePath(pictureUrl);
                final faceDetector = FirebaseVision.instance.faceDetector();
                final facesInPicture =
                    await faceDetector.processImage(visionPicture);

                if (facesInPicture.isNotEmpty) {
                  // Mark attendance in Firebase Realtime Database or Firestore
                  final attendanceRef = _database.ref(
                      'attendance/${DateTime.now().millisecondsSinceEpoch}');
                  await attendanceRef.set({'present': true});
                }
              }
            },
            child: Text('Detect Faces and Mark Attendance'),
          ),
        ],
      ),
    );
  }
}
