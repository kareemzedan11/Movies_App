import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/Presentation/layouts/home/tabs/profile/widgets/edit_profile_data_screen.dart';
import 'package:movies_app/Presentation/layouts/provider/auth_provider.dart';
import 'package:movies_app/Presentation/layouts/provider/home_provider.dart';
import 'package:movies_app/core/Utils/routes.dart';
import 'package:provider/provider.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var authProvider = Provider.of<AuthProvider>(context);
    HomeProvider provider = Provider.of<HomeProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          SizedBox(
            height: height * 0.05,
          ),
          Container(
            width: double.infinity,
            height: height * 0.1,
            decoration: ShapeDecoration(
              color: Theme.of(context).colorScheme.secondary,
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1, color: Color(0xFF252836)),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  authProvider.dataBaseUser!.imageUrl == null
                      ? CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: MediaQuery.sizeOf(context).width * 0.07,
                          child: Icon(
                            Icons.person,
                            size: MediaQuery.sizeOf(context).width * 0.09,
                          ),
                        )
                      : CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: MediaQuery.sizeOf(context).width * 0.07,
                          backgroundImage: NetworkImage(
                              authProvider.dataBaseUser!.imageUrl!),
                        ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${authProvider.dataBaseUser?.firstName ?? ""} ${authProvider.dataBaseUser?.lastName ?? ""}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                          height: 0,
                          letterSpacing: 0.12,
                        ),
                      ),
                      Text(
                        authProvider.dataBaseUser?.email ?? "",
                        style: const TextStyle(
                          color: Color(0xFFB1B1B1),
                          fontSize: 14,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                          height: 0,
                          letterSpacing: -0.28,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EditProfileDataScreen(),
                          ),
                        );
                      },
                      child: SvgPicture.asset("assets/Icons/Edit.svg")),
                ],
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: OutlinedButton(
              onPressed: () async {
                await authProvider.signOut();
                provider.changeHomeTapIndex(0);
                Navigator.pushNamedAndRemoveUntil(
                  // ignore: use_build_context_synchronously
                  context,
                  Routes.loginRouteName,
                  (route) => false,
                );
              },
              style: OutlinedButton.styleFrom(
                fixedSize: const Size(280, 49),
                side: BorderSide(
                    color: Theme.of(context).colorScheme.primary, width: 2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: Text(
                "Log Out",
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.2,
          )
        ],
      ),
    );
  }
}
