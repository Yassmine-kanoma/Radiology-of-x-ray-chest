import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:yassmineee/cubits/register_cubit/register_cubit.dart';
import 'package:yassmineee/cubits/register_cubit/register_state.dart';
import 'package:yassmineee/functions/show_snack_bar.dart';
import 'package:yassmineee/home_layout.dart';
import 'package:yassmineee/local/cache_helper.dart';
import 'package:yassmineee/utils/app_constants.dart';
import 'loginScreen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});




  @override
  Widget build(BuildContext context)
  {
   return BlocProvider(
     create: (context) => RegisterCubit(),
     child: BlocConsumer<RegisterCubit,RegisterState>(
       listener: (context, state) {
         if (state is RegisterFailureState) {
           showErrorSnackBar(context: context, message: state.error);
         } else if (state is RegisterSuccessState) {
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
           inAsyncCall: state is RegisterLoadingState,
           color: Colors.white,
           opacity: 0.5,
           child: Scaffold(
             appBar:AppBar(
               backgroundColor: Colors.blue,
               title: Text(AppLocalizations.of(context)!.signup,
                   style: const TextStyle(
                       fontSize: 35.0,
                       color: Colors.white,
                       fontWeight: FontWeight.bold
                   )
                 // GoogleFonts.dancingScript(
                 //
                 //     fontSize: 35.0,
                 //     color: Colors.white,
                 //     fontWeight: FontWeight.bold
                 // ),

               ), centerTitle: true,


             ),


             body:Padding(

                 padding: const EdgeInsets.all(20.0),

                 child: Center(


                     child: Form(
                       key: RegisterCubit.get(context).formKey,


                       child: SingleChildScrollView(

                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.center,
                           children: <Widget>[

                             const SingleChildScrollView(
                               scrollDirection: Axis.horizontal,
                             ),
                             const CircleAvatar(

                               radius: 80,
                               backgroundImage: AssetImage('assets/images/logo1.jpeg'),


                             ),

                             // Text(
                             //  'sign up ',
                             //  style: TextStyle(
                             //   fontSize: 40.0,
                             // fontWeight: FontWeight.bold,
                             //),
                             // ),
                             const SizedBox(
                               height: 10.0,
                             ),


                             TextFormField(
                               controller: RegisterCubit.get(context).firstNameController,
                               keyboardType: TextInputType.text,

                               validator: (value) {
                                 if (value!.isEmpty) {
                                   return AppLocalizations.of(context)!.tfmbe;
                                 }
                                 return null;
                               },


                               decoration:InputDecoration(
                                 labelText: AppLocalizations.of(context)!.firstName,
                                 prefixIcon: const Icon(
                                     Icons.person
                                 ),
                                 enabledBorder: OutlineInputBorder
                                   (
                                   borderRadius: BorderRadius.circular(20),
                                   borderSide: const BorderSide(
                                     color: Colors.black26,
                                     width:1.0,
                                   ),
                                 ),

                               ) ,
                             ),

                             const SizedBox(
                               height: 15.0,
                             ),


                             TextFormField(
                               controller: RegisterCubit.get(context).lastNameController,
                               validator: (value) {
                                 if (value!.isEmpty) {
                                   return AppLocalizations.of(context)!.tfmbe;
                                 }
                                 return null;
                               },

                               keyboardType: TextInputType.text,

                               decoration:InputDecoration(
                                 labelText: AppLocalizations.of(context)!.lastName,
                                 prefixIcon: const Icon(
                                     Icons.person
                                 ),
                                 enabledBorder: OutlineInputBorder
                                   (
                                   borderRadius: BorderRadius.circular(20),
                                   borderSide: const BorderSide(
                                     color: Colors.black26,
                                     width:1.0,
                                   ),
                                 ),
                               ) ,
                             ),

                             const SizedBox(
                               height: 15.0,
                             ),


                             TextFormField(
                               controller: RegisterCubit.get(context).emailController,
                               keyboardType: TextInputType.emailAddress,

                               validator: (value) {
                                 if (value!.isEmpty) {
                                   return AppLocalizations.of(context)!.tfmbe;
                                 }
                                 return null;
                               },





                               decoration:InputDecoration(
                                 labelText: AppLocalizations.of(context)!.emailAddress,
                                 prefixIcon: const Icon(
                                     Icons.email
                                 ),
                                 enabledBorder: OutlineInputBorder
                                   (
                                   borderRadius: BorderRadius.circular(20),
                                   borderSide: const BorderSide(
                                     color: Colors.black26,
                                     width:1.0,
                                   ),
                                 ),
                               ) ,
                             ),


                             const SizedBox(
                               height: 15.0,
                             ),
  TextFormField(
                               controller: RegisterCubit.get(context).addressNameController,
                               keyboardType: TextInputType.emailAddress,

                               validator: (value) {
                                 if (value!.isEmpty) {
                                   return AppLocalizations.of(context)!.tfmbe;
                                 }
                                 return null;
                               },
                               decoration:InputDecoration(
                                 labelText: 'Address',
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
                               ) ,
                             ),


                             const SizedBox(
                               height: 15.0,
                             ),


                             TextFormField(
                               controller: RegisterCubit.get(context).passwordController,
                               keyboardType: TextInputType.visiblePassword,
                               obscureText: RegisterCubit.get(context).isShowPassword,
                               validator: (value) {
                                 if (value!.isEmpty) {
                                   return AppLocalizations.of(context)!.tfmbe;
                                 }
                                 return null;
                               },
                               decoration:InputDecoration(
                                 labelText: AppLocalizations.of(context)!.password,
                                 prefixIcon: const Icon(
                                     Icons.lock
                                 ),
                                 suffixIcon: InkWell(
                                   onTap: () {
                                     RegisterCubit.get(context)
                                         .changePasswordVisibility();
                                   },
                                   child: Icon(
                                     RegisterCubit.get(context).isShowPassword
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
                               ) ,
                             ),


                             const SizedBox(
                               height: 10.0,
                             ),
            TextFormField(
              keyboardType: TextInputType.number,
                               controller: RegisterCubit.get(context).phoneNameController,
                               validator: (value) {
                                 if (value!.isEmpty) {
                                   return AppLocalizations.of(context)!.tfmbe;
                                 }else if(value.length<11){
                                   return 'The number is incomplete';
                                 }
                                 return null;
                               },
              maxLength: 11,
                               decoration:InputDecoration(
                                 labelText: 'Phone',
                                 prefixIcon: const Icon(
                                     Icons.phone
                                 ),

                                 enabledBorder: OutlineInputBorder
                                   (
                                   borderRadius: BorderRadius.circular(20),
                                   borderSide: const BorderSide(
                                     color: Colors.black26,
                                     width:1.0,
                                   ),
                                 ),
                               ) ,
                             ),


                             const SizedBox(
                               height: 10.0,
                             ),


                             Container(
                               // width: double.infinity,
                               color: Colors.deepOrange,

                             ),
                             //child:
                             ElevatedButton(

                               onPressed:  ()
                               {
                                 if (RegisterCubit.get(context).formKey.currentState!.validate()) {
                                   RegisterCubit.get(context).registerWithEmailAndPassword();

                                 }
                               },
                               style: TextButton.styleFrom(
                                   backgroundColor:Colors.blue
                               ),





                               child: Text(
                                   AppLocalizations.of(context)!.signup,
                                   style: const TextStyle(
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

                               //shape:OutlineInputBorder(
                               //  borderRadius: BorderRadius.circular(40),
                               // borderSide: BorderSide(color: Colors.black26, width:1.0,
                               //   ),
                               //    ),

                               // );





                               //    SizedBox(
                               //    height: 14,
                             ),



                             Row(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 Text(
                                     AppLocalizations.of(context)!.aha,

                                     style: const TextStyle(
                                       fontSize: 20.0,
                                     )
                                   // GoogleFonts.dancingScript(
                                   //
                                   //     fontSize: 20.0,
                                   //    // color: Colors.blue,
                                   //    // fontWeight: FontWeight.bold
                                   // ),
                                 ),
                                 TextButton(


                                     onPressed: (){

                                       Navigator.pop(context);

                                     },
                                     child:Text(
                                         AppLocalizations.of(context)!.login,
                                         style:const TextStyle( fontSize: 20.0,
                                             color: Colors.blue,
                                             fontWeight: FontWeight.bold
                                         )
                                       // GoogleFonts.dancingScript(
                                       //
                                       //   fontSize: 20.0,
                                       //   color: Colors.blue,
                                       //   fontWeight: FontWeight.bold
                                       // ),
                                     )
                                 ),
                               ],
                             ),








                           ],
                         ),
                       ),
                     )
                 )
             ),
           ),
         );
       },
     ),
   );
  }
}
