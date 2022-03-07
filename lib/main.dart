import 'package:flutter/material.dart';
import './extensions/widget_extensions.dart';
import './team_search_delegate.dart';

const allTeams = [
  'Anaheim Ducks',
  'Arizona Coyotes',
  'Boston Bruins',
  'Buffalo Sabres',
  'Calgary Flames',
  'Carolina Hurricanes',
  'Chicago Blackhawks',
  'Colorado Avalanche',
  'Columbus Blue Jackets',
  'Dallas Stars',
  'Detroit Red Wings',
  'Edmonton Oilers',
  'Florida Panthers',
  'Los Angeles Kings',
  'Minnesota Wild',
  'Montréal Canadiens',
  'Nashville Predators',
  'New Jersey Devils',
  'New York Islanders',
  'New York Rangers',
  'Ottawa Senators',
  'Philadelphia Flyers',
  'Pittsburgh Penguins',
  'San Jose Sharks',
  'Seattle Kraken',
  'St. Louis Blues',
  'Tampa Bay Lightning',
  'Toronto Maple Leafs',
  'Vancouver Canucks',
  'Vegas Golden Knights',
  'Washington Capitals',
  'Winnipeg Jets',
];
const suggestedTeams = <String>[];
const title = 'My App';

void main() => runApp(
      MaterialApp(
        title: title,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const Home(),
      ),
    );

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var selectedTeam = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title), actions: [
        IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              final delegate = TeamSeachDelegate(
                allTeams: allTeams,
                suggestedTeams: suggestedTeams,
              );
              final selection =
                  await showSearch(context: context, delegate: delegate);
              setState(() => selectedTeam = selection ?? '');
            })
      ]),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(selectedTeam.isEmpty
                ? 'Select a team.'
                : 'You selected $selectedTeam.'),
            Scrollbar(
              child: ListView.builder(
                itemCount: allTeams.length,
                itemBuilder: (context, index) {
                  return ListTile(title: Text(allTeams[index]));
                },
              ),
            ).expanded,
          ],
        ),
      ),
    );
  }
}
