// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuthForm extends StatefulWidget {
  final TextEditingController user;
  final TextEditingController password;
  const AuthForm({
    Key? key,
    required this.user,
    required this.password,
  }) : super(key: key);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Padding(
          padding: EdgeInsets.all(4.0),
          child:
              //Username Text field
              Text(
            'Usuário',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
        TextField(
            controller: widget.user,
            maxLength: 20,
            cursorColor: Colors.black,
            style: const TextStyle(
              fontSize: 16,
            ),
            decoration: const InputDecoration(
                counterText: '',
                contentPadding: EdgeInsets.all(0),
                fillColor: Colors.white,
                filled: true,
                prefixIcon: Icon(
                  size: 20,
                  Icons.person_2,
                  color: Colors.black,
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)))),
        const SizedBox(
          height: 8,
        ),
        const Padding(
          padding: EdgeInsets.all(4.0),
          child:
              //Password TextField
              Text(
            'Senha',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
        TextField(
            controller: widget.password,
            inputFormatters: [
              FilteringTextInputFormatter.deny(RegExp(r'[^a-zA-Z0-9]')),
            ],
            maxLength: 20,
            obscureText: true,
            cursorColor: Colors.black,
            style: const TextStyle(
              fontSize: 16,
            ),
            decoration: const InputDecoration(
                counterText: '',
                contentPadding: EdgeInsets.all(0),
                fillColor: Colors.white,
                filled: true,
                prefixIcon: Icon(
                  size: 20,
                  Icons.lock,
                  color: Colors.black,
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)))),
      ]),
    );
  }
}
