import 'store.dart';

enum AppAction { increment, decrement }

class AppState {
  final int value;

  AppState({this.value = 0});

  // In order to be curious: operator overwriting
  operator +(int newValue) {
    return AppState(value: value + newValue);
  }

  operator -(int newValue) {
    return AppState(value: value - newValue);
  }

  @override
  String toString() {
    return "$value";
  }
}

AppState _reducer(AppState state, AppAction action) {
  if (action == AppAction.increment) {
    // return AppState(value: state.value + 1);
    return state + 1;
  } else {
    // return AppState(value: state.value - 1);
    return state - 1;
  }
}

final appStore = Store<AppAction, AppState>(
  initialState: AppState(),
  reducer: _reducer,
);
