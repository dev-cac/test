import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _name = '';
  String _email = '';
  String _fecha = '';
  String _optSelect = 'Fly';

  List<String> _powers = ['Fly', 'X Ray', 'Super Air', 'Super Strong'];
  TextEditingController _inputFieldDate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inputs'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        children: <Widget>[
          _createInput(),
          const Divider(),
          _createInputEmail(),
          const Divider(),
          _createInputPwd(),
          const Divider(),
          _createDate(context),
          const Divider(),
          _createDropdown(),
           const Divider(),
          _createPerson()
        ],
      ),
    );
  }

  Widget _createInput() {
    return TextField(
      autofocus: false,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        counter: Text('Letras: ${_name.length}'),
        hintText: 'Ingrese Nombre',
        labelText: 'Nombre',
        helperText: 'Solo es el nombre',
        suffixIcon: const Icon(Icons.accessibility_new),
        icon: const Icon(Icons.account_circle)
      ),
      onChanged: (value) {
        _name = value;
        setState(() {});
      },
    );
  }

  Widget _createInputEmail() {
    return TextField(
      autofocus: false,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Ingrese Email',
        labelText: 'Email',
        suffixIcon: const Icon(Icons.alternate_email),
        icon: const Icon(Icons.email)
      ),
      onChanged: (value) => setState(() { _email = value; }),
    );
  }

  Widget _createInputPwd() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Ingrese Contraseña',
        labelText: 'Password',
        suffixIcon: const Icon(Icons.lock_open),
        icon: const Icon(Icons.lock)
      ),
      onChanged: (value) => setState(() { _email = value; }),
    );
  }

  Widget _createDate( BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDate,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Fecha de Nacimiento',
        labelText: 'Fecha',
        suffixIcon: const Icon(Icons.calendar_month_outlined),
        icon: const Icon(Icons.calendar_today)
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        _selectDate(context);
      },
    );
  }

  List<DropdownMenuItem<String>> getOptionsDropdown() {
    List<DropdownMenuItem<String>> lista = [];

    _powers.forEach((power) {
      lista.add(DropdownMenuItem(
        child: Text(power),
        value: power,
      ));
    });

    return lista;
  }

  Widget _createDropdown() {
    return Row(
      children: <Widget>[
        const Icon(Icons.select_all),
        const SizedBox(width: 30),
        Expanded(
          child: DropdownButton(
            items: getOptionsDropdown(),
            value: _optSelect,
            onChanged: (item) {
              setState(() {
                _optSelect = item!;
              });
            },
          ),
        )
      ]
    );
  }

  Widget _createPerson() {
    return ListTile(
      title: Text('Nombre es: $_name'),
      subtitle: Text('Email: $_email'),
      trailing: Text('Poder: $_optSelect'),
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime(2025),
      locale: const Locale('es', 'ES')
    );

    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        _inputFieldDate.text = _fecha;
      });
    }
  }
}
