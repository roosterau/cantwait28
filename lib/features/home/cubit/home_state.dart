part of 'home_cubit.dart';

class HomeState {
  const HomeState({
    this.items = const [],
    this.loadingErrorOccured = false,
    this.removingErrorOccured = false,
  });

  final List<ItemsModels> items;
  final bool loadingErrorOccured;
  final bool removingErrorOccured;
}
