import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guess_id/presentation/screens/home/bloc/guess_bloc.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String userName = '';

  void onSignUp(BuildContext context, String userName) {
    context.read<GuessBloc>().add(SignUpEvent(userName));
  }

  void _saveValue() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _formKey.currentState!.reset();
      onSignUp(context, userName);
    }
  }

  static final RegExp userNameRegExp = RegExp(
    r'^(?=[a-zA-Z0-9._]{6,15}$)(?!.*[_.]{2})[^_.].*[^_.]$',
  );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GuessBloc, GuessState>(
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
            child: Column(
              children: [
                Text(
                  'Por favor ingrese nombre de usuario:',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  inputFormatters: <TextInputFormatter>[
                    LengthLimitingTextInputFormatter(15)
                  ],
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nombre',
                    errorMaxLines: 3,
                  ),
                  validator: (value) {
                    if (value == null || value.length <= 5) {
                      return 'El nombre de usuario debe tener al menos 6 caracteres.';
                    }
                    if (!userNameRegExp.hasMatch(value)) {
                      return "El nombre de usuario no puede contener caracteres especiales. Solo '_' y '.' no consecutivos.";
                    }
                    return null;
                  },
                  onSaved: (value) => userName = value!.toLowerCase(),
                ),
                const SizedBox(height: 30),
                FloatingActionButton.extended(
                  onPressed: _saveValue,
                  label: const Text('Ingresar'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
