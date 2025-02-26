import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'dart:io';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? _controller;
  List<CameraDescription>? cameras;
  bool _isCameraInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    cameras = await availableCameras();
    if (cameras!.isNotEmpty) {
      _controller = CameraController(
        cameras![0],
        ResolutionPreset.high,
      );
      await _controller!.initialize();
      if (!mounted) return;
      setState(() => _isCameraInitialized = true);
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  void _takePicture() async {
    if (_controller != null && _controller!.value.isInitialized) {
      XFile picture = await _controller!.takePicture();
      if (!mounted) return;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              PictureConfirmationScreen(imagePath: picture.path),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Camera"),
        backgroundColor: Colors.grey[700],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: _isCameraInitialized
                ? CameraPreview(_controller!)
                : Center(child: CircularProgressIndicator()),
          ),
          Container(
            color: Colors.grey[700]!.withOpacity(0.6),
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Icon(Icons.image, color: Colors.white),
                  onPressed: () {},
                ),
                GestureDetector(
                  onTap: _takePicture,
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 4),
                      color: Colors.red,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.cameraswitch, color: Colors.white),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PictureConfirmationScreen extends StatelessWidget {
  final String imagePath;

  const PictureConfirmationScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Picture Confirmation"),
        backgroundColor: Colors.grey[700],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Image.file(File(imagePath)),
          ),
          Container(
            color: Colors.grey[700]!.withOpacity(0.6),
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("RETAKE", style: TextStyle(color: Colors.yellow)),
                ),
                TextButton(
                  onPressed: () {},
                  child:
                      Text("CONFIRM", style: TextStyle(color: Colors.yellow)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: CameraScreen(),
  ));
}
