import 'package:coder_app/Model/mail_model.dart';
import 'package:flutter/material.dart';

class MyMailInfoPage extends StatelessWidget {
  final String route = '/myMailInfoPage';
  const MyMailInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    MailModel theModel =
        ModalRoute.of(context)!.settings.arguments as MailModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(theModel.subject),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 16,
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 32.0, vertical: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: theModel.profileColors,
                          radius: 24.0,
                          child: Text(
                            theModel.name[0],
                            style: const TextStyle(
                                fontSize: 24.0, color: Colors.black),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              theModel.name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Text(theModel.email),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                      child: Divider(),
                    ),
                    Text(theModel.fullMail)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
