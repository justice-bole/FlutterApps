import 'story.dart';

class StoryBrain {
  List<Story> _storyData = [
    Story(
        title:
            'Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide brimmed hat with soulless eyes opens the passenger door for you and asks: "Need a ride, boy?".',
        choice1: 'I\'ll hop in. Thanks for the help!',
        choice2: 'Better ask him if he\'s a murderer first.'),
    Story(
        title: 'He nods slowly, unphased by the question.',
        choice1: 'At least he\'s honest. I\'ll climb in.',
        choice2: 'Wait, I know how to change a tire.'),
    Story(
        title:
            'As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glovebox. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box.',
        choice1: 'I love Elton John! Hand him the cassette tape.',
        choice2: 'It\'s him or me! You take the knife and stab him.'),
    Story(
        title:
            'What? Such a cop out! Did you know traffic accidents are the second leading cause of accidental death for most adult age groups?',
        choice1: 'Restart',
        choice2: ''),
    Story(
        title:
            'As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in.',
        choice1: 'Restart',
        choice2: ''),
    Story(
        title:
            'You bond with the murderer while crooning verses of "Can you feel the love tonight". He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: "Try the pier".',
        choice1: 'Restart',
        choice2: '')
  ];

  int _currentPage = 0;

  void path(int choice) {
    if (_currentPage == 3 || _currentPage == 4 || _currentPage == 5) {
      restart();
      return;
    }
    if (_currentPage == 0) {
      if (choice == 1) {
        _currentPage = 2;
      } else {
        _currentPage = 1;
      }
    } else if (_currentPage == 1) {
      if (choice == 1) {
        _currentPage = 2;
      } else {
        _currentPage = 3;
      }
    } else if (_currentPage == 2) {
      if (choice == 1) {
        _currentPage = 5;
      } else {
        _currentPage = 4;
      }
    }
  }

  void restart() => _currentPage = 0;

  bool buttonShouldBeVisible() {
    if (_currentPage == 0 || _currentPage == 1 || _currentPage == 2) {
      return true;
    } else {
      return false;
    }
  }

  String get story => this._storyData[_currentPage].title;
  String get choice1 => this._storyData[_currentPage].choice1;
  String get choice2 => this._storyData[_currentPage].choice2;
}
