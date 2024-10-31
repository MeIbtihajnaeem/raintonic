import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:raintonic/commons/api_status.dart';
import 'package:raintonic/commons/message_snake.dart';
import 'package:raintonic/screens/home/cubit/city_cubit.dart';
import '../../route/auto_route.gr.dart';
import '../../styles.dart';
import 'widgets/cities_list_widget.dart';
import 'widgets/search_city_widget.dart';

@RoutePage(name: 'HomeRoute')
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<CityCubit>().loadCities();
    return SafeArea(
      child: BlocListener<CityCubit, CityState>(
        listenWhen: (pre, nxt) => pre.apiStatus != nxt.apiStatus,
        listener: (context, state) {
          if (state.apiStatus == APISTATUS.error) {
            Utils.showSnackBar(context, state.error);
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Weather Dashboard",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Colors.white,
              ),
            ),
            backgroundColor: Styles.primaryColor,
            elevation: 4.0,
            centerTitle: true,
            actions: [
              IconButton(
                icon: const Icon(Icons.star_border, color: Colors.yellow),
                onPressed: () {
                  AutoRouter.of(context).push(const FavoriteRoute());
                },
              ),
            ],
          ),
          body: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                SearchCityWidget(
                  callback: (text) {
                    context.read<CityCubit>().searchCity(text);
                  },
                ),
                BlocBuilder<CityCubit, CityState>(
                  buildWhen: (pre, nxt) => pre.apiStatus != nxt.apiStatus,
                  builder: (context, state) {
                    return CityListWidget(
                      cities: state.citySuggestions,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
