import 'dart:convert';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:coder_app/Model/mail_model.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

part 'my_mail_app_state.dart';

class MyMailAppCubit extends Cubit<MyMailAppState> {
  MyMailAppCubit() : super(MyMailAppInitial());

  List<MailModel> myMails = [];
  List<Color> profileColors = [
    const Color(0xffe8aeb7),
    const Color(0xffb8e1ff),
    const Color(0xffa9fff7),
    const Color(0xff94fbab),
    const Color(0xff82aba1),
  ];

  Future loadData() async {
    emit(OnApplicationStart());
    await Future.delayed(const Duration(seconds: 3));
    myMails = [];
    var data = await rootBundle.loadString('assets/JSON/MAILS.json');
    List jsonFiles = jsonDecode(data);
    for (var item in jsonFiles) {
      myMails.add(MailModel(
          name: item['name'],
          email: item['email'],
          subject: item['subject'],
          overview: item['overview'],
          fullMail: item['full_mail'],
          profileColors:
              profileColors[Random().nextInt(profileColors.length)]));
    }
    emit(OnDataLoaded());
  }
}
