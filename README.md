# Fan Control for Orange Pi Zero 3 on OpenWrt

This repository contains scripts and LuCI interface for controlling a fan based on SOC temperature using a 2N2222 transistor and GPIO on Orange Pi Zero 3 running OpenWrt.

## Installation

1. Ensure git is installed on your system. If not, install git first.
2. Run the auto install script:
    ```sh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/yourusername/fancontrol/master/install.sh)"
    ```

## Usage

You can configure the fan control settings through the LuCI interface under `Services -> Fan Control`. You can enable/disable the fan control, set the GPIO pin, and the temperature threshold.

## License

This project is licensed under the MIT License.
