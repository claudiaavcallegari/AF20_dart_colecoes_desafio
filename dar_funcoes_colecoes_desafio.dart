

void main() {

  //! Detalhe sobre a String
  //! A String é composta por 3 campos (Nome|Idade|Sexo)
  final pessoas = [
    'Rodrigo Rahman|35|Masculino',
    'Jose|56|Masculino',
    'Joaquim|84|Masculino',
    'Rodrigo Rahman|35|Masculino',
    'Maria|88|Feminino',
    'Helena|24|Feminino',
    'Leonardo|5|Masculino',
    'Laura Maria|29|Feminino',
    'Joaquim|72|Masculino',
    'Helena|24|Feminino',
    'Guilherme|15|Masculino',
    'Manuela|85|Feminino',
    'Leonardo|5|Masculino',
    'Helena|24|Feminino',
    'Laura|29|Feminino',
  ];

  //! Baseado na lista acima.
  //! 1 - Remova os pacientes duplicados e apresente a nova lista
  //! 2 - Me mostre a quantidade de pessoas por sexo (Masculino e Feminino) e depois me apresente o nome delas
  //! 3 - Filtrar e deixar a lista somente com pessoas maiores de 18 anos e apresente essas pessoas pelo nome 
  //! 4 - Encontre a pessoa mais velha e apresente o nome dela.

 try {
  final  pessoas2= pessoas.toSet();
   print('1- Nova lista sem duplicados:');
   for (var item in pessoas2) {
     print(item);     
   }

Set<Map> pessoasMap = pessoasToMap(pessoas2);
//  print(pessoasMap);

    var listaMasculino = [];
    var listaFeminino =  [];

    var pessoaMaisVelha = '';
    var idadeAtual = 0;

    pessoasMap.forEach((element) {
      (element['sexo'].toString().toUpperCase().substring(0, 1) == 'F')
          ? listaFeminino.add(element['nome'])
          : listaMasculino.add(element['nome']) ;
      if (element['idade'] > idadeAtual) {
        idadeAtual = element['idade'];
        pessoaMaisVelha = element['nome'];
      }
    });

    print('2-  Total Masculino: ${listaMasculino.length}  \n');
    for (var item in listaMasculino) {
      print(item);      
    }

    print(' Total Feminino: ${listaFeminino.length} \n ');
    for (var item in listaFeminino) {
      print(item);      
    }


    print(' ');
    pessoasMap.removeWhere((element) => element['idade'] <= 18);

    print('3- Lista de pessoas com mais de 18 anos:');
    pessoasMap.forEach((element) {
      print(element['nome']);

    });



    print(' ');
    print('3.1 - Total de pessoas com mais de 18 anos: ${pessoasMap.length}');

    print('4-  A pessoa mais velha é: $pessoaMaisVelha ');
  } catch (e, s) {
    print('Houve um erro: $e');
    print('Detalhes do erro: $s');
  }
}

Set<Map<String, dynamic>> pessoasToMap(Set pessoas) {
  var pessoasMap = <Map<String, dynamic>>{};

  for (var valor in pessoas) {
    var linha = valor.split('|');
    var nome = linha[0];
    var idade = int.parse(linha[1]);
    var sexo = linha[2];

    pessoasMap.add({'nome': nome, 'idade': idade, 'sexo': sexo});
  }
  return pessoasMap;
}













