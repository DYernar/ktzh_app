import 'package:equatable/equatable.dart';
import 'package:ktzh_app/model/product_model.dart';

abstract class AppState extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadingState extends AppState {}

class ErrorState extends AppState {
  final String error;

  ErrorState(this.error);
}

class FetchedProductsListState extends AppState {
  final List<Product> products;

  FetchedProductsListState(this.products);
}
