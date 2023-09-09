import 'package:coder_app/Page/mail_page.dart';
import 'package:flutter/material.dart';

import '../Model/mail_model.dart';

class MailCard extends StatelessWidget {
  final MailModel theMail;
  const MailCard({super.key, required this.theMail});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, const MyMailInfoPage().route,
          arguments: theMail),
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 12,
        child: Row(children: [
          CircleAvatar(
            backgroundColor: theMail.profileColors,
            child: Text(
              theMail.name[0],
              style: const TextStyle(color: Colors.black),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  theMail.name,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  theMail.overview,
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
