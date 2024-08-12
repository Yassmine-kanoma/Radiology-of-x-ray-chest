import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:yassmineee/cubits/login_cubit/login_cubit.dart';
import 'package:yassmineee/cubits/login_cubit/login_state.dart';
import 'package:yassmineee/home_layout.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:yassmineee/local/cache_helper.dart';
import 'package:yassmineee/reset_password.dart';
import 'package:yassmineee/utils/app_constants.dart';

import 'functions/show_snack_bar.dart';
import 'sign_up screen.dart';

class looginScreen extends StatelessWidget {



  void main() {
    runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
    ));
  }



  @override
  Widget build(BuildContext context)
  {

    return BlocProvider(create: (context) => LoginCubit(),

      child: BlocConsumer<LoginCubit,LoginState>(
        listener: (context, state) {
          if (state is LoginFailureState) {
            showErrorSnackBar(context: context, message: state.error);
          } else if (state is LoginSuccessState) {
            CacheHelper.setString(key: 'userId', value: state.user.uid);
            AppConstants.userId = state.user.uid;
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
              return HomeLayout();
            },), (route) => false);
            showSuccessSnackBar(
                context: context, message: 'logged in successfully');
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is LoginLoadingState,
            color: Colors.white,
            opacity: 0.5,
            child: Scaffold(

              appBar: AppBar(
                backgroundColor: Colors.blue,
                title: Text(AppLocalizations.of(context)!.login,


                    style: const TextStyle(
                        fontSize: 35.0,
                        //color: Colors.blue,
                        fontWeight: FontWeight.bold
                    )
                  // GoogleFonts.dancingScript(
                  //
                  //     fontSize: 35.0,
                  //     //color: Colors.blue,
                  //     fontWeight: FontWeight.bold
                  // ),

                ), centerTitle: true,

              ),

              body: SingleChildScrollView(

                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Center(
                    child: Form(
                      key: LoginCubit.get(context).formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                          ),
                          const CircleAvatar(
                            radius: 80,
                            backgroundImage: AssetImage('assets/images/logo1.jpeg'),


                          ),

                          //  Image.asset('assets/images/logo5.jpeg',
                          // width:350,
                          //  height: 350,

                          // Text(
                          // 'LOGIN',
                          //style: TextStyle(
                          //  fontSize:17 ,
                          // fontWeight: FontWeight.bold,
                          // ),
                          //),



                          const SizedBox(
                            height: 50,
                          ),

                          TextFormField(
                            controller: LoginCubit.get(context).emailController,
                            keyboardType: TextInputType.emailAddress,

                            validator: (value) {
                              if (value!.isEmpty) {
                                return AppLocalizations.of(context)!.tfmbe;
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: AppLocalizations.of(context)!.emailAddress,
                              prefixIcon: const Icon(
                                Icons.email,
                              ),
                              enabledBorder: OutlineInputBorder
                                (
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                  color: Colors.black26,
                                  width:1.0,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(
                            height: 14,
                          ),

                          TextFormField(
                            controller: LoginCubit.get(context).passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: LoginCubit.get(context).isShowPassword,

                            validator: (value) {
                              if (value!.isEmpty) {
                                return AppLocalizations.of(context)!.tfmbe;
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: AppLocalizations.of(context)!.password,
                              prefixIcon: const Icon(
                                Icons.lock,
                              ),


                              suffixIcon: InkWell(
                                onTap: () {
                                  LoginCubit.get(context)
                                      .changePasswordVisibility();
                                },
                                child: Icon(
                                  LoginCubit.get(context).isShowPassword
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                              ),

                              enabledBorder: OutlineInputBorder
                                (
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                  color: Colors.black26,
                                  width:1.0,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(
                            height: 14,
                          ),


                          Container(
                            width: double.infinity,
                            color: Colors.deepOrange,

                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (LoginCubit.get(context)
                                  .formKey
                                  .currentState!
                                  .validate()) {
                                LoginCubit.get(context)
                                    .loginWithEmailAndPassword();
                              }
                            },

                            style: TextButton.styleFrom(
                                backgroundColor: Colors.blue),

                            child: Text(AppLocalizations.of(context)!.login,
                                style: const TextStyle(
                                    fontSize: 25.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)
                                // GoogleFonts.dancingScript(
                                //
                                //     fontSize: 25.0,
                                //     color: Colors.white,
                                //     fontWeight: FontWeight.bold
                                // ),

                                ),
                            //  style: TextButton.styleFrom(
                            //    backgroundColor:Colors.blue
                          ),
                          // ),




                          const SizedBox(
                            height: 14,
                          ),


                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const ResetPassword(),));
                            },
                            child: Text(
                                AppLocalizations.of(context)!.forgetPass,

                                style: const TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold
                                )
                              // GoogleFonts.dancingScript(
                              //
                              //     fontSize: 20.0,
                              //     color: Colors.blue,
                              //     fontWeight: FontWeight.bold
                              // ),

                            ),
                          ) ,




                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(AppLocalizations.of(context)!.dha,
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                  )
                                // GoogleFonts.dancingScript(
                                //
                                //     fontSize: 20.0,
                                //     //color: Colors.blue,
                                //    // fontWeight: FontWeight.bold
                                // ),
                              ),
                              TextButton(
                                onPressed: () {

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>const RegisterScreen ()),
                                  );

                                },
                                child: Text(AppLocalizations.of(context)!.register,
                                    style: const TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold
                                    )
                                  // GoogleFonts.dancingScript(
                                  //
                                  //     fontSize: 20.0,
                                  //     color: Colors.blue,
                                  //     fontWeight: FontWeight.bold
                                  // ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
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