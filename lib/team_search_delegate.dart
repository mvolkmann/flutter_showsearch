import 'package:flutter/material.dart';

class TeamSearchDelegate extends SearchDelegate<String> {
  final List<String> teams;

  TeamSearchDelegate({required this.teams});

  // These appear on the right side of the search bar.
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () => query = '',
      ),
    ];
  }

  // This appears on the left side of the search bar.
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () => close(context, ''),
    );
  }

  // This is never called in the current app.
  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
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
