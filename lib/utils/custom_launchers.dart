import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> openCall(String phoneNumber) async {
  final Uri callUri = Uri(scheme: 'tel', path: phoneNumber);
  if (await canLaunchUrl(callUri)) {
    await launchUrl(callUri);
  } else {
    debugPrint('Could not launch $callUri');
  }
}

Future<void> openWhatsApp(String phoneNumber) async {
  // Strip out any characters except digits and plus sign
  String formattedNumber = phoneNumber.replaceAll(RegExp(r'[^\d+]'), '');
  final Uri whatsappUri = Uri.parse('https://wa.me/$formattedNumber');
  
  if (await canLaunchUrl(whatsappUri)) {
    await launchUrl(whatsappUri, mode: LaunchMode.externalApplication);
  } else {
    debugPrint('Could not launch WhatsApp for $whatsappUri');
  }
}
