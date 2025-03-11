#!/bin/bash

echo "Membersihkan Sistem di Kali Linux..."

# Hapus paket yang tidak diperlukan
echo "Menghapus paket yang tidak diperlukan..."
sudo apt autoremove -y
sudo apt autoclean -y
sudo apt clean -y

# Hapus cache APT
echo "Menghapus cache APT..."
sudo rm -rf /var/cache/apt/archives/*

# Hapus file log yang lama
echo "Menghapus file log lama..."
sudo find /var/log -type f -name "*.log" -exec truncate -s 0 {} \;

# Bersihkan cache sistem
echo "Menghapus cache sistem..."
sudo rm -rf ~/.cache/*

# Bersihkan thumbnail cache
echo "Menghapus cache thumbnail..."
rm -rf ~/.cache/thumbnails/*

# Bersihkan temporary files
echo "Menghapus file sementara..."
sudo rm -rf /tmp/*
sudo rm -rf /var/tmp/*

# Update sistem (opsional)
read -p "Apakah Anda ingin memperbarui sistem? (y/n): " update_choice
if [[ $update_choice == "y" || $update_choice == "Y" ]]; then
    echo "Memperbarui sistem..."
    sudo apt update -y && sudo apt upgrade -y
fi

echo "Pembersihan sistem selesai!"