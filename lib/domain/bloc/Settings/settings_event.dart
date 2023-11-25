part of 'settings_bloc.dart';

@immutable
abstract class SettingsEvent {}

class GetOSVersion extends SettingsEvent {}
