#!/bin/sh

CONFIG_FILE="/etc/config/fancontrol"
GPIO_PIN=$(uci get fancontrol.settings.gpio_pin)
THRESHOLD_TEMP=$(uci get fancontrol.settings.threshold_temp)
LOWER_THRESHOLD_TEMP=$(uci get fancontrol.settings.lower_threshold_temp) 
ENABLE=$(uci get fancontrol.settings.enable)

if [ "$ENABLE" -ne "1" ]; then
    echo "Fan control is disabled."
    exit 0
fi

# Fungsi untuk menyalakan kipas
turn_on_fan() {
    echo "1" > /sys/class/gpio/gpio$GPIO_PIN/value
}

# Fungsi untuk mematikan kipas
turn_off_fan() {
    echo "0" > /sys/class/gpio/gpio$GPIO_PIN/value
}

# Ekspor GPIO untuk penggunaan jika belum ada
if [ ! -d /sys/class/gpio/gpio$GPIO_PIN ]; then
    echo $GPIO_PIN > /sys/class/gpio/export
    sleep 1
    echo "out" > /sys/class/gpio/gpio$GPIO_PIN/direction
fi

# Baca suhu SOC
while true; do
    TEMP=$(sensors | grep 'temp1:' | awk '{print $2}' | tr -d '+°C')
    if [ "$TEMP" -ge "$THRESHOLD_TEMP" ]; then
        turn_on_fan
    elif [ "$TEMP" -le "$LOWER_THRESHOLD_TEMP" ]; then
        turn_off_fan
    fi
    sleep 10
done

