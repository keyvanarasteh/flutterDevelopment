part of '../client/client_cubit.dart';

class ClientState {
  final String language;
  final bool darkMode;
  final bool rtl;

  ClientState(
      {required this.language, required this.darkMode, required this.rtl});
}
