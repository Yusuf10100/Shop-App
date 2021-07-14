import 'package:flutter/material.dart';
import 'package:shop_app/shared/components/components.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
                  child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Login'.toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .copyWith(color: Colors.black)),
              Text('login now to browse our hot offers',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      .copyWith(color: Colors.grey)),
              SizedBox(height: 20),
              defaultFormField(
                  controller: emailController,
                  type: TextInputType.emailAddress,
                  validate: (String value) {
                    if (value.isEmpty) {
                      return 'Email is empty';
                    }
                  },
                  label: 'Email Address',
                  prefix: Icons.email_outlined),
              SizedBox(height: 20),
              defaultFormField(
                  controller: passwordController,
                  type: TextInputType.visiblePassword,
                  validate: (String value) {
                    if (value.isEmpty) {
                      return 'Password is too short ';
                    }
                  },
                  label: 'Password',
                  prefix: Icons.lock_outline,
                  isPassword: true,
                  suffix: Icons.remove_red_eye_outlined
                  ),
              SizedBox(height: 30),
              defaultButton(function: () {}, text: 'Login'),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t have an account?',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          .copyWith(color: Colors.black)),
                          defaultTextButton(function: (){}, text: 'Register')
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
