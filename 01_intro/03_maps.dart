void main() {
  final Map<String, dynamic> pokemon = {
    'name': 'Ditto',
    'hp': 100,
    'isAlise': true,
    'abilities': <String>['impostor'],
    'sprites': {1: 'ditto/frong.png', 2: 'ditto/back.png'},
  };
  final pokemons = {1: 'ABC', 2: 'XYZ', 3: '123'};

  print(pokemon);
  print(pokemon['name']);
  print('Name: ${pokemon['name']}');
  print('Sprites: ${pokemon['sprites']}');
  print('back: ${pokemon['sprites'][2]}');
  print('front: ${pokemon['sprites'][1]}');
  print('front: ${pokemons[1]}');
}
