import 'package:url_launcher/url_launcher.dart';

Future launchUrlString(String urlString) async {
  if (!await launchUrl(
    Uri.parse(urlString),
    //mode: LaunchMode.externalApplication,
    mode: LaunchMode.inAppWebView,
  )) {
    throw 'Could not launch $urlString';
  }
}
