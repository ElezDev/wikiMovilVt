import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiki_virtualt/pages/login/login_controller.dart';

import '../../utils/back_groundCover.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final LoginController _loginController = LoginController();

  @override
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
                    Image.asset('assets/images/logon.png'),
                    const Text(
                      '',
                      style: TextStyle(
                        fontSize: 34.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.30),
                    _loginForm(context),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _loginForm(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.4,
      margin: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.05,
          right: MediaQuery.of(context).size.width * 0.05),
      decoration: BoxDecoration(
        //transparente
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
            'Contraseña',
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          _passwordInput(context),
          _registerOrRecoverPassword(context),
          SizedBox(height: MediaQuery.of(context).size.height * 0.04),
          _loginButton(context),
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
        right: MediaQuery.of(context).size.width * 0.03,
      ),
      height: MediaQuery.of(context).size.height * 0.037,
      padding: const EdgeInsets.all(0),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        controller: _loginController.emailController,
        decoration: const InputDecoration(
          fillColor: Colors.white,
          hintText: 'email@correo.com',
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
          controller: _loginController.passwordController,
          decoration: const InputDecoration(
            fillColor: Colors.white,
            hintText: '********',
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(left: 15.0, bottom: 13.0),
          )),
    );
  }

  Widget _registerOrRecoverPassword(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () {},
          child: const Text(
            'Recuperar contraseña',
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        TextButton(
          onPressed: _loginController.goToRegisterPage,
          child: const Text(
            'Crea una cuenta',
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }

  Widget _loginButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.1,
      ),
      height: MediaQuery.of(context).size.height * 0.05,
      child: ElevatedButton(
              onPressed: _loginController.login,

        // onPressed: _loginController.goToHomePage,
         style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff00C535),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),  
        ),
        child: const Text(
          'Iniciar sesión',
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
