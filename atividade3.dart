import 'dart:io';

void main() {
  stdout.write('Qtd de termos: ');
  int n = int.parse(stdin.readLineSync()!);
  if (n < 0) {
    print('Qtd nao pode ser negativa');
    return;
  }

  BigInt primeiro = BigInt.one;
  int segundo = 5;
  int terceiro = 100;
  var serie = <String>[];

  for (int i = 0; i < n; i++) {
    if (i % 3 == 0) {
      serie.add(primeiro.toString());
      primeiro *= BigInt.two;
    } else if (i % 3 == 1) {
      serie.add(segundo.toString());
      segundo += 5;
    } else {
      serie.add(terceiro.toString());
      terceiro -= 10;
    }
  }

  print('S = ${serie.join(' ')}');
}
