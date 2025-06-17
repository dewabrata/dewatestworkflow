# Gunakan base image OpenJDK yang sesuai dengan versi Java proyek Anda.
# 'openjdk:17-jdk-slim' adalah pilihan yang baik karena ukurannya relatif kecil.
FROM openjdk:17-jdk-slim

# Tetapkan direktori kerja di dalam container.
# Perintah selanjutnya akan dijalankan relatif terhadap direktori ini.
WORKDIR /app

# Argumen untuk nama file JAR agar Dockerfile lebih fleksibel dan tidak terikat
# pada nama versi SNAPSHOT tertentu. Nilai defaultnya adalah mengambil JAR apa pun
# di direktori target.
ARG JAR_FILE=target/*.jar

# Salin file JAR yang sudah di-build oleh Maven (dari direktori target di host)
# ke dalam container dan beri nama 'application.jar'.
COPY ${JAR_FILE} application.jar

# Ekspos port yang digunakan oleh aplikasi Spring Boot (default adalah 8080).
# Ini hanya sebagai dokumentasi; port masih perlu dipetakan saat menjalankan container.
EXPOSE 8080

# Perintah untuk menjalankan aplikasi saat container dimulai.
# Ini menggunakan format "exec" dari ENTRYPOINT, yang lebih disukai.
ENTRYPOINT ["java", "-jar", "/app/application.jar"]

