import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:yassmineee/functions/launch_chat.dart';
import 'package:yassmineee/utils/add_posts_bottom_sheet.dart';

import 'functions/show_snack_bar.dart';



class postssPage extends StatefulWidget {


  @override
  State<postssPage> createState() => _postssPageState();
}

class _postssPageState extends State<postssPage> {

 final Stream<QuerySnapshot> postsStream = FirebaseFirestore.instance.collection('Posts').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text('Posts'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(30),
             onTap: (){
               showModalBottomSheet(
                 context: context,
                 isScrollControlled: true,
                 useSafeArea: true,
                 builder: (context) {
                 return const AddPostsBottomSheet();
               },);
             },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.grey[300],
                ),
                padding: const EdgeInsets.all(3),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage('assets/images/user.jpeg'),
                    ),

                    const SizedBox(width: 15),
                    Text(AppLocalizations.of(context)!.whatInMind,
                        style: const TextStyle(
                            fontSize: 20.0,
                            // color: Colors.blue,
                            fontWeight: FontWeight.bold)
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10,),
            StreamBuilder(stream: postsStream, builder: (context, snapshot) {
              if(snapshot.hasError){
                return const Text('Eror');
              }
              if(snapshot.connectionState == ConnectionState.waiting){
                return const Expanded(child: Center(child: CircularProgressIndicator(),));
              }
              return Expanded(
                child: ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    return PostItem(post: snapshot.data!.docs[index]);
                  },
                ),
              );
            },),
          ],
        ),
      ),
    );
  }
}

class PostItem extends StatelessWidget {
  final QueryDocumentSnapshot post;

  const PostItem({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: Image.asset('assets/images/user.jpeg').image,
                  radius: 20,
                ),
                const SizedBox(width: 10),
                Text(post['name'],
                    style: const TextStyle(
                        fontSize: 20.0,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold)
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              post['content'],
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  launchChat(phoneNumber: post['phone']).then((value){}).catchError((error){
                    showErrorSnackBar(context: context, message: 'يوجد مشكلة في الرابط');
                  });
                },
                style: TextButton.styleFrom(
                    backgroundColor:Colors.blue
                ),
                child: const Text('Contact',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}