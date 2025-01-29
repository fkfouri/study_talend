# Talend

## Download

https://github.com/advanova/talend-open-studio/releases
- **DI - Data Integration**: É o módulo mais usado do Talend, voltado para integração de dados. Ele permite criar ETL (Extract, Transform, Load) ou ELT (Extract, Load, Transform) para mover e transformar dados entre sistemas. Ideal para construção de pipelines de dados.
- **DQ - Data Quality**: Está relacionado à qualidade dos dados. Inclui ferramentas para limpar, padronizar, deduplicar e validar os dados para garantir que eles estejam precisos, completos e consistentes antes de serem usados.
- **ESB - Enterprise Service Bus**: Esse módulo foca na integração de aplicações em tempo real. Ele ajuda a construir APIs e serviços baseados em microserviços, permitindo comunicação eficiente entre sistemas. É muito usado em arquiteturas orientadas a serviços (SOA).
- **BD - Big Data**: É direcionado a processamento de grandes volumes de dados em plataformas como Hadoop, Spark e outras tecnologias de Big Data. Ele facilita o uso dessas tecnologias sem precisar de conhecimento avançado em codificação

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


## Curso Talend - Data Integration & ETL with Talend Open Studio Zero to Hero
- ref: https://meta.udemy.com/course/data-integration-etl-talend-open-studio-zero-to-hero/
- Instrutor: [Samuel Lenk](samuellenkb@gmail.com)
