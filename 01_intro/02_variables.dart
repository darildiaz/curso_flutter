void main() {
  final String pokemon = 'Ditto';
  final int hp = 100;
  // final int? hp1;
  final bool isAlive = true;
  final List<String> abilities = ['impostor'];
  final sprites = <String>['ditto/front.png', 'ditto/'];

  //dynamic == null
  dynamic ErrorMessage = 'Hola';
  ErrorMessage = true;
  ErrorMessage = [1, 2, 3, 4, 5, 6];
  ErrorMessage = {1, 2, 3, 4, 5, 6};
  ErrorMessage = () => true;
  ErrorMessage = null;

  print("""
  $pokemon
  $hp
  $isAlive
  $abilities
  $sprites
  $ErrorMessage
  """);
}
