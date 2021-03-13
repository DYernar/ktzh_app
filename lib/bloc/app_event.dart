import 'package:equatable/equatable.dart';

abstract class AppEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchProductsEvent extends AppEvent {}

class SearchProductEvent extends AppEvent {
  final String hint;

  SearchProductEvent(this.hint);
}
