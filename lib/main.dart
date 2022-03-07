import 'package:flutter/material.dart';
import './extensions/widget_extensions.dart';

const title = 'My App';
const teams = [
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
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You selected $selectedTeam.'),
            Scrollbar(
              child: ListView.builder(
                itemCount: teams.length,
                itemBuilder: (context, index) {
                  return ListTile(title: Text(teams[index]));
                },
              ),
            ).expanded,
          ],
        ),
      ),
    );
  }
}
