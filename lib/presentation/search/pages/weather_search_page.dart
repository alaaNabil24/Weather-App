import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_task/presentation/search/widgets/custom_button.dart';
import 'package:weather_task/presentation/search/widgets/custom_input.dart';

import '../cubit/search_cubit.dart';
import '../widgets/city_card.dart';

class WeatherSearchPage extends StatelessWidget {
  const WeatherSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: Scaffold(
        body: BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            var cubit = context.read<SearchCubit>();
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    CustomFormField(
                      controller: cubit.searchController,
                      hintText: "Search",
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    DefaultButton(
                      "Search",
                      textColor:  Colors.white,
                      color:  Colors.blue,
                      onTap: () {
                        if(cubit.searchController.text.isNotEmpty){
                          cubit.getSearchResults(cubit.searchController.text);
                        }

                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    state is SearchSuccess
                        ? Expanded(
                          child: RefreshIndicator(
                            onRefresh: () async {
                             if(cubit.searchController.text.isNotEmpty){
                               cubit.getSearchResults(cubit.searchController.text);
                             }
                            },
                            child: ListView.separated(
                            shrinkWrap: true,
                                physics: const AlwaysScrollableScrollPhysics(),
                                itemBuilder: (context, index) =>
                                    CityCardWidget(city: state.searchResults[index]),
                                separatorBuilder: (context, index) => const SizedBox(
                                      height: 16,
                                    ),
                                itemCount: state.searchResults.length),
                          ),
                        )
                        : state is SearchError
                            ? Center(child: Text(state.message , style: const TextStyle(color: Colors.red),))
                            : state is SearchLoading? const Center(child: CircularProgressIndicator()) :

                        const Center(child: Text("No Results Found"))
                    ,
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
