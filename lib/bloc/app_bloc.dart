import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ktzh_app/bloc/app_event.dart';
import 'package:ktzh_app/bloc/app_state.dart';
import 'package:ktzh_app/model/product_model.dart';
import 'package:ktzh_app/resources/app_repository.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppRepository _appRepository = AppRepository();
  List<Product> myProducts = [];
  AppBloc(AppState initialState) : super(initialState);

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    if (event is FetchProductsEvent) {
      yield LoadingState();
      try {
        myProducts = await _appRepository.fetchProductList();
        yield FetchedProductsListState(myProducts);
      } catch (e) {
        yield ErrorState(e.toString());
      }
    }

    if (event is SearchProductEvent) {
      yield LoadingState();
      var products = myProducts.where((element) {
        return element.name.toLowerCase() == event.hint.toLowerCase() ||
            element.id.toLowerCase().contains(event.hint.toLowerCase());
      }).toList();

      yield FetchedProductsListState(products);
    }
  }
}
