import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/area_cubit.dart';
import 'cubit/simple_interest_cubit.dart';
import 'view/dashboard_view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AreaCubit()),
        BlocProvider(create: (context) => InterestCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Kabita',
        home: DashboardView(),
      ),
    );
  }
}
