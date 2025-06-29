import 'package:flutter/material.dart';
import 'package:sport_app/features/home/data/model/home_model.dart';
import 'package:sport_app/features/home/data/home_provider/home_provider.dart';
import 'package:sport_app/features/home/data/repo/home_repo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeRepo _repo;
  MatchData? _matchData;
  String? _error;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _repo = HomeRepo(provider: HomeProvider());
    _loadData();
  }

  Future<void> _loadData() async {
    final result = await _repo.getHome();
    result.fold(
      (failure) {
        setState(() {
          _error = failure.toString();
          _isLoading = false;
        });
      },
      (data) {
        setState(() {
          _matchData = data;
          _isLoading = false;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (_error != null) {
      return Scaffold(
        body: Center(child: Text('Error: $_error')),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Tomorrow\'s Matches')),
      body: ListView.builder(
        itemCount: _matchData!.data.length,
        itemBuilder: (context, index) {
          final competition = _matchData!.data[index];
          return ExpansionTile(
            title: Text(competition.competition.name),
            children: competition.matches.map((match) {
              return ListTile(
                title: Text(
                    '${match.homeTeam.name} vs ${match.awayTeam.name}'),
                subtitle: Text('${match.matchDay} at ${match.matchTime}'),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
