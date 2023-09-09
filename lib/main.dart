import 'package:coder_app/Page/mail_page.dart';
import 'package:coder_app/Widget/mail_card.dart';
import 'package:coder_app/cubit/my_mail_app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Model/mail_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyMailAppCubit(),
      child: MaterialApp(
          theme: ThemeData.dark(),
          title: 'MyApp',
          initialRoute: const MyHomePage().route,
          routes: {
            const MyHomePage().route: (context) => const MyHomePage(),
            const MyMailInfoPage().route: (context) => const MyMailInfoPage()
          }),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String route = '/HomePage';
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    context.read<MyMailAppCubit>().loadData();
  }

  @override
  Widget build(BuildContext context) {
    var myCubit = context.read<MyMailAppCubit>();
    return Scaffold(
        appBar: AppBar(
          title: const Text('MyMail'),
        ),
        body: RefreshIndicator(
          onRefresh: () {
            return context.read<MyMailAppCubit>().loadData();
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: BlocBuilder<MyMailAppCubit, MyMailAppState>(
                builder: (context, state) {
                  if (state is OnApplicationStart) {
                    return const CircularProgressIndicator();
                  }
                  return ListView.separated(
                      itemCount: myCubit.myMails.length,
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 10,
                          child: Divider(),
                        );
                      },
                      itemBuilder: (context, index) {
                        MailModel theMail = myCubit.myMails[index];
                        return MailCard(theMail: theMail);
                        // ListTile(
                        //   shape: RoundedRectangleBorder(
                        //       borderRadius: BorderRadius.circular(8.0)),
                        //   onTap: () => Navigator.pushNamed(
                        //       context, const MyMailInfoPage().route,
                        //       arguments: theMail),
                        //   leading: CircleAvatar(
                        //     backgroundColor: theMail.profileColors,
                        //     child: Text(
                        //       theMail.name[0],
                        //       style: const TextStyle(color: Colors.black),
                        //     ),
                        //   ),
                        //   title: Text(theMail.subject),
                        //   subtitle: Text(
                        //     theMail.overview,
                        //     overflow: TextOverflow.fade,
                        //   ),
                        // );
                      });
                },
              ),
            ),
          ),
        ));
  }
}
