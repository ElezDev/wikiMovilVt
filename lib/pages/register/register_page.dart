import 'package:flutter/material.dart';
import 'package:wiki_virtualt/pages/register/register_controller.dart';
import 'package:wiki_virtualt/utils/back_groundCover.dart';
import 'package:wiki_virtualt/widgets/vt_bg.dart';
import '../../globals/globarVar.dart';

class RegisterPage extends StatefulWidget with WidgetsBindingObserver {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final RegisterController _registerController = RegisterController();

  @override
  void initState() {
    super.initState();
    progrest = false;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackGroundCover(),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    VtWidget(
                      title: '',
                    ),
                    Stack(
                      children: [
                        _registerForm(context),
                        (progrest == true)
                            ? Center(
                                child: Container(
                                    child: CircularProgressIndicator()),
                              )
                            : Container(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _registerForm(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.45,
      margin: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.05,
        right: MediaQuery.of(context).size.width * 0.05,
      ),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(0, 0, 0, 0.5),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'e-mail',
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          _emailInput(context),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          const Text(
            'Nombre',
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          _nameInput(context),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          const Text(
            'Nombre de usuario',
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          _usernameInput(context),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
           const Text(
            'Contraeña',
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          _passwordInput(context),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          _registerButton(context),
        ],
      ),
    );
  }

  Widget _emailInput(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      margin: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.03,
          right: MediaQuery.of(context).size.width * 0.03),
      height: MediaQuery.of(context).size.height * 0.037,
      padding: const EdgeInsets.all(0),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        controller: _registerController.emailController,
        decoration: const InputDecoration(
          fillColor: Colors.white,
          hintText: 'email@correo.com',
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(left: 15.0, bottom: 13.0),
        ),
      ),
    );
  }

  Widget _usernameInput(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      margin: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.03,
        right: MediaQuery.of(context).size.width * 0.03,
      ),
      height: MediaQuery.of(context).size.height * 0.037,
      padding: const EdgeInsets.all(0),
      child: TextField(
        controller: _registerController.usernameController,
        decoration: const InputDecoration(
          fillColor: Colors.white,
          hintText: 'Username',
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(left: 15.0, bottom: 13.0),
        ),
      ),
    );
  }

  Widget _nameInput(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      margin: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.03,
        right: MediaQuery.of(context).size.width * 0.03,
      ),
      height: MediaQuery.of(context).size.height * 0.037,
      padding: const EdgeInsets.all(0),
      child: TextField(
        controller: _registerController.nameController,
        decoration: const InputDecoration(
          fillColor: Colors.white,
          hintText: 'Name',
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(left: 15.0, bottom: 13.0),
        ),
      ),
    );
  }

  Widget _passwordInput(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      margin: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.03,
          right: MediaQuery.of(context).size.width * 0.03),
      height: MediaQuery.of(context).size.height * 0.037,
      padding: const EdgeInsets.all(0),
      child: TextField(
          obscureText: true,
          controller: _registerController.passwordController,
          decoration: const InputDecoration(
            fillColor: Colors.white,
            hintText: '*******',
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(left: 15.0, bottom: 13.0),
          )),
    );
  }

  Widget _registerButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.1),
      height: MediaQuery.of(context).size.height * 0.05,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            progrest = true;
          });
          _registerController.register;
          setState(() {});
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff00C535),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        child: const Text(
          'Crear cuenta',
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.white,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}
