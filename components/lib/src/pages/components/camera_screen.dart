import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class CameraScreenPage extends StatefulWidget {
  const CameraScreenPage({super.key});

  @override
  State<CameraScreenPage> createState() => _CameraScreenPageState();
}

enum WidgetState {NONE, LOADING, LOADED, ERROR}
class _CameraScreenPageState extends State<CameraScreenPage> {
  WidgetState _widgetState = WidgetState.NONE;
  List<CameraDescription> _cameras = [];
  CameraController? _cameraController;

  @override
  void initState() {
    super.initState();

    _initializeCamera();
  }

  @override
  void dispose() {
    super.dispose();
    _cameraController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    switch(_widgetState) {
      case WidgetState.NONE:
      case WidgetState.LOADING:
        return _buildScaffold(context, const Center(
          child: CircularProgressIndicator(),
        ));
      case WidgetState.LOADED:
        return _buildScaffold(context, Container(
          width: size.width,
          height: size.height,
          child: CameraPreview(_cameraController!)
        ));
      case WidgetState.ERROR:
        return _buildScaffold(context, const Center(
          child: Text('ERROR :('),
        ));
    }
  }

  Widget _buildScaffold(BuildContext context, Widget body) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cámara'),
        centerTitle: true,
        elevation: 0,
      ),
      body: body,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.camera_alt),
      ),
    );
  }

  Future _initializeCamera() async {
    _widgetState = WidgetState.LOADING;
    if (mounted) setState(() {});

    _cameras = await availableCameras();
    if (_cameras.isEmpty) {
      _widgetState = WidgetState.ERROR;
      if (mounted) setState(() {});
      return;
    }

    _cameraController = CameraController(_cameras[0], ResolutionPreset.high);
    await _cameraController?.initialize();

    if (_cameraController!.value.hasError) {
      _widgetState = WidgetState.ERROR;
    } else {
      _widgetState = WidgetState.LOADED;
    }

    if (mounted) setState(() {});
  }

}
