import 'dart:ui';

class MailModel {
  MailModel(
      {required this.name,
      required this.email,
      required this.subject,
      required this.overview,
      required this.fullMail,
      required this.profileColors});
  String name, email, subject, overview, fullMail;
  Color profileColors;
}
