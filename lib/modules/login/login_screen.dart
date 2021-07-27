import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/cubit/cubit.dart';
import 'package:shop_app/shared/cubit/states.dart';
import 'package:shop_app/shared/network/local/%20cache_helper.dart';

class LoginScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            if (state.loginModel.status) {
              CacheHelper.saveData(key: 'token', value: state.loginModel.data.token);
              toast(text: state.loginModel.message, state: ToastStates.SUCCESS);
            } else {
              toast(text: state.loginModel.message, state: ToastStates.ERROR);
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Login'.toUpperCase(),
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              .copyWith(color: Colors.black)),
                      Text('Login now to browse our hot offers',
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
                            return null;
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
                            return null;
                          },
                          onSubmit: (value) {
                            if (formKey.currentState.validate()) {
                              LoginCubit.get(context).loginScreen(
                                  email: emailController.text,
                                  password: passwordController.text);
                            }
                          },
                          label: 'Password',
                          prefix: Icons.lock_outline,
                          isPassword: LoginCubit.get(context).isPassword,
                          suffix: LoginCubit.get(context).isPassword
                              ? Icons.remove_red_eye_outlined
                              : Icons.visibility_off_outlined,
                          suffixPressed: () {
                            LoginCubit.get(context).passwordSuffixChange();
                          }),
                      SizedBox(height: 30),
                      ConditionalBuilder(
                        condition: state is! LoginLoadingState,
                        builder: (context) => defaultButton(
                          function: () {
                            if (formKey.currentState.validate()) {
                              LoginCubit.get(context).loginScreen(
                                  email: emailController.text,
                                  password: passwordController.text);
                            }
                          },
                          text: 'Login',
                        ),
                        fallback: (context) =>
                            Center(child: CircularProgressIndicator()),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Don\'t have an account?',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  .copyWith(color: Colors.black)),
                          defaultTextButton(function: () {}, text: 'Register')
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
