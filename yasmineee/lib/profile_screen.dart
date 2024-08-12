import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yassmineee/cubits/profile_cubit/profile_cubit.dart';
import 'package:yassmineee/cubits/profile_cubit/profile_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text('Profile'),
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is GetUserDataSuccessState) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    // child: Column(
                    //  children: [
                    const SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                    ),
                    const SizedBox(height: 40),
                    const CircleAvatar(
                      radius: 70,
                      backgroundImage: AssetImage('assets/images/user.jpeg'),
                    ),
                    const SizedBox(height: 20),
                    itemProfile(
                        AppLocalizations.of(context)!.name,
                        '${state.userModel.firstName} ${state.userModel.lastName}',
                        CupertinoIcons.person),
                    const SizedBox(height: 10),
                    itemProfile(AppLocalizations.of(context)!.phone,
                        state.userModel.phone, CupertinoIcons.phone),
                    const SizedBox(height: 10),
                    itemProfile(AppLocalizations.of(context)!.address,
                        state.userModel.address, CupertinoIcons.location),
                    const SizedBox(height: 10),
                    itemProfile(AppLocalizations.of(context)!.email,
                        state.userModel.email, CupertinoIcons.mail),
                  ],
                ),
              ),
            );
          } else if (state is GetUserDataFailureState) {
            return Center(
              child: Text(state.error),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  itemProfile(String title, String subtitle, IconData iconData) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 5),
              color: Colors.deepPurple.withOpacity(.2),
              spreadRadius: 2,
              blurRadius: 10)
        ],
      ),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(iconData),
        trailing: Icon(Icons.arrow_forward, color: Colors.grey.shade400),
        tileColor: Colors.white,
      ),
    );
  }
}