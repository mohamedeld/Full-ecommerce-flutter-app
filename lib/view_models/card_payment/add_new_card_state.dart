part of 'add_new_card_cubit.dart';

sealed class AddNewCardState {}

final class AddNewCardInitial extends AddNewCardState {}

final class AddNewCardLoading extends AddNewCardState {}

final class AddNewCardLoaded extends AddNewCardState {}

final class AddNewCardError extends AddNewCardState {
  final String message;
  AddNewCardError({required this.message});
}
