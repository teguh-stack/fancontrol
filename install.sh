#!/bin/sh

# Periksa apakah git diinstal
if ! command -v git &> /dev/null
then
    echo "git could not be found, please install git first."
    exit
fi

# Kloning repository
echo "Cloning repository..."
git clone https://github.com/yourusername/fancontrol.git /tmp/fancontrol

# Menyalin file ke direktori yang tepat
echo "Copying files..."
cp -r /tmp/fancontrol/files/* /

# Mengatur izin eksekusi untuk skrip kontrol kipas
echo "Setting execute permissions..."
chmod +x /path/to/fan_control.sh  # Pastikan untuk mengubah path sesuai dengan lokasi yang benar

# Mengaktifkan skrip init
echo "Enabling fancontrol service..."
/etc/init.d/fancontrol enable

# Memulai ulang LuCI
echo "Restarting LuCI..."
/etc/init.d/uhttpd restart

# Menghapus direktori sementara
echo "Cleaning up..."
rm -rf /tmp/fancontrol

echo "Installation complete. Please configure the fan control settings through the LuCI interface under Services -> Fan Control."
