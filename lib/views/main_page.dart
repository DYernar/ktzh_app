import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ktzh_app/bloc/app_bloc.dart';
import 'package:ktzh_app/bloc/app_event.dart';
import 'package:ktzh_app/bloc/app_state.dart';
import 'package:ktzh_app/model/product_model.dart';
import 'package:ktzh_app/widgets/main_page_widgets.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  AppBloc _appBloc = AppBloc(LoadingState());
  String hint = "";

  @override
  void initState() {
    _appBloc.add(FetchProductsEvent());
    super.initState();
  }

  @override
  void dispose() {
    _appBloc.close();
    super.dispose();
  }

  void onSearch(String hintString) {
    _appBloc.add(SearchProductEvent(hintString));
  }

  void navigateToProduct(Product p) {
    FocusScope.of(context).requestFocus(new FocusNode());
    Navigator.pushNamed(context, '/product_page', arguments: [p]);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _appBloc,
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.white,
        body: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: ScreenUtil().setHeight(40.0)),
          child: Column(
            children: [
              SizedBox(height: ScreenUtil().setHeight(100.0)),
              searchBar(onSearch),
              SizedBox(height: ScreenUtil().setHeight(15.0)),
              BlocConsumer<AppBloc, AppState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is LoadingState) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (state is ErrorState) {
                    return Container(
                      height: ScreenUtil().setHeight(400.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              state.error,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    );
                  }

                  if (state is FetchedProductsListState) {
                    return state.products == null || state.products.length > 0
                        ? productList(state.products)
                        : noProduct();
                  }

                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget productList(List<Product> products) {
    return Expanded(
        child: SingleChildScrollView(
      child: Column(
        children: [
              SizedBox(height: ScreenUtil().setHeight(40.0)),
              Container(),
            ] +
            products
                .map((e) => GestureDetector(
                    onTap: () {
                      navigateToProduct(e);
                    },
                    child: productCard(e)))
                .toList(),
      ),
    ));
  }

  Widget noProduct() {
    return Container(
      height: ScreenUtil().setHeight(400.0),
      child: Center(
        child: Text("товаров нет"),
      ),
    );
  }
}
