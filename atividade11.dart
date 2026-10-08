import 'dart:io';

void main() {
  int homens = 0;
  int mulheres = 0;
  double somaHomens = 0;
  double somaMulheres = 0;

  while (true) {
    stdout.write('Codigo (9999 pra sair): ');
    String codigo = stdin.readLineSync()!;
    if (codigo == '9999') {
      break;
    }

    stdout.write('Nome: ');
    String nome = stdin.readLineSync()!;
    stdout.write('Sexo (M/F): ');
    String sexo = stdin.readLineSync()!;
    stdout.write('Horas de aula: ');
    int horas = int.parse(stdin.readLineSync()!);

    double bruto = horas * 12.30;
    double liquido;

    if (sexo == 'M') {
      liquido = bruto - bruto * 0.10;
      homens++;
      somaHomens += liquido;
    } else {
      liquido = bruto - bruto * 0.05;
      mulheres++;
      somaMulheres += liquido;
    }

    print('$codigo - $nome - Bruto: $bruto - Liquido: $liquido');
  }

  if (homens > 0) {
    print('Media liquida dos homens: ${somaHomens / homens}');
  }
  if (mulheres > 0) {
    print('Media liquida das mulheres: ${somaMulheres / mulheres}');
  }
}
