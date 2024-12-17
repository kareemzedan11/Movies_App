import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movies_app/Presentation/layouts/provider/auth_provider.dart';
import 'package:movies_app/core/firebase/firestore_helper.dart';
import 'package:movies_app/core/reusable%20components/custom_text_filed.dart';
import 'package:movies_app/data/models/firsbase_model/user_model.dart';
import 'package:provider/provider.dart';

class EditProfileDataBody extends StatefulWidget {
  const EditProfileDataBody(
      {super.key,
      required this.editFirstNameController,
      required this.editLastNameController});
  final TextEditingController? editFirstNameController;
  final TextEditingController? editLastNameController;
  @override
  State<EditProfileDataBody> createState() => _EditProfileDataBodyState();
}

class _EditProfileDataBodyState extends State<EditProfileDataBody> {
  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context);
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.1,
            ),
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                authProvider.dataBaseUser!.imageUrl == null
                    ? CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: MediaQuery.sizeOf(context).width * 0.15,
                        child: Icon(
                          Icons.person,
                          size: MediaQuery.sizeOf(context).width * 0.25,
                        ),
                      )
                    : CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: MediaQuery.sizeOf(context).width * 0.15,
                        backgroundImage:
                            NetworkImage(authProvider.dataBaseUser!.imageUrl!),
                      ),
                GestureDetector(
                  onTap: selectImage,
                  child: Icon(
                    Icons.add_a_photo_rounded,
                    color: Theme.of(context).colorScheme.primary,
                    size: MediaQuery.sizeOf(context).width * 0.08,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            CustomTextFiled(
                hintText: "Edit first name",
                keyboard: TextInputType.name,
                textController:
                    widget.editFirstNameController ?? TextEditingController()),
            const SizedBox(
              height: 30,
            ),
            CustomTextFiled(
                hintText: "Edit Last name",
                keyboard: TextInputType.name,
                textController:
                    widget.editLastNameController ?? TextEditingController()),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: OutlinedButton(
                onPressed: editProfileName,
                style: OutlinedButton.styleFrom(
                  fixedSize: const Size(280, 49),
                  side: BorderSide(
                      color: Theme.of(context).colorScheme.primary, width: 2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: Text(
                  "Save",
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            const SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }

  void selectImage() async {
    var authProvider = Provider.of<AuthProvider>(context, listen: false);

    Uint8List? img = await pickImage(ImageSource.gallery);
    await FireStoreHelper.editProfile(
        user: UserModel(
          email: authProvider.dataBaseUser?.email ?? "",
          userid: authProvider.dataBaseUser?.userid ?? "",
          firstName: authProvider.dataBaseUser?.firstName ?? "",
          lastName: authProvider.dataBaseUser?.lastName ?? "",
        ),
        file: img!,
        // ignore: use_build_context_synchronously
        context: context);
  }

  void editProfileName() async {
    var authProvider = Provider.of<AuthProvider>(context, listen: false);
    if (widget.editFirstNameController?.text != "" ||
        widget.editLastNameController?.text != "") {
      await FireStoreHelper.editProfileName(
          user: UserModel(
            email: authProvider.dataBaseUser?.email ?? "",
            userid: authProvider.dataBaseUser?.userid ?? "",
            firstName: widget.editFirstNameController?.text ??
                authProvider.dataBaseUser!.firstName,
            lastName: widget.editLastNameController?.text ??
                authProvider.dataBaseUser!.lastName,
          ),
          // ignore: use_build_context_synchronously
          context: context);
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    }
  }

  pickImage(ImageSource source) async {
    final ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: source);

    if (file != null) {
      return await file.readAsBytes();
    } else {
      log("no image selected");
    }
  }
}
