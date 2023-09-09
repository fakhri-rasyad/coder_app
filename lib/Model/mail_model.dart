import 'dart:ui';

class MailModel {
  MailModel(
      {required this.name,
      required this.email,
      required this.subject,
      required this.day,
      required this.month,
      required this.overview,
      required this.fullMail,
      required this.profileColors});
  String name, email, subject, month, overview, fullMail;
  int day;
  Color profileColors;
}
