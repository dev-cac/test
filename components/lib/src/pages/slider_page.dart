import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({super.key});

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valueSlider = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slider'),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          children: <Widget>[
            _createSlider(),
            Expanded(child: _createImage())
          ]
        ),
      ),
    );
  }

  Widget _createSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño D:',
      value: _valueSlider,
      min: 10,
      max: 400,
      onChanged: (double newValue) {
        setState(() {
          _valueSlider = newValue;
        });
      },
    );
  }

  Widget _createImage() {
    return Image(
      image: const NetworkImage('https://img.freepik.com/fotos-premium/gato-gafas-sienta-junto-al-monitor-ayuda-al-programador-ia-generativa_918839-1342.jpg'),
      width: _valueSlider,
      fit: BoxFit.contain,
    );
  }
}
