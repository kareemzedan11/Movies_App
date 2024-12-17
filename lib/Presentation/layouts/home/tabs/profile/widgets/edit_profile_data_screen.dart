import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/Presentation/layouts/home/tabs/profile/widgets/edit_profile_data_body.dart';
import 'package:movies_app/Presentation/layouts/provider/auth_provider.dart';
import 'package:movies_app/core/firebase/firestore_helper.dart';
import 'package:movies_app/data/models/firsbase_model/user_model.dart';
import 'package:provider/provider.dart';

class EditProfileDataScreen extends StatelessWidget {
  const EditProfileDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context);
    final TextEditingController editFirstNameController =
        TextEditingController();

    final TextEditingController editLastNameController =
        TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Edit Profile"),
        leading: IconButton(
          enableFeedback: false,
          onPressed: () async {
            await FireStoreHelper.editProfileName(
                user: UserModel(
                  email: authProvider.dataBaseUser?.email ?? "",
                  userid: authProvider.dataBaseUser?.userid ?? "",
                  firstName: authProvider.dataBaseUser!.firstName,
                  lastName: authProvider.dataBaseUser!.lastName,
                ),
                // ignore: use_build_context_synchronously
                context: context);
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(
            "assets/Icons/arrow_back.svg",
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
        ),
      ),
      body: EditProfileDataBody(
        editFirstNameController: editFirstNameController,
        editLastNameController: editLastNameController,
      ),
    );
  }
}
