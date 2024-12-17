import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/Presentation/layouts/auth/dialogs.dart';
import 'package:movies_app/Presentation/layouts/auth/login/login_Viewmodel/login_view_model.dart';
import 'package:movies_app/Presentation/layouts/provider/auth_provider.dart';
import 'package:movies_app/core/Utils/routes.dart';
import 'package:movies_app/core/constants.dart';
import 'package:movies_app/core/firebase/firestore_helper.dart';
import 'package:movies_app/core/reusable%20components/custom_text_filed.dart';
import 'package:movies_app/data/models/firsbase_model/user_model.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
    AuthProvider provider = Provider.of<AuthProvider>(context);
    return BlocListener<LoginViewModel, LoginState>(
      listenWhen: (previous, current) =>
          current is LoginSuccessState ||
          current is LoginErrorState ||
          current is LoginLoadingState,
      listener: (context, state) async {
        closeDialogs(context); // Ensure any open dialogs are closed first
        if (state is LoginSuccessState) {
          UserModel? user = await FireStoreHelper.getUser(
              userId: state.usercredential.user!.uid);
          provider.setUsers(state.usercredential.user, user);

          provider.retrieveDatabaseUserData();

          Future.delayed(
            const Duration(seconds: 1),
            () => Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.homeRouteName,
              (route) => false,
            ),
          );
        } else if (state is LoginErrorState) {
          Dialogs.showErrorDialog(context, state.errorMessage);
        } else if (state is LoginLoadingState) {
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
                  "Welcome Back",
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                const SizedBox(height: 22),
                Text(
                  "Enjoy your watch",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(height: 104),
                CustomTextFiled(
                  hintText: 'Email',
                  textController: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "This field can't be empty";
                    }
                    if (!RegExp(Constants.RegExValidateEmail).hasMatch(value)) {
                      return "Enter valid Email";
                    }
                    return null;
                  },
                  keyboard: TextInputType.emailAddress,
                ),
                const SizedBox(height: 100),
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
                  obscureText: provider.isShowPasswordLogin,
                  suffixIcon: IconButton(
                    onPressed: () {
                      provider.changeIsShowPassworLogin(
                          !provider.isShowPasswordLogin);
                    },
                    icon: Icon(
                      provider.isShowPasswordLogin
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.white,
                    ),
                  ),
                  keyboard: TextInputType.text,
                ),
                const SizedBox(height: 158),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState?.validate() ?? false) {
                        LoginViewModel login = LoginViewModel.get(context);
                        login.login(emailController.text,
                            passwordController.text, context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        fixedSize: const Size(280, 49),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25))),
                    child: Text(
                      "Login With Email",
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(
                              color: Colors.black54,
                              fontWeight: FontWeight.w700,
                              fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: ElevatedButton(
                      onPressed: () {
                        LoginViewModel login = LoginViewModel.get(context);

                        login.loginWithGoogle(context: context);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange[800],
                          fixedSize: const Size(280, 49),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25))),
                      child: Row(
                        children: [
                          SvgPicture.asset("assets/Icons/google_icon.svg"),
                          const Text(
                            "Login with google email",
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w700,
                                fontSize: 16),
                          )
                        ],
                      )),
                ),
                // IntrinsicHeight(
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       GestureDetector(
                //         onTap: () {
                //           LoginViewModel login = LoginViewModel.get(context);

                //           login.loginWithGoogle(context: context);
                //         },
                //         child: Container(
                //           height: MediaQuery.sizeOf(context).height * 0.1,
                //           width: MediaQuery.sizeOf(context).width * 0.2,
                //           decoration: BoxDecoration(
                //             color: Theme.of(context).colorScheme.secondary,
                //             borderRadius: BorderRadius.circular(15),
                //           ),
                //           child: Center(
                //               child: ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                const SizedBox(height: 20),
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
                    const SizedBox(
                      width: 5,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(context,
                            Routes.registerRouteName, (route) => false);
                      },
                      child: Text(
                        "Register",
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(
                                fontWeight: FontWeight.w400, fontSize: 18),
                      ),
                    )
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
