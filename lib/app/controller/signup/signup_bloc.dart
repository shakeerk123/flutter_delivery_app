import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_delivery_app/app/services/api_services.dart';
import 'package:meta/meta.dart';
part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
    on<SignUpButtonPressedEvent>(signUpButtonPressedEvent);
  }

  FutureOr<void> signUpButtonPressedEvent(
      SignUpButtonPressedEvent event, Emitter<SignupState> emit) async {
    try {
      bool success = await ApiServices()
          .signUpModel(event.name, event.email, event.password, event.mobile);

      if (success) {
        emit(SignUpSuccessState());
      } else {
        emit(SignUpErrorState("Signup failed. Check your credentials."));
      }
    } on Exception catch (e) {
      if (e is DioException) {
        if (e.response != null) {
          log(e.response!.statusCode.toString());
        }
      }
      emit(SignUpErrorState("An error occurred. Please try again later."));
    }
  }
}
