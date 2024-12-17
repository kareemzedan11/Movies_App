import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Presentation/layouts/auth/register/register_viewmodel/register_view_model.dart';
import 'package:movies_app/Presentation/layouts/provider/auth_provider.dart';
import 'package:movies_app/core/Utils/routes.dart';
import 'package:movies_app/core/constants.dart';
import 'package:movies_app/core/firebase/firestore_helper.dart';
import 'package:movies_app/core/reusable%20components/custom_text_filed.dart';
import 'package:movies_app/data/models/firsbase_model/user_model.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(message),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Try Again"),
            ),
          ],
        );
      },
    );
  }

  void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  void closeDialogs(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    return BlocListener<RegisterViewModel, RegisterState>(
      listenWhen: (previous, current) =>
          current is RegisteSuccessState ||
          current is RegisterErrorState ||
          current is RegisterLoadingState,
      listener: (context, state) async {
        closeDialogs(context); // Ensure any open dialogs are closed first
        if (state is RegisteSuccessState) {
          await FireStoreHelper.addUser(
            userId: state.usercredential.user!.uid,
            email: emailController.text,
            firstName: firstNameController.text,
            lastName: lastNameController.text,
            
          );

          authProvider.setUsers(
            state.usercredential.user,
            UserModel(
              email: emailController.text,
              userid: state.usercredential.user!.uid,
              firstName: firstNameController.text,
              lastName: lastNameController.text,
            ),
          );
          authProvider.retrieveDatabaseUserData();

          Future.delayed(
            const Duration(seconds: 1),
            () =>
                Navigator.pushReplacementNamed(context, Routes.loginRouteName),
          );
        } else if (state is RegisterErrorState) {
          showErrorDialog(context, state.errorMessage);
        } else if (state is RegisterLoadingState) {
          showLoadingDialog(context);
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Create New Account",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(height: 36),
                Text(
                  "Please fill in the form to continue",
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                const SizedBox(height: 73),
                CustomTextFiled(
                  hintText: 'First Name',
                  textController: firstNameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "This field can't be empty";
                    }
                    return null;
                  },
                  keyboard: TextInputType.name,
                ),
                const SizedBox(height: 59),
                CustomTextFiled(
                  hintText: 'Last Name',
                  textController: lastNameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "This field can't be empty";
                    }
                    return null;
                  },
                  keyboard: TextInputType.name,
                ),
                const SizedBox(height: 59),
                CustomTextFiled(
                  hintText: 'Email',
                  textController: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "This field can't be empty";
                    }
                    if (!RegExp(Constants.RegExValidateEmail).hasMatch(value)) {
                      return "Enter a valid Email";
                    }
                    return null;
                  },
                  keyboard: TextInputType.emailAddress,
                ),
                const SizedBox(height: 59),
                CustomTextFiled(
                  hintText: 'Password',
                  textController: passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "This field can't be empty";
                    }
                    if (value.length < 8) {
                      return "Password must be more than 8 characters";
                    }
                    return null;
                  },
                  obscureText: authProvider.isShowPasswordRegister,
                  suffixIcon: IconButton(
                    onPressed: () {
                      authProvider.changeIsShowPasswordRegister(
                          !authProvider.isShowPasswordRegister);
                    },
                    icon: Icon(
                      authProvider.isShowPasswordRegister
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.white,
                    ),
                  ),
                  keyboard: TextInputType.visiblePassword,
                ),
                const SizedBox(height: 89),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState?.validate() ?? false) {
                        RegisterViewModel regViewModel =
                            RegisterViewModel.get(context);
                        regViewModel.register(
                            emailController.text, passwordController.text);
                      } else {
                        showErrorDialog(
                            context, "Please fill in all fields correctly");
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        fixedSize: const Size(280, 49),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25))),
                    child: Text(
                      "Register",
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(
                              color: Colors.black, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don’t have an account?',
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(fontWeight: FontWeight.w400, fontSize: 18),
                    ),
                    const SizedBox(width: 5),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, Routes.loginRouteName, (route) => false);
                      },
                      child: Text(
                        "Login",
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(
                                fontWeight: FontWeight.w400, fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
