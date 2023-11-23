# Use uma imagem do OpenJDK como a base
FROM openjdk:11-jre-slim

# Use o Maven para construir o projeto
RUN chmod +x mvnw
RUN ./mvnw clean install

# Copie o arquivo JAR construído do seu projeto Spring Boot para o contêiner
COPY target/oliix-0.0.1-SNAPSHOT.jar /app/app.jar

# Defina o diretório de trabalho como /app
WORKDIR /app

# Exponha a porta que a aplicação Spring Boot está utilizando
EXPOSE 8080

# Comando para iniciar a aplicação
CMD ["java", "-jar", "app.jar"]

