part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

class DogState extends HomeState {
  late ApiModel data;
  DogState({required this.data});
}
