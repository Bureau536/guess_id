import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef OnFormSubmitted = void Function(int guessedId);

class IdForm extends StatefulWidget {
  final OnFormSubmitted onGuessSubmitted;

  const IdForm({
    super.key,
    required this.onGuessSubmitted,
  });

  @override
  State<IdForm> createState() => _IdFormState();
}

class _IdFormState extends State<IdForm> {
  final _formKey = GlobalKey<FormState>();
  int guessedId = 0;

  void _saveValue() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _formKey.currentState!.reset();
      widget.onGuessSubmitted(guessedId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(4)
            ],
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Id',
            ),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null) {
                return 'Debe ingresar un número de 1 a 4 dígitos';
              }
              final intValue = int.tryParse(value);
              if (intValue == null || intValue > 9999 || intValue < 1) {
                return 'Debe ingresar un número de 1 a 4 dígitos';
              }
              return null;
            },
            onSaved: (value) => guessedId = int.parse(value!),
          ),
          const SizedBox(height: 30),
          FloatingActionButton.extended(
            onPressed: _saveValue,
            label: const Text('Adivinar'),
          ),
        ],
      ),
    );
  }
}
