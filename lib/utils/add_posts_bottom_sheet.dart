import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:yassmineee/cubits/posts_cubit/posts_cubit.dart';
import 'package:yassmineee/cubits/posts_cubit/posts_state.dart';
import 'package:yassmineee/cubits/profile_cubit/profile_cubit.dart';

import '../functions/show_snack_bar.dart';

class AddPostsBottomSheet extends StatefulWidget {
  const AddPostsBottomSheet({super.key});

  @override
  State<AddPostsBottomSheet> createState() => _AddPostsBottomSheetState();
}

class _AddPostsBottomSheetState extends State<AddPostsBottomSheet> {
  @override
  void initState() {
    PostsCubit.get(context).contentController.clear();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    //print(ProfileCubit.get(context).userModel.phone);
    return BlocConsumer<PostsCubit,PostsState>(
      listener: (context, state) {
        if (state is AddPostsFailureState) {
          showErrorSnackBar(context: context, message: state.error);
        } else if (state is AddPostsSuccessState) {
          showSuccessSnackBar(
              context: context, message: state.message);
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is AddPostsLoadingState,
          color: Colors.white,
          opacity: 0.5,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Form(
              key: PostsCubit.get(context).formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text(
                      'Add New Post',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Content',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: PostsCubit.get(context).contentController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'this field must not be empty';
                      }
                      return null;
                    },
                    maxLines: 8,
                    decoration: InputDecoration(
                      hintText: 'Enter your content...',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                          width: 1.0,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Colors.black26,
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (PostsCubit.get(context).formKey.currentState!.validate()) {
                          PostsCubit.get(context).addPost(
                            name:
                            '${ProfileCubit.get(context).userModel.firstName} ${ProfileCubit.get(context).userModel.lastName}',
                            uid: ProfileCubit.get(context).userModel.uid,
                            phone: ProfileCubit.get(context).userModel.phone,
                          );
                        }
                      },
                      style: TextButton.styleFrom(backgroundColor: Colors.blue),
                      child: const Text('Add Post',
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
