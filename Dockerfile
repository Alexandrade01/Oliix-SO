# Use uma imagem do OpenJDK para construir a aplicação
FROM openjdk:11 AS builder

WORKDIR /oliix

COPY . .

# Use o Maven para construir o projeto
RUN chmod +x mvnw
RUN ./mvnw clean install

# Use uma imagem do OpenJDK mínima como base
FROM openjdk:11-jre-slim

WORKDIR /oliix

# Copie o JAR construído do estágio anterior
COPY --from=builder /oliix/target/java-html-project.jar /app/java-html-project.jar

# Exponha a porta que a aplicação está utilizando
EXPOSE 8080

# Comando para iniciar a aplicação
CMD ["java", "-jar", "java-html-project.jar"]

