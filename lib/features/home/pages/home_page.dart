// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:sport_app/core/constants/app_colors.dart';
import 'package:sport_app/core/constants/app_dimentions.dart';
import 'package:sport_app/core/di/di_config.dart';
import 'package:sport_app/features/home/bloc/home_bloc.dart';
import 'package:sport_app/features/home/bloc/home_event.dart';
import 'package:sport_app/features/home/widgets/background_widget.dart';
import 'package:sport_app/features/home/widgets/tab_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   final HomeBloc homeBloc = getIt<HomeBloc>();
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    homeBloc.loadInitialData();
  }

  void onTabSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
    homeBloc.add(SwitchTab(index));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        child: Stack(
            children: [
              // This container is used to fill the screen height
              Container(
                height: MediaQuery.of(context).size.height
                ,
              ),
            Positioned(
              top:0,
              bottom: 0,
              right: -100,
              child: BackgroundWidget()
            ),
            Positioned(
              top: 20,
              right: 0,
              left: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppDimentions.padding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                  TabButton(title: 'Today', selectedIndex: selectedIndex, index: 0, onPressed: (index) {
                    onTabSelected(index);
                  }),
                  TabButton(title: 'Upcoming', selectedIndex: selectedIndex, index: 1, onPressed: (index) {
                    onTabSelected(index);
                  }),
                  TabButton(title: 'Past', selectedIndex: selectedIndex, index: 2, onPressed: (index) {
                    onTabSelected(index);
                  }),
                  ],
                ),
              ),
            )
            
            ],
        ),
      ),
    );
  }
}
