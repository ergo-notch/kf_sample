import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kf_sample/core/utils/app_colors.dart';
import 'package:kf_sample/home/presentation/bloc/home_events.dart';
import 'package:kf_sample/home/presentation/bloc/home_state.dart';
import 'package:kf_sample/home/presentation/ui/dog_tile_widget.dart';
import 'package:pixel_perfect/pixel_perfect.dart';

import 'bloc/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  static const String name = 'home';
  static const String path = '/';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      loadDogs();
    });
  }

  void loadDogs() {
    final bloc = context.read<HomeBloc>();
    bloc.add(const LoadDogsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (_, state) => SafeArea(
        child: Scaffold(
            backgroundColor: Colors.grey.shade200,
            body: CustomScrollView(
              slivers: [
                SliverAppBar(
                  centerTitle: true,
                  title: Text(
                    'Dogs We Love',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(color: AppColors.secondaryColor),
                  ),
                  backgroundColor: Colors.grey.shade200,
                ),
                SliverToBoxAdapter(
                    child: SizedBox(
                  height: 12,
                )),
                state.status == HomeStatus.error
                    ? SliverToBoxAdapter(
                        child: Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: Center(
                            child: Column(
                          children: [
                            Text(
                              'An error occurred: ${state.errorMessage ?? ''}',
                            ),
                            ElevatedButton(
                                onPressed: () => loadDogs(),
                                child: const Text('Retry'))
                          ],
                        )),
                      ))
                    : state.status == HomeStatus.loaded
                        ? SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (_, index) {
                                final dogEntity = state.dogs[index];
                                return DogTileWidget(dogEntity: dogEntity);
                              },
                              childCount: state.dogs.length,
                            ),
                          )
                        : const SliverToBoxAdapter(
                            child: Center(
                              child: SizedBox.shrink(),
                            ),
                          ),
              ],
            )),
      ),
    );
  }
}
