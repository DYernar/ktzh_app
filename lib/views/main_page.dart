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

  void onEdit(String hintString) {
    hint = hintString;
    setState(() {});
  }

  void onSearch() {
    _appBloc.add(SearchProductEvent(hint));
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
              searchBar(onEdit, onSearch),
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
                    return Center(child: Text(state.error));
                  }

                  if (state is FetchedProductsListState) {
                    return state.products.length > 0
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
<<<<<<< HEAD
          child: Column(
            children: [
                  SizedBox(height: ScreenUtil().setHeight(40.0)),
                  Container(),
                ] +
                [1, 2, 3, 4, 5].map((e) => productCard()).toList(),
          ),
=======
      child: Column(
        children: [
              SizedBox(height: ScreenUtil().setHeight(40.0)),
              Container(),
            ] +
            products.map((e) => productCard(e)).toList(),
      ),
>>>>>>> d3a22d0918ff3cb9589c0ac69dd4abbf05295b1e
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
