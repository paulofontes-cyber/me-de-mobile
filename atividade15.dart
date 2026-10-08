import 'dart:io';

void main() {
  stdout.write('Quantos bois: ');
  int n = int.parse(stdin.readLineSync()!);

  var numeros = [];
  var pesos = [];
  for (int i = 0; i < n; i++) {
    stdout.write('Numero do boi: ');
    numeros.add(int.parse(stdin.readLineSync()!));
    stdout.write('Peso do boi: ');
    pesos.add(double.parse(stdin.readLineSync()!));
  }

  String resp = 'S';
  while (resp == 'S') {
    stdout.write('Peso minimo: ');
    double minimo = double.parse(stdin.readLineSync()!);
    stdout.write('Peso maximo: ');
    double maximo = double.parse(stdin.readLineSync()!);

    for (int i = 0; i < n; i++) {
      if (pesos[i] >= minimo && pesos[i] <= maximo) {
        print('Boi ${numeros[i]} - ${pesos[i]} kg');
      }
    }

    stdout.write('Pesquisar de novo (S/N): ');
    resp = stdin.readLineSync()!;
  }
}
