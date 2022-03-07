import 'package:flutter/material.dart';

class TeamSeachDelegate extends SearchDelegate<String> {
  final List<String> allTeams;
  final List<String> suggestedTeams;

  TeamSeachDelegate({required this.allTeams, required this.suggestedTeams});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () => query = '',
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () => close(context, query),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildListView(allTeams);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildListView(suggestedTeams);
  }

  Widget _buildListView(List<String> teams) {
    final q = query.toLowerCase();
    final results = teams.where((team) => team.toLowerCase().contains(q));
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(results.elementAt(index)),
        onTap: () {
          query = results.elementAt(index);
          close(context, query);
        },
      ),
    );
  }
}
