import 'dart:io';

void main() {
  int alunos = 0;
  int aprovados = 0;
  int mulheres = 0;
  double soma = 0;
  double somaMulheres = 0;
  double maiorM = -1;
  double maiorF = -1;
  String matriculaM = '';
  String matriculaF = '';

  while (true) {
    stdout.write('Matricula (00000 pra sair): ');
    String matricula = stdin.readLineSync()!.trim();
    if (matricula == '00000') {
      break;
    }

    stdout.write('Nome: ');
    String nome = stdin.readLineSync()!;
    stdout.write('Sexo (M/F): ');
    String sexo = stdin.readLineSync()!.trim().toUpperCase();
    while (sexo != 'M' && sexo != 'F') {
      stdout.write('Digite M ou F: ');
      sexo = stdin.readLineSync()!.trim().toUpperCase();
    }

    double notas = 0;
    for (int i = 1; i <= 3; i++) {
      stdout.write('Nota $i: ');
      notas += double.parse(stdin.readLineSync()!.replaceAll(',', '.'));
    }
    stdout.write('Qtd de faltas: ');
    int faltas = int.parse(stdin.readLineSync()!);

    double media = notas / 3;
    alunos++;
    soma += media;

    if (sexo == 'F') {
      mulheres++;
      somaMulheres += media;
    }

    if (media >= 7 && faltas <= 18) {
      aprovados++;
      print('$nome: aprovado');
      if (sexo == 'M' && media > maiorM) {
        maiorM = media;
        matriculaM = matricula;
      }
      if (sexo == 'F' && media > maiorF) {
        maiorF = media;
        matriculaF = matricula;
      }
    } else {
      print('$nome: reprovado');
    }
  }

  if (alunos == 0) {
    print('Sem alunos cadastrados');
    return;
  }

  print('Media da turma: ${(soma / alunos).toStringAsFixed(2)}');
  print('Aprovados: ${(aprovados * 100 / alunos).toStringAsFixed(2)}%');
  print(
    'Matricula M aprovado com maior media: ${matriculaM.isEmpty ? 'nenhum' : matriculaM}',
  );
  print(
    'Matricula F aprovada com maior media: ${matriculaF.isEmpty ? 'nenhuma' : matriculaF}',
  );

  if (mulheres > 0) {
    print('Media das alunas: ${(somaMulheres / mulheres).toStringAsFixed(2)}');
  } else {
    print('Sem alunas cadastradas');
  }
}
