# Sử dụng Maven với Amazon Corretto 17 làm base image
FROM maven:3.9.6-amazoncorretto-17-al2023 AS builder

# Đặt thư mục làm việc trong container
WORKDIR /app

# Copy file cấu hình Maven (optional nếu cần custom)
# COPY settings.xml /root/.m2/settings.xml

# Copy toàn bộ project Maven vào container
COPY . .

# Build project bằng Maven
RUN mvn clean package -DskipTests

# # ---- Giai đoạn runtime ----
# # Sử dụng Amazon Corretto 17 làm base image cho runtime
# FROM amazoncorretto:17-al2
FROM maven:3.9.6-amazoncorretto-17-al2023

# Đặt thư mục làm việc trong container
WORKDIR /app

# Copy file jar từ builder sang runtime
COPY --from=builder /app/target/docker-service-1.0.0.jar app.jar

# # Chỉ định cổng mà container sẽ lắng nghe
# EXPOSE 8080

# Command mặc định để chạy ứng dụng
CMD ["java", "-jar", "app.jar"]
