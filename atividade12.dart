import 'dart:io';

void main() {
  stdout.write('Digite um numero: ');
  int numero = int.parse(stdin.readLineSync()!);
  String invertido = '';

  while (numero > 0) {
    invertido += (numero % 10).toString();
    numero = numero ~/ 10;
  }

  print('Impressao: $invertido');
}
