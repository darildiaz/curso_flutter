void main() {
  final Map<String, dynamic> rawJson = {
    'name': 'Tony Stark',
    'power': 'Money',
    'isAlive': true,
  };
  //  final ironman= Hero(
  //isAlive: rawJson['isAlive2']??false,
  //  power: 'Money',
  //  name: 'Tony Stark'
  //);
  //print (ironman);

  final ironman = Hero.formJson(rawJson);
  print(ironman);
}

class Hero {
  String name;
  String power;
  bool isAlive;
  Hero({required this.name, required this.power, required this.isAlive});

  Hero.formJson(Map<String, dynamic> json)
    : name = json['name'] ?? 'No name found',
      power = json['power'] ?? 'No power found',
      isAlive = json['isAlive'] ?? 'No isAlive found';

  @override
  String toString() {
    return '$name, $power, is Alive: ${isAlive ? 'YES!' : 'Nope'}';
  }
}
