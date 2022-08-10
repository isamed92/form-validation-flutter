import 'package:flutter/material.dart';
import 'package:productos_app/providers/login_form_provider.dart';
import 'package:productos_app/ui/input_decorations.dart';
import 'package:productos_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AuthBackground(
            child: SingleChildScrollView(
      child: Column(children: [
        const SizedBox(
          height: 250,
        ),
        CardContainer(
          child: Column(children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              'Login',
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(
              height: 30,
            ),
            MultiProvider(
              providers: [
                ChangeNotifierProvider(
                  create: (context) => LoginFormProvider(),
                )
              ],
              child: const _LoginForm(),
            ),
          ]),
        ),
        const SizedBox(
          height: 50,
        ),
        const Text(
          'Crear una nueva cuenta',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        )
      ]),
    )));
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    return Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: loginForm.formKey,
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                  hintText: 'john.doe@email.com',
                  labelText: 'Correo Electronico',
                  prefixIcon: Icons.alternate_email_sharp),
              validator: (value) {
                String pattern =
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp = new RegExp(pattern);

                return regExp.hasMatch(value ?? '')
                    ? null
                    : 'El valor ingresado no luce como un correo';
              },
              onChanged: (value) => loginForm.email = value,
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                  hintText: '********',
                  labelText: 'Password',
                  prefixIcon: Icons.lock_outline),
              validator: (value) {
                if (value != null && value.length >= 6) return null;

                return 'La contraseña debe de ser de 6 carateres';
              },
              onChanged: (value) => loginForm.password = value,
            ),
            const SizedBox(
              height: 30,
            ),
            MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              disabledColor: Colors.grey,
              elevation: 0,
              color: Colors.deepPurple,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                child: const Text(
                  'Ingresar',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              onPressed: () {
                if (!loginForm.isValidForm()) return;
                Navigator.pushReplacementNamed(context, 'home');
              },
            )
          ],
        ));
  }
}
