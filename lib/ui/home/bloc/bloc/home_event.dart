part of 'home_bloc.dart';

sealed class HomeEvent {}

// Disparar la lectura de la base de datos
class GetContactsEvent extends HomeEvent {}
