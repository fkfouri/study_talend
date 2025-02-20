# Talend

## Tutorial

- [Tutorial 🔜](components/Readme.md)
- Material complementar PDF
    - [Talend.a_Advanced-Resources-File](./blob/main/Talend.a_Advanced-Resources-File.pdf)

## Download

https://github.com/advanova/talend-open-studio/releases
- **DI - Data Integration**: É o módulo mais usado do Talend, voltado para integração de dados. Ele permite criar ETL (Extract, Transform, Load) ou ELT (Extract, Load, Transform) para mover e transformar dados entre sistemas. Ideal para construção de pipelines de dados.
- **DQ - Data Quality**: Está relacionado à qualidade dos dados. Inclui ferramentas para limpar, padronizar, deduplicar e validar os dados para garantir que eles estejam precisos, completos e consistentes antes de serem usados.
- **ESB - Enterprise Service Bus**: Esse módulo foca na integração de aplicações em tempo real. Ele ajuda a construir APIs e serviços baseados em microserviços, permitindo comunicação eficiente entre sistemas. É muito usado em arquiteturas orientadas a serviços (SOA).
- **BD - Big Data**: É direcionado a processamento de grandes volumes de dados em plataformas como Hadoop, Spark e outras tecnologias de Big Data. Ele facilita o uso dessas tecnologias sem precisar de conhecimento avançado em codificação

## Talend Exchange

- [Talend Exchange - Deprecated](http://exchange.talend.com/)
- https://github.com/TalendExchange
- https://github.com/TalendExchange/Components

## Settings

```ini
-vmargs
-Xms512m
-Xmx1536m
-Dfile.encoding=UTF-8
-Dosgi.requiredJavaVersion=11
-XX:+UseG1GC
-XX:+UseStringDeduplication
-XX:MaxMetaspaceSize=512m
--add-opens=java.base/java.lang=ALL-UNNAMED
--add-opens=java.base/java.util=ALL-UNNAMED
--add-modules=ALL-SYSTEM

```

## Arquivos
- <job>.item → Contém a definição do job em XML (estrutura, componentes e conexões). Este é o mais importante.
- <job>.properties → Armazena metadados do job, como versão e informações do repositório.
- <job>.screenshot → Apenas uma imagem do fluxo do job para exibição no Talend Studio. Pode ser opcional.


## Curso Talend - 
- [Data Integration & ETL with Talend Open Studio Zero to Hero](https://meta.udemy.com/course/data-integration-etl-talend-open-studio-zero-to-hero/)
- [Talend Advanced for Big Data, Cloud and Database Integration](https://meta.udemy.com/course/talend-advanced-for-big-data-cloud-and-database-integration/)
- Instrutor: [Samuel Lenk](samuellenkb@gmail.com)


## Para executar
Por algum motivo identificado que o Dbeaver só se conecta após o Talend ter feito alguma consulta

```bash
#
make compose_up

# configurar sakila

make mysql
# depois que entrar no prompt mysql. rodar 
```

Para exemplo que solicite o database Sakila.
```sql
SELECT host, user FROM mysql.user;

SOURCE /local/sakila-schema.sql;
SOURCE /local/sakila-data.sql;

show databases;
use sakila;
show tables;
select count(1) from rental;

-- Para conceder acesso ao usuario talend na base sakila
GRANT ALL ON sakila.* TO 'talend'@'%';
SHOW GRANTS FOR 'talend'@'%';
SELECT User, Host, authentication_string FROM mysql.user WHERE User = 'talend';

-- concede todos os privilégios para o usuario talend
GRANT ALL PRIVILEGES ON *.* TO 'talend'@'%';
```


