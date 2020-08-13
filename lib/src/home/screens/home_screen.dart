import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gold_door/src/home/home.dart';
import 'package:gold_door/src/shared/loading_indicator.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: HomeTab.values.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (BuildContext context, HomeState homeState) {
        return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => HomeTabBloc(),
              ),
              BlocProvider<ItemsFilterBloc>(
                create: (context) => ItemsFilterBloc(
                  homeBloc: BlocProvider.of<HomeBloc>(context),
                ),
              )
            ],
            child: BlocBuilder<HomeTabBloc, HomeTab>(
                builder: (context, activeTab) {
              if (homeState is HomeLoaded) {
                return BlocBuilder<ItemsFilterBloc, ItemsFilterState>(
                  builder: (BuildContext context, ItemsFilterState state) {
                    if (state is ItemsFilterLoaded) {
                      return ItemTabs(
                        tabController: _tabController,
                        items: state.filteredItems,
                      );
                    }
                    return Text('No items');
                  },
                );
              }
              return Center(
                child: LoadingIndicator(),
              );
            }));
      },
    );
  }
}
