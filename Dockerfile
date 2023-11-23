# Use uma imagem do OpenJDK para construir a aplicação
FROM openjdk:11 AS builder

WORKDIR /app

COPY . .

# Use o Maven para construir o projeto
RUN ./mvnw clean install

# Use uma imagem do OpenJDK mínima como base
FROM openjdk:11-jre-slim

WORKDIR /app

# Copie o JAR construído do estágio anterior
COPY --from=builder /app/target/java-html-project.jar /app/java-html-project.jar

# Exponha a porta que a aplicação está utilizando
EXPOSE 8080

# Comando para iniciar a aplicação
CMD ["java", "-jar", "java-html-project.jar"]

