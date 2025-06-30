 import 'package:flutter/material.dart';
import 'package:sport_app/core/constants/app_colors.dart';
import 'package:sport_app/core/constants/app_dimentions.dart';
import 'package:sport_app/features/home/data/model/home_model.dart';
import 'package:sport_app/features/home/widgets/match_widget.dart';

class CompetitionWidget extends StatelessWidget {
  final CompetitionData competition;

   const CompetitionWidget({super.key, required this.competition});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin:const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Competition Header
          Container(
            padding: const EdgeInsets.all(12),
            decoration:const BoxDecoration(
              color: AppColors.darkGrey,
              borderRadius: BorderRadius.vertical(top: Radius.circular(AppDimentions.borderRadius)),
            ),
            child: Row(
              children: [
                if (competition.competition.logo != null)
                  ClipOval(
                    child: Image.network(
                      competition.competition.logo!,
                      width: 24,
                      height: 24,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => const Icon(Icons.sports_soccer),
                    ),
                  ),
               const SizedBox(width: 8),
                Text(
                  competition.competition.name,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.whiteCC,
                  ),
                ),
              ],
            ),
          ),
          // Matches List
          ...competition.matches.asMap().entries.map(
            (entry) => MatchWidget(
              match: entry.value,
              index: entry.key,
              length: competition.matches.length,
            ),
          ),],
      ),
    );
  }
}