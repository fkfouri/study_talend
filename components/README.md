# Components

|Componente|Descricao
|---|---|
|![tAddCRCRow](image-18.png)|É um Checksum, CRC (Cyclic Redundancy Check) é um algoritmo usado para verificar a integridade dos dados durante a transferência ou armazenamento.
|![tBufferOutput](image-11.png)|Salva um dataset na memoria
|![tConvertType](image-5.png)|Conversao por tipo, parece um pouco o tJavaRow, mas sem usar codigo Java.<br>Usei o auto cast.
|![tDenormalizedSortedRow](image-9.png)|
|![tFileList](image-20.png)|Exibe um lista de arquivos. Responde por pesquisas como __*.txt__
|![tFileProperties](image-19.png)|Captura propriedades de um arquivo (tamanho, data, address, etc)
|![tFixedFlowInput](image.png)|Cria uma ou mais linhas com valores fiaxoss<br>nas colunas
|![tJavaFles](image-13.png)|Permite criar um codigo java com start, main e end
|![tJavaRow](image-4.png)|Aplica um algorítimo java por linha (??).<br>No exemplo fazia uma conversao de inteiro para string.
|![tLogRow](image-2.png)|Log de exibição dos registros
|![tMap](image-7.png)|Permite fazer mapeamento, tipo, uma seleção de saida. <br>Permite multiplas saidas, cada um com um schema diferente se necessario.
|![tMemorizeRows](image-12.png)|Usado para memorizar um certo numero de linhas e colunas de um dataset.<br>Observei que memorizou a ultima linha [fk]
|![tNormalized](image-8.png)|Reorganiza os dados de forma e remover redundancias
|![tReplace](image-15.png)|Replace definido diretamente no componente
|![tReplaceList](image-16.png)|Replace oriundo de uma lista, usa um lookup
|![tReplicate](image-1.png)|Replicas, copias dos registros
|![tSampleRow](image-10.png)|Para ver uma amostra de registros (configuravel)
|![tSchemaComplianceCheck](image-17.png)|Verificador de schema de um dataset
|![tSortRow](image-3.png)|Ordenação dos registros
|![tSplit](image-6.png)|Quebra colunas em linhas.<br>Ex>  Linha1 -> ABCD para Linha 1: AB e Linha 2: CD
|![tUniqRow](image-14.png)|Remove duplicidades no dataset


## Observações

### Data Quality
- duplicate
- interval MAtch - lookup por range de dados
- replace
- redundancia
- fuzzy match
- schema check

### Tmap

Quando você faz uma junção explícita no tMap, você pode definir um Match Model.

Ele tem diferentes opções:

1. Unique Match(Correspondência única):
    - funciona com junção interna e junção externa esquerda
    - seleção padrão
    - apenas a última correspondência passada para a saída = outras correspondências serão ignoradas

2. First Match (Primeira correspondência):
    - funciona com junção interna e junção externa esquerda
    - implica múltiplas correspondências esperadas na pesquisa
    - apenas a primeira correspondência passada para a saída = outras correspondências serão ignoradas

3. All Matches (Todas as correspondências):
    - funciona com junção interna e junção externa esquerda
    - implica múltiplas correspondências esperadas na pesquisa
    - todas as correspondências passadas para a saída = nenhuma correspondência ignorada

4. All Rows (Todas as linhas):
    - não funciona com junção interna e junção externa esquerda
    - cria uma junção cruzada entre a entrada principal e a(s) pesquisa(s)



### Normalizar (tNormalized)

Normalizar é o processo de reorganizar os dados em uma estrutura mais eficiente, eliminando a redundância e melhorando a integridade dos dados. Isso envolve:

Dividir os dados em tabelas ou conjuntos de dados menores, cada um com uma chave única.
Remover dados redundantes e inconsistentes.
Estabelecer relacionamentos entre as tabelas ou conjuntos de dados.
Normalizar ajuda a:

Reduzir a redundância de dados
Melhorar a integridade dos dados
Facilitar a manutenção e atualização dos dados

Exemplo: Em um banco de dados de clientes, você pode ter uma tabela com os seguintes campos: Nome, Endereço, Telefone e E-mail. Ao normalizar, você pode criar duas tabelas: Clientes com Nome e Endereço, e Contatos com Telefone e E-mail, relacionadas pela chave Cliente_ID.

### Denormalizar (tDenormalizedSortedRow e tDenormalizedRow)

Denormalizar é o processo de reorganizar os dados em uma estrutura mais simples, sacrificando a integridade dos dados em favor da performance e velocidade de acesso. Isso envolve:

Combinar dados de várias tabelas ou conjuntos de dados em uma única tabela ou conjunto de dados.
Replicar dados para evitar consultas complexas.
Denormalizar ajuda a:

Melhorar a performance de consultas
Reduzir a complexidade de consultas
Aumentar a velocidade de acesso aos dados
Exemplo: Em um banco de dados de e-commerce, você pode ter uma tabela com os seguintes campos: Produto, Preço, Descrição e Imagem. Ao denormalizar, você pode criar uma tabela com todos os campos, incluindo a imagem, para evitar consultas complexas e melhorar a performance.

Em resumo:

Normalizar é usado para melhorar a integridade e reduzir a redundância de dados, mas pode afetar a performance.
Denormalizar é usado para melhorar a performance e velocidade de acesso, mas pode afetar a integridade dos dados.
A escolha entre normalizar e denormalizar depende do objetivo do projeto, do tipo de dados e das necessidades de performance e integridade.