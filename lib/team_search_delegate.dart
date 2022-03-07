import 'package:flutter/material.dart';

class TeamSearchDelegate extends SearchDelegate<String> {
  final List<String> teams;

  TeamSearchDelegate({required this.teams});

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
      onPressed: () => close(context, ''),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildListView(teams);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildListView(teams);
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
