import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/storage.dart';

part 'client_state.dart';

class ClientCubit extends Cubit<ClientState> {
  ClientCubit({String language = "en", bool darkMode = false, bool rtl = false})
      : super(ClientState(language: language, darkMode: darkMode, rtl: rtl));

  setLanguage(String language) async {
    bool rtl = false;

    if (language == "fa" || language == "ar") {
      rtl = true;
    }

    final newState = ClientState(
      darkMode: state.darkMode,
      language: language,
      rtl: rtl,
    );

    emit(newState);

    final storage = Storage();
    await storage.setSettings(language: language);
  }

  setThemeMode(bool darkMode) async {
    final newState = ClientState(
      darkMode: darkMode,
      language: state.language,
      rtl: state.rtl,
    );

    emit(newState);

    final storage = Storage();
    await storage.setSettings(darkMode: darkMode);
  }
}
