# [🔙](../Readme.md) Tutorial

## Melhores práticas de desenvolvimento Talend

- Data flow = horizontal (esquerda para direita)
- Trigger = vertical (de cima para baixo)
- descriptive names
- camelCaseNames
- use existing fields for documentation - Descrição e Propósito
- create directory structure for input, output, params, logs
- define naming conventions
- structure the repository
- use versioning
- use template jobs = with pre/post/logging/context/etc.


Documentation in Talend:
- Subjob Title
- Component View Tab
- Note component
- Doc in repo
- Business Model in Repo
- Export job doc
- Document properties of job
good example? = this job (-;

## Build

Passando parametro na execução fora do Talend:
```powershell
# chamada powershell
a_deployment_run.ps1 --context_param noRows=6
```


## Components

Componente de fundo verde é o ínicio.


|Componente|Descricao
|---|---|
|![tAddCRCRow](image-18.png)|É um Checksum, CRC (Cyclic Redundancy Check) é um algoritmo usado para verificar a integridade dos dados durante a transferência ou armazenamento.
|![tAggregateRow](image-66.png)|Permite fazer agragações/group by.<br>Precisa editar o Schema, principalmente de saída.
|![tAssert](image-37.png)|é usado para realizar testes e verificações dentro de um job. Ele permite validar condições específicas e emitir mensagens caso essas condições não sejam atendidas. É útil para testes automatizados e validação de dados dentro do fluxo de ETL.
|![tAssertCatcher](image-38.png)|Junto com o tAssert, captura falhas e pode gerar logs ou relatórios.<br>- pode Unico catcher que não pode ser configurado pela ABA job/Stats&Log.
|![tBufferOutput](image-11.png)|Salva um dataset na memoria. Cada schema vai para uma memoria. No caso se houver mais de um buffer, os dados irão para a mesma memoria caso tenha o mesmo schema, do contrário, irão para memórias diferentes.
|![tCReateTable](image-51.png)|Cria uma tabela no BD
|![tConvertType](image-5.png)|Conversao por tipo, parece um pouco o tJavaRow, mas sem usar codigo Java.<br>Usei o auto cast.
|![tCronometerStart](image-31.png)<br>![alt text](image-32.png)|Calcula o tempo de processamento. Um colocado no PreJob e outro no PostJob
|![tDenormalizedSortedRow](image-9.png)|
|![tDBRow](image-56.png)|**Executa um comando SQL**
|![tDBSP](image-57.png)|Aciona uma Store Procedure. <br>No exemplo visto, fiz uma leitura de uma Store Procedure para uma varaivel local.
|![tDie](image-42.png)|Gera log de erro e pode parar a execução do job
|![tDBOutputBulkExec](image-50.png)|Cria e Carrega arquivo TXT
|![tDBOutuputBulk](image-49.png)|Cria arquivo TXT
|![tDBBulkExec](image-48.png)|Carrega arquivo TXT
|![tDBSCD](image-58.png)| SCD - Slowly Change Dimensions<br>Reflete mudanças no BD em tabelas de Dimensão
|![tELTInput](image-54.png)|Determina a tabela de origem para o tELTMap
|![tELTMap](image-53.png)|Uma espécie de Lookup e tMap com BD. Permitiu criar uma chamada recursiva (sql hierarquica)
|![tELTOutput](image-55.png)|Determina a tabela de saida do tELTMap
|![tExtractJSONFields](image-46.png)|Permite tranformar um json em um dataset
|![tFileList](image-20.png)|Exibe um lista de arquivos. Responde por pesquisas como __*.txt__
|![tFileExist](image-23.png)|Verifica se um arquivo existe. Saída IF.
|![tFileInputProperties](image-21.png)|Le um arquivo de parametros/propriedades como variaveis de ambiente
|![tFileProperties](image-19.png)|Captura propriedades de um arquivo (tamanho, data, address, etc)
|![tFileTouch](image-22.png)|Faz o touch do linux, gera um arquivo sem conteúdo
|![tFixedFlowInput](image.png)|Cria uma ou mais linhas com valores fixados nas colunas.<br>Gera um fluxo de dados a partir de varíaveis.
|![tFlowMeter](image-39.png)|Medidor de vazão, captura o volume de dados que passa por uma conexão
|![tFlowMeterCatcher](image-40.png)|Em conjunto com o tFlowMeter, captura as informações do medidos de vazão e os apresenta em logs ou relatórios.<br>- pode ser omitido se configurado pela ABA job/Stats&Log
|![tFlowTolterate](image-25.png)|Converte um fluxo de dados em iteração.<br>**Permite jogar key/value como global variable.**
|![tForeach](image-28.png)|Loop de elementos de um conjunto.
|![tInfiniteLoop](image-29.png)|Loop por tempo (ex. a cada 2000 ms). Para parar somente com kill.
|![tIterateToFlow](image-26.png)|Converte uma iteração em fluxo de dados
|![tJava](image-73.png)|Componente Java de utilização única. <br>Ex.<br>- Definir uma variável global.<br>- Ler um arquivo de propriedades.
|![tJavaFlex](image-13.png)|Permite criar um codigo java com start, main e end.<br>Na parte main é como se estivesse usando o tJavaRow.<br>Na parte Start e End é como se usa-se o tJava para antes e depois da leitura das linhas.
|![tJavaRow](image-4.png)|Aplica um algorítimo java por linha.<br>No exemplo fazia uma conversao de inteiro para string. <br>`output_row.<column> = input_row.<column>;`
|![tLibraryLoad](image-74.png)|Carrega um jar de terceiros.<br>Precisa importar a biblioteca pelo *advanced settings*.<br>Ex. `import org.apache.commons.lang3.StringUtils;`
|![tLogCatcher](image-43.png)|Em conjunto com o tWarn e tDie, captura os logs gerados e os apresentam em forma de logs ou relatórios.<br>- pode ser omitido se configurado pela ABA job/Stats&Log
|![tLogRow](image-2.png)|Log de exibição dos registros
|![tLoop](image-27.png)|Um laço For. Define um start/finish e step
|![tMap](image-7.png)|Permite fazer mapeamento, tipo, uma seleção de saida. <br>Permite multiplas saidas, cada um com um schema diferente se necessario. <br>Usou essa expressao para gerar um sequence **Numeric.sequence("s1", 1, 1)**
|![tMemorizeRows](image-12.png)|Usado para memorizar um certo numero de linhas e colunas de um dataset.<br>Observei que memorizou a ultima linha [fk]
|![tNormalized](image-8.png)|Reorganiza os dados de forma e remover redundancias
|![tPostJob](image-36.png)|Executa sempre, mesmo que o job possua erro ou nao.
|![tReplace](image-15.png)|Replace definido diretamente no componente
|![tReplaceList](image-16.png)|Replace oriundo de uma lista, usa um lookup
|![tReplicate](image-1.png)|Replicas, copias dos registros para n saídas<br>Contrario ao tUnite.
|![tRESTClient](image-45.png)|Chamada Rest de um API
|![tRowGenerator](image-52.png)|Gerador de linhas
|![tRunJob](image-35.png)|Chama a execução de um job filho. Para retornar valor, a saida do filho deve ser de somente **UM** tBufferOutput.<br>- Usar o mesmo nome de variavel no contexto pai e filhos;<br>- Configurar o tRunJob para propagar todo o contexto para o filho;<br>- Para garantir o retorno, clicar em "Copy child job Schema". Pegara o schema do tBufferOutput
|![tSampleRow](image-10.png)|Para ver uma amostra de registros (configuravel)
|![tSchemaComplianceCheck](image-17.png)|Verificador de schema de um dataset
|![tSetGlobalVar](image-47.png)|Seta uma variavel global
|![tSleep](image-24.png)|Provoca uma parada de tempo determinada
|![tSortRow](image-3.png)|Ordenação dos registros
|![tSystem](image-34.png)|Executa um comando no terminal
|![tSplit](image-6.png)|Quebra colunas em linhas.<br>Ex>  Linha1 -> ABCD para Linha 1: AB e Linha 2: CD
|![tStatCatcher](image-44.png)|Captura os logs de execuções gerais de uma job ou de um componente específico e os transformam em logs ou relatórios. <br>- Precisa habilitar na aba Components/Advanced Settings/tStatCatcher Statistics do componente para habilitar a captura;<br>- pode ser omitido se configurado pela ABA job/Stats&Log
|![tUnite](image-33.png)|Unifica duas origens. Não unifica dados de processos paralelos. Precisam ter o mesmo Schema.<br>Contrario ao tReplicate.
|![tUniqRow](image-14.png)|Remove duplicidades no dataset. Precisa definir quais colunas nao tolera a duplicidade.
|![tWaitFile](image-30.png)|Aguarda até que um arquivo apareca. Tem limites de tempo e numero de tentativas.
|![tWarn](image-41.png)|Gera log de Warn



## Conversões
### Conversoes Numéricas

- Widening: small to bigger -> implicito ok
    - Ex: Short para Integer, Bytem Long, Float e Double
![alt text](image-60.png)
![alt text](image-61.png)

- Narrowing: bigger to small -> explicito (CUIDADO)
    - Ex. Double to Long
        ![alt text](image-62.png)
        ![alt text](image-63.png)

- Precisão: Exemplo que pega .1 e soma em loop 10 vezes usando Double, Float e BigDecimal. Observe os diferentes resultados.
    - Double: 0.9999999999999999
    - Float:  1.0000001
    - BigDecimal: 1.0

    ```java
    String value = "0.1";
    String result = "0.0";

    // adding Double:
    double valueD = Double.valueOf(value);
    double resultD = Double.valueOf(result);
    for (int i = 0; i < 10; i++) {
        resultD += valueD;
    }
    System.out.println("Double result: " + resultD);

    // adding Float:
    float valueF = Float.valueOf(value);
    float resultF = Float.valueOf(result);
    for (int i = 0; i < 10; i++) {
        resultF += valueF;
    }
    System.out.println("Float result: " + resultF);

    // adding BidDecimal:
    BigDecimal valueB = new BigDecimal(value);
    BigDecimal resultB = new BigDecimal(result);
    for (int i = 0; i < 10; i++) {
        resultB = resultB.add(valueB);
    }
    System.out.println("BigDecimal result: " + resultB);    
    ```

- Formatting: String.format() -> http://bit.ly/formatString e http://bit.ly/stringDocs
```java
System.out.printf("some %s value: %,d%n", "Long", Long.MAX_VALUE);
System.out.printf("some %s value: %.3f%n", "Double", Math.PI);
```
![alt text](image-64.png)


### Conversões String 
#### StringDocs
https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/lang/String.html

- Codigo:
    ```java
    String abc = "\tabc or whatEVer else 4 want here ... ";
    System.out.println("🟢🟢 ORIGINAL INPUT: \"" + abc + "\"");
    System.out.println("=======================================================");
    // all this and more comes out of the box with Java
    System.out.println("01. charAt: " + abc.charAt(2));
    System.out.println("02. codePointAt: " + abc.codePointAt(2));
    System.out.println("03. compareTo: " + abc.compareTo(abc));
    System.out.println("04. compareToIgnoreCase: " + abc.compareToIgnoreCase(abc));
    System.out.println("05. concat: " + abc.concat(abc)); // equivalent -> abc + abc
    System.out.println("06. contains: " + abc.contains(abc));
    System.out.println("07. endsWith: " + abc.endsWith(abc));
    System.out.println("08. hashCode: " + abc.hashCode());
    System.out.println("09. indexOf: " + abc.indexOf(0));
    System.out.println("10. lastIndexOf: " + abc.lastIndexOf("c"));
    System.out.println("11. length: " + abc.length());
    System.out.println("12. matches: " + abc.matches(abc));
    System.out.println("13. replace: " + abc.replace("a", "B").replace("e", "#")); // method chaining
    System.out.println("14. startsWith: " + abc.startsWith(abc));
    System.out.println("15. strip: " + abc.strip());
    System.out.println("16. stripTrailing: " + abc.stripTrailing());
    System.out.println("17. substring: " + abc.substring(0, 2));
    System.out.println("18. toUpperCase: " + abc.toUpperCase());
    System.out.println("19. toLowerCase: " + abc.toLowerCase());
    // find Docs here: bit.ly/stringDocs
    ```
- Resultado:
    ![alt text](image-65.png)

#### StringUtils
https://commons.apache.org/proper/commons-lang/apidocs/org/apache/commons/lang3/StringUtils.html
Precisa usar o tLibraryLoad para importar a biblioteca `commons-lang3-3.10.jar`.
```java
import org.apache.commons.lang3.StringUtils;
```

![alt text](image-75.png)
![alt text](image-76.png)

### Cuidados com NullPoint

Uso de operadores ternarios. `booleanExpression ? expression1 : expression2` 

Exemplo: `(null == row2.name) ? "" : row2.name` 

```java
// Exemplo usado no curso
null == row5.txt ? "N/A" : row5.txt.toUpperCase() 

null == row5.txt ? "N/A" : 
row5.txt.equalsIgnoreCase("dummy") ? "N/A 2" : 
row5.txt.toUpperCase() 

// simplificando, usando OR (||)
null == row5.txt || row5.txt.equalsIgnoreCase("dummy") ? "N/A" : row5.txt.toUpperCase()


// Exemplos usados na Alinea
row5.data_saida != null ? TalendDate.formatDate("yyyy-MM-dd",row5.data_saida) : null

row5.data_competencia != null ? TalendDate.parseDate("yyyy-MM-dd", TalendDate.formatDate("yyyy-MM-dd", row5.data_competencia))  : null 

```

### TALEND CONVERTIONS - StringHandling
![alt text](image-67.png)
### TALEND CONVERTIONS -TalendDate 

http://bit.ly/SimpleDateFormats

![alt text](image-68.png)


## Talend Libraries

### Operações Aritiméticas
![alt text](image-69.png)


```java
System.out.println("## DEFINITION ##");
double a = 9.0;
System.out.println("a = " + a);
double b = 4.0;
System.out.println("b = " + b);
double result;

System.out.println("## BASIC OPERATIONS ##");

// addition:
result = a + b;
System.out.println("a + b = " + result);
result = Mathematical.SADD("" + a, "" + b);
System.out.println("a + b = " + result);

// subtraction:
result = a - b;
System.out.println("a - b = " + result);
String subResult = Mathematical.SSUB("" + a, "" + b);
System.out.println("a - b = " + subResult);

// muliplication:
result = a * b;
System.out.println("a * b = " + result);
result = Mathematical.SMUL("" + a, "" + b);
System.out.println("a * b = " + result);

// division:
result = a / b;
System.out.println("a : b = " + result);
result = Mathematical.DIV(a, b);
System.out.println("a : b = " + result);
result = Mathematical.SDIV((int)a, (int)b);
System.out.println("a : b = " + result);

// division remainder = modulo operator "%":
result = a % b;
System.out.println("a % b = " + result);
result = Mathematical.MOD(a, b);
System.out.println("a % b = " + result);

System.out.println("## OTHER METHODS ##");

System.out.println("floating to fixed width string: " + Mathematical.FFIX(9.2567, 2));
System.out.println("return integer: " + Mathematical.INT("-3"));
System.out.println("make number negative: " + Mathematical.NEG(a));
System.out.println("make number positive: " + Mathematical.ABS(-3.45));
System.out.println("is numeric: " + Mathematical.NUM("3"));
System.out.println("random number: " + Mathematical.RND(10.5));
System.out.println("square root: " + Mathematical.SQRT(a));
```

### Currency / Moedas / BigDecimal

https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/math/BigDecimal.html

![alt text](image-70.png)

![alt text](image-71.png)


## Observações

### Funções Talend 

- Gera uma _sequence_: `Numeric.sequence("s1",1,1)` 


#### String
- Gera uma chave randomica de tamanho 6 formato ASCII: `TalendString.getAsciiRandomString(6)` 


#### Datetime
- Data/Hora atual com formatação em string: `TalendDate.formatDate("yyyy.MM.dd-HH.mm.ss",TalendDate.getCurrentDate())`


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

### SCDs
 Slowly Change Dimensions (Dimensão de mudança Lenta)

|Tipo|Indicação|Uso
|---|:-:|---|
|0|Fixo|Dados que nunca mudam (CPF, Data de Nascimento).
|1|Mutável|Dados que podem ser atualizados diretamente (Nome, Telefone).
|2|Histórico|Dados que precisam de histórico (Salário, Cargo).
|3|Híbrido|Mudanças recentes dentro do mesmo registro.

Se estiver lidando com um Data Warehouse, geralmente os campos críticos são Tipo 2, pois manter histórico é essencial.

Vamos supor que você tenha uma tabela de clientes com as seguintes colunas:

|ID|Nome|Estado|Salário|Data_Início|Data_Fim
|---|---|---|---|---|---|
|1|Fabio|SP|5000|2024-01-01|NULL

Agora, a empresa decide mudar o salário de Fabio para 6000. Dependendo do tipo de campo configurado no `tDBSCD`, o comportamento será:

- Campo como Tipo 0 (Fixo): Se Salário for Tipo 0, nenhuma alteração acontece. O Talend ignora a atualização.
- Campo como Tipo 1 (Mutável): 
```
UPDATE clientes SET Salário = 6000 WHERE ID = 1;
```
- Campo como Tipo 2 (Histórico): Um novo registro é criado, e o antigo é marcado como inativo.
```
UPDATE clientes SET Data_Fim = '2024-02-16' WHERE ID = 1;
INSERT INTO clientes (ID, Nome, Estado, Salário, Data_Início, Data_Fim)
VALUES (2, 'Fabio', 'SP', 6000, '2024-02-16', NULL);
```
- Campo como Tipo 3 (Híbrido): O salário atual é mantido em uma coluna adicional, preservando o histórico no mesmo registro.
```
UPDATE clientes SET Salário_Anterior = Salário, Salário = 6000 WHERE ID = 1;
```

Exemplo de config no Talend.
![alt text](image-59.png)

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


## Routines
Criar um código, função que possa ser usado em jobs.

![alt text](image-72.png)

```java
package routines;
import routines.system.RandomUtils;

public class routine_test {

    /**
    * helloExample: not return value, only print "hello" + message.
    * 
    * 
    * {talendTypes} String
    * 
    * {Category} User Defined
    * 
    * {param} string("world") input: The string need to be printed.
    * 
    * {example} helloExemple("world") # hello world !.
    */
    public static String helloExample(String message) {
        if (message == null) {
            message = "World";
        }
        return "Hello " + message + " !";
    }
    
    
    /**
    * {talendTypes} String
    * 
    * {Category} TalendDataGenerator
    * 
    * {example} getNameBR() # Bill.
    */
    public static String getNameBR() {
        String[] list = { "João", "Gabriel", "Pedro", "Lucas", "Matheus", "Rafael", "Guilherme", "Felipe", "Gustavo", "Leonardo", "Thiago", "Bruno", "Daniel", "Eduardo", "Henrique", "Rodrigo", "André", "Diego", "Vinícius",  "Marcelo", "Alexandre", "Fernando", "Ricardo", "Carlos", "Antônio" }; //
        Integer random = 0 + ((Long) Math.round(RandomUtils.random() * (list.length - 1 - 0))).intValue();
        return list[random];
    }
    
    public static void main(String[] args) {
        String name = getNameBR();
        System.out.println(name);  
    }
    
}
```