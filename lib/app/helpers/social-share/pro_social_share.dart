import 'dart:io';

import 'package:share_plus/share_plus.dart';

void proSocialShare({File? image, String text = '', String subject = ''}) {
  if (image != null) {
    Share.shareFiles(
      [image.path],
      text: text,
      subject: subject,
    );
  } else {
    Share.share(
      text,
      subject: subject,
    );
  }
}
