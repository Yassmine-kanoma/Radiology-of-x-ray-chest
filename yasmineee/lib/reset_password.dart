import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:yassmineee/cubits/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:yassmineee/cubits/forgot_password_cubit/forgot_password_state.dart';
import 'package:yassmineee/cubits/login_cubit/login_cubit.dart';
import 'package:yassmineee/functions/show_snack_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context)
  {

    return BlocProvider(create: (context) => ForgotPasswordCubit(),

      child: BlocConsumer<ForgotPasswordCubit,ForgotPasswordState>(
        listener: (context, state) {
          if(state is ForgotPasswordSuccessState){
            showSuccessSnackBar(context: context, message: state.message);
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is ForgotPasswordLoadingState,
            color: Colors.white,
            opacity: 0.5,
            child: Scaffold(

              appBar: AppBar(
                backgroundColor: Colors.blue,
                title: const Text('Reset Password',
                    style: TextStyle(
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
                      key: ForgotPasswordCubit.get(context).formKey,
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
                            controller: ForgotPasswordCubit.get(context).emailController,
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


                          Container(
                            width: double.infinity,
                            color: Colors.deepOrange,

                          ),
                          ElevatedButton(


                            onPressed: () {
                              if (ForgotPasswordCubit.get(context).formKey.currentState!.validate()) {
                                ForgotPasswordCubit.get(context).resetPassword();
                              }
                            },

                            style: TextButton.styleFrom(
                                backgroundColor:Colors.blue
                            ),

                            child: const Text('Reset Password',
                                style: TextStyle(
                                    fontSize: 25.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold
                                )
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
