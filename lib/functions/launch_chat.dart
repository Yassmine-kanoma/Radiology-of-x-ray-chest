import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';


Future<void> launchChat({required String phoneNumber}) async {
  final Uri uri = Uri.parse('https://wa.me/+20$phoneNumber');
    await launchUrl(uri, mode: LaunchMode.externalApplication);
}