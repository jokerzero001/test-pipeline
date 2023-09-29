# Gunakan OS base Rocky Linux 8
FROM rockylinux/rockylinux:8

# Label informasi tentang pemeliharaan
LABEL maintainer="syaukani"

# Buka port 8000
EXPOSE 8000

# Instal paket yang diperlukan
RUN dnf -y --setopt=baseos.skip_if_unavailable=True update
RUN dnf -y firewalld

# Konfigurasi firewalld untuk mengizinkan akses ke port 8000
RUN firewall-cmd --permanent --add-port=8000/tcp && \
    firewall-cmd --reload

# Command default yang akan dijalankan saat kontainer berjalan
CMD ["/bin/bash"]
