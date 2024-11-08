import 'package:equatable/equatable.dart';

sealed class HomeState extends Equatable {
  const HomeState();
}

final class HomeStateInitial extends HomeState {
  const HomeStateInitial();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class HomeStateLoading extends HomeState {
  const HomeStateLoading();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class HomeStateLoaded extends HomeState {
  const HomeStateLoaded();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
