import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yassmineee/cubits/posts_cubit/posts_state.dart';

class PostsCubit extends Cubit<PostsState>{
   PostsCubit():super(PostsInitialState());

   static PostsCubit get(BuildContext context)=>BlocProvider.of(context);

   var formKey = GlobalKey<FormState>();

   final FirebaseFirestore firebaseFirestore =FirebaseFirestore.instance;

   final TextEditingController contentController = TextEditingController();

   Future<void> addPost({required String name,uid,phone})async {
     emit(AddPostsLoadingState());
     try{
       await firebaseFirestore.collection('Posts').doc().set({
         'uid':uid,
         'name':name,
         'phone':phone,
         'content':contentController.text,
       });
       emit(const AddPostsSuccessState('The post has been successfully added'));
     }on FirebaseException catch(error){
       emit(AddPostsFailureState(error.message.toString()));
     }catch (error){
       emit(AddPostsFailureState(error.toString()));
     }
   }

}