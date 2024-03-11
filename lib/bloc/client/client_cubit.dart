import 'package:flutter_bloc/flutter_bloc.dart';

part 'client_state.dart';

class ClientCubit extends Cubit<ClientState> {
  ClientCubit(super.initialState);

  changeLanguage({required String language}) {
    final newState = ClientState(
      language: language,
      darkMode: state.darkMode,
    );

    emit(newState);
  }

  changeDarkMode({required bool darkMode}) {
    final newState = ClientState(
      language: state.language,
      darkMode: darkMode,
    );
    emit(newState);
  }
}
