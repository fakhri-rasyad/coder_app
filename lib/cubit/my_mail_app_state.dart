part of 'my_mail_app_cubit.dart';

@immutable
sealed class MyMailAppState {}

final class MyMailAppInitial extends MyMailAppState {}

class OnApplicationStart extends MyMailAppState {}

class OnDataLoaded extends MyMailAppState {}
