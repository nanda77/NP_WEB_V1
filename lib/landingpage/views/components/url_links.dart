import 'package:url_launcher/url_launcher.dart';

class StoreUrls {
  playStoreURL() async {
    const url =
        'https://play.google.com/store/apps/details?id=com.medinin.ninjapay';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  appStoreURL() async {
    const url =
        'https://apps.apple.com/in/app/ninjapay-manage-construction/id1547753533';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  mailURL() async {
    const url =
        'mailto:<support@medinin.com>?subject=New Ticket(from web)&body=';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
