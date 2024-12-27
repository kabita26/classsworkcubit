
import 'package:bloc_test/cubit/area_cubit.dart';
import 'package:bloc_test/cubit/simple_interest_cubit.dart';
import 'package:bloc_test/view/area_view.dart';
import 'package:bloc_test/view/simple_interest_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardCubit extends Cubit<void> {
  DashboardCubit(
    this. _interestCubit,
    this._areaCubit,
  ) : super(null);

  final InterestCubit _interestCubit;
  final AreaCubit _areaCubit;

  void openAreaView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: _areaCubit,
          child: AreaView(),
        ),
      ),
    );
  }

  

  void openSimpleInterestView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: _interestCubit,
          child: InterestView(),
        ),
      ),
    );
  }
}
