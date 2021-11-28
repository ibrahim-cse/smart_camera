// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:login_with_signup/common/gen_login_signup_header.dart';
import 'package:login_with_signup/common/get_text_form_field.dart';
import 'package:login_with_signup/common/toast_helper.dart';
import 'package:login_with_signup/database_handler/db_helper.dart';
import 'signup_form.dart';
import 'camera_form.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  final _conEmail = TextEditingController();
  final _conPassword = TextEditingController();
  var dbHelper;

  @override
  void initState() {
    super.initState();
    dbHelper = DbHelper();
  }

  login() async {
    String uEmail = _conEmail.text;
    String uPassword = _conPassword.text;

    if (uEmail.isEmpty) {
      MyAlertDialog(context, "Please Enter User ID");
    } else if (uPassword.isEmpty) {
      MyAlertDialog(context, "Please Enter Password");
    } else {
      await dbHelper.getLoginUser(uEmail, uPassword).then((userData) {
        if (userData != null) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => Camera()),
              (Route<dynamic> route) => false);
        } else {
          MyAlertDialog(context, "Error: User Not Found");
        }
      }).catchError((error) {
        print(error);
        MyAlertDialog(context, "Error: Login Fail");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Login'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GenLoginSignupHeader(
                headerName: 'Login',
              ),
              MyTextFormField(
                controller: _conEmail,
                myhint: 'Email',
                myicon: Icons.email,
              ),
              const SizedBox(height: 10.0),
              MyTextFormField(
                controller: _conPassword,
                myhint: 'Password',
                myicon: Icons.lock,
                isObscureText: true,
              ),
              Container(
                margin: const EdgeInsets.all(30.0),
                width: double.infinity,
                child: FlatButton(
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: login,
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Does not have an Account?',
                  ),
                  FlatButton(
                    textColor: Colors.blue,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => SignupForm()),
                      );
                    },
                    child: Text('Sign up'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}