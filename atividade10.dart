import 'dart:io';

void main() {
  int homens = 0;
  int mulheres = 0;
  int homensExp = 0;
  int somaIdade = 0;
  int homensVelhos = 0;
  int mulheresNovas = 0;
  int menorIdade = 1000;
  String nomeMenor = '';

  while (true) {
    stdout.write('Nome (FIM pra sair): ');
    String nome = stdin.readLineSync()!;
    if (nome == 'FIM') {
      break;
    }

    stdout.write('Sexo (M/F): ');
    String sexo = stdin.readLineSync()!;
    stdout.write('Idade: ');
    int idade = int.parse(stdin.readLineSync()!);
    stdout.write('Tem experiencia (S/N): ');
    String exp = stdin.readLineSync()!;

    if (sexo == 'M') {
      homens++;
      if (exp == 'S') {
        homensExp++;
        somaIdade += idade;
      }
      if (idade > 45) {
        homensVelhos++;
      }
    } else {
      mulheres++;
      if (exp == 'S') {
        if (idade < 30) {
          mulheresNovas++;
        }
        if (idade < menorIdade) {
          menorIdade = idade;
          nomeMenor = nome;
        }
      }
    }
  }

  print('Mulheres: $mulheres');
  print('Homens: $homens');

  if (homensExp > 0) {
    print('Idade media dos homens com experiencia: ${somaIdade / homensExp}');
  }
  if (homens > 0) {
    print('Homens com mais de 45 anos: ${homensVelhos * 100 / homens}%');
  }
  print('Mulheres com menos de 30 anos e experiencia: $mulheresNovas');
  if (nomeMenor != '') {
    print('Candidata mais nova com experiencia: $nomeMenor');
  }
}
