import 'dart:io';

void main() {
  int homens = 0;
  int mulheres = 0;
  int menor = 5001;
  int maiorSI = -1;
  String nomeMenor = '';
  String codigoMaior = '';
  var listaCC = <String>[];

  while (true) {
    stdout.write('Codigo (0000 pra sair): ');
    String codigo = stdin.readLineSync()!.trim();
    if (codigo == '0000') {
      break;
    }

    stdout.write('Curso (CC/SI): ');
    String curso = stdin.readLineSync()!.trim().toUpperCase();
    while (curso != 'CC' && curso != 'SI') {
      stdout.write('Digite CC ou SI: ');
      curso = stdin.readLineSync()!.trim().toUpperCase();
    }

    stdout.write('Nome: ');
    String nome = stdin.readLineSync()!;
    stdout.write('Sexo (M/F): ');
    String sexo = stdin.readLineSync()!.trim().toUpperCase();
    while (sexo != 'M' && sexo != 'F') {
      stdout.write('Digite M ou F: ');
      sexo = stdin.readLineSync()!.trim().toUpperCase();
    }

    stdout.write('Pontos (0 a 5000): ');
    int pontos = int.parse(stdin.readLineSync()!);
    while (pontos < 0 || pontos > 5000) {
      stdout.write('Digite de 0 a 5000: ');
      pontos = int.parse(stdin.readLineSync()!);
    }

    if (curso == 'CC' && pontos > 2500) {
      listaCC.add('$codigo - $nome - $pontos pts');
    }

    if (sexo == 'M') {
      homens++;
      if (pontos < menor) {
        menor = pontos;
        nomeMenor = nome;
      }
      if (curso == 'SI' && pontos > maiorSI) {
        maiorSI = pontos;
        codigoMaior = codigo;
      }
    } else {
      mulheres++;
    }
  }

  int total = homens + mulheres;
  if (total == 0) {
    print('Sem candidatos cadastrados');
    return;
  }

  print('Candidatos CC com mais de 2500 pts:');
  if (listaCC.isEmpty) {
    print('Nenhum');
  } else {
    for (var candidato in listaCC) {
      print(candidato);
    }
  }

  if (homens > 0) {
    print('Homem com menor pontuacao geral: $nomeMenor');
  } else {
    print('Sem candidatos M');
  }

  if (maiorSI >= 0) {
    print('Codigo do homem com mais pts em SI: $codigoMaior');
  } else {
    print('Sem candidatos M em SI');
  }

  print('Candidatos M: ${(homens * 100 / total).toStringAsFixed(2)}%');
  print('Candidatos F: ${(mulheres * 100 / total).toStringAsFixed(2)}%');
}
