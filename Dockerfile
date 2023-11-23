

# Use uma imagem do OpenJDK para construir a aplicação
FROM openjdk:11 AS builder

WORKDIR /app

COPY . .

# Use o Maven para construir o projeto
RUN chmod +x mvnw
RUN ./mvnw clean install

# Use uma imagem do OpenJDK mínima como base
FROM openjdk:11-jre-slim

WORKDIR /app

# Copie o JAR construído do estágio anterior
COPY --from=builder /app/target/oliix-0.0.1-SNAPSHOT.jar /app/oliix-0.0.1-SNAPSHOT.jar

# Exponha a porta que a aplicação está utilizando
EXPOSE 8080

# Comando para iniciar a aplicação
CMD ["java", "-jar", "oliix-0.0.1-SNAPSHOT.jar"]

