import 'package:flutter/material.dart';
import 'package:sport_app/core/constants/app_colors.dart';
import 'package:sport_app/core/constants/app_dimentions.dart';
import 'package:sport_app/features/home/data/model/home_model.dart';

class MatchWidget extends StatelessWidget {
  final Match match;
  final int index;
  final int length;

  const MatchWidget(
      {super.key,
      required this.match,
      required this.index,
      required this.length});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.black,
        borderRadius: index == length - 1
            ? const BorderRadius.vertical(
                bottom: Radius.circular(AppDimentions.borderRadius),
              )
            : null,
      ),
      padding: const EdgeInsets.all(AppDimentions.padding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  match.homeTeam.name,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  width: 6,
                ),
                if (match.homeTeam.logo != null)
                  Image.network(
                    match.homeTeam.logo!,
                    width: 32,
                    height: 32,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.sports_soccer),
                  ),
              ],
            ),
          ),
          // i added match status but there is no description for it, except for the match status id = 1 i consider it as started and show the scores
          // also about scores there is no description for it, so i just show the sum of the scores array
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              match.matchStatusId == 1
                  ? Container(
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        match.matchTime,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: AppColors.grey),
                      ),
                    )
                  : Container(
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        "${match.homeTeam.score.reduce((a, b) => a + b)} : ${match.awayTeam.score.reduce((a, b) => a + b)}",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: AppColors.grey),
                      ),
                    ),
            ],
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (match.homeTeam.logo != null)
                  Image.network(
                    match.awayTeam.logo!,
                    width: 32,
                    height: 32,
                    errorBuilder: (context, error, stackTrace) =>
                        Icon(Icons.sports_soccer),
                  ),
                const SizedBox(
                  width: 6,
                ),
                Text(
                  match.awayTeam.name,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
