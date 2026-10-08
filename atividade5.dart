import 'dart:io';

void main() {
  stdout.write('QUANTIDADE de bebes: ');
  int n = int.parse(stdin.readLineSync()!);
  if (n <= 0) {
    print('Sem bebes cadastrados');
    return;
  }

  int baixo = 0;
  int normal = 0;
  int alto = 0;
  double maiorPeso = -1;
  String nomeMaior = '';

  for (int i = 0; i < n; i++) {
    stdout.write('Nome: ');
    String nome = stdin.readLineSync()!;
    stdout.write('Sexo (M/F): ');
    String sexo = stdin.readLineSync()!.trim().toUpperCase();
    while (sexo != 'M' && sexo != 'F') {
      stdout.write('Digite M ou F: ');
      sexo = stdin.readLineSync()!.trim().toUpperCase();
    }

    stdout.write('Peso (kg): ');
    double peso = double.parse(stdin.readLineSync()!.replaceAll(',', '.'));
    while (!peso.isFinite || peso < 0) {
      stdout.write('Peso invalido, digite 0 ou mais: ');
      peso = double.parse(stdin.readLineSync()!.replaceAll(',', '.'));
    }

    String classificacao;
    if (peso <= 2) {
      classificacao = 'Magro demais';
      baixo++;
    } else if (peso <= 4) {
      classificacao = 'Normal';
      normal++;
    } else {
      classificacao = 'Gordinho';
      alto++;
    }

    print('$nome - $sexo - $classificacao');
    if (sexo == 'F' && peso > maiorPeso) {
      maiorPeso = peso;
      nomeMaior = nome;
    }
  }

  if (maiorPeso >= 0) {
    print('Bebe F com maior peso: $nomeMaior');
  } else {
    print('Sem bebes do sexo F');
  }

  print('Magro demais: ${(baixo * 100 / n).toStringAsFixed(2)}%');
  print('Normal: ${(normal * 100 / n).toStringAsFixed(2)}%');
  print('Gordinho: ${(alto * 100 / n).toStringAsFixed(2)}%');
}
