#!/bin/sh

# Cek apakah script dijalankan dengan hak administratif
if [ "$(id -u)" -ne 0 ]; then
    echo "Script must be run as root"
    exit 1
fi

# Cek apakah git diinstal
if ! command -v git &> /dev/null; then
    echo "git is not installed, please install git first."
    exit 1
fi

# Kloning repository fancontrol dari GitHub
echo "Cloning repository..."
git clone https://github.com/teguh-stack/fancontrol.git /tmp/fancontrol

# Memastikan repository berhasil di-clone
if [ $? -ne 0 ]; then
    echo "Failed to clone repository. Exiting..."
    exit 1
fi

# Menyalin file konfigurasi ke direktori yang tepat
echo "Copying configuration files..."
cp -r /tmp/fancontrol/files/* /

# Memastikan file-file berhasil disalin
if [ $? -ne 0 ]; then
    echo "Failed to copy files. Exiting..."
    rm -rf /tmp/fancontrol
    exit 1
fi

# Menyalin skrip fan_control.sh ke /usr/sbin/
echo "Copying fan_control.sh to /usr/sbin/..."
cp /tmp/fancontrol/files/usr/sbin/fan_control.sh /usr/sbin/

# Memastikan skrip fan_control.sh memiliki izin eksekusi
chmod +x /usr/sbin/fan_control.sh

# Menyalin file LuCI controller dan model jika diperlukan
# Perhatikan bahwa ini akan bergantung pada struktur spesifik LuCI Anda

# Mengaktifkan skrip init fancontrol
echo "Enabling fancontrol service..."
/etc/init.d/fancontrol enable

# Memulai ulang LuCI untuk menerapkan perubahan
echo "Restarting LuCI..."
/etc/init.d/uhttpd restart

# Menghapus direktori sementara setelah instalasi selesai
echo "Cleaning up..."
rm -rf /tmp/fancontrol

# Memeriksa apakah fan_control.sh berjalan
echo "Checking fan_control.sh status..."
if pgrep -x "fan_control.sh" > /dev/null; then
    echo "Installation successful. Please configure fan control settings through LuCI under Services -> Fan Control."
else
    echo "Failed to start fan_control.sh. Check configuration and logs for errors."
fi
