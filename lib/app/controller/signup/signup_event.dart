// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'signup_bloc.dart';

@immutable
sealed class SignupEvent {}

// ignore: must_be_immutable
class SignUpButtonPressedEvent extends SignupEvent {
  BuildContext context;
  String name;
  String email;
  String password;
  String mobile;
  SignUpButtonPressedEvent({
    required this.context,
    required this.name,
    required this.email,
    required this.password,
    required this.mobile,
  });
}
