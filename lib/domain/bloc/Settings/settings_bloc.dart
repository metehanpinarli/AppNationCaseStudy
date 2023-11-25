import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../manager/platform_info_manager.dart';

part 'settings_event.dart';

part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final PlatformInfoManager _platformInfoManager;

  SettingsBloc(this._platformInfoManager) : super(SettingsState(osVersion: '')) {
    on<GetOSVersion>(_onGetOSVersion);
    add(GetOSVersion());
  }

  FutureOr<void> _onGetOSVersion(event, emit) async {
    final osVersion = await _platformInfoManager.getOSVersion();
    state.osVersion = osVersion ?? '';
    emit(state);
  }
}
