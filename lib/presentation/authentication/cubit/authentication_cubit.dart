import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/service/authentication_service.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationInitial());

  void signInWithGoogle() async {
    emit(AuthenticationLoading());
    try {
      await AuthenticationService.signInWithGoogle();
      emit(AuthenticationSuccess("Login Berhasil"));
      print("yey");
    } catch (e) {
      emit(AuthenticationError(e.toString()));
    }
  }
}
