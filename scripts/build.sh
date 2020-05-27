#!/usr/bin/env bash

# thumbv7em-none-eabihf is the default target if not specified
# (see ../.config/cargo)

set -e

echo Building nrf51-hal...
cargo build --manifest-path nrf51-hal/Cargo.toml --target thumbv6m-none-eabi
echo Building nrf9160-hal...
cargo build --manifest-path nrf9160-hal/Cargo.toml --target thumbv8m.main-none-eabi
echo Building nrf52810-hal...
cargo build --manifest-path nrf52810-hal/Cargo.toml --target thumbv7em-none-eabi
echo Building nrf52832-hal...
cargo build --manifest-path nrf52832-hal/Cargo.toml
echo Building nrf52840-hal...
cargo build --manifest-path nrf52840-hal/Cargo.toml
echo Building boards/adafruit_nrf52pro...
cargo build --manifest-path boards/adafruit_nrf52pro/Cargo.toml --examples
echo Building boards/adafruit-nrf52-bluefruit-le...
cargo build --manifest-path boards/adafruit-nrf52-bluefruit-le/Cargo.toml --examples
echo Building boards/nRF52-DK...
cargo build --manifest-path boards/nRF52-DK/Cargo.toml --examples
echo Building boards/nRF9160-DK...
cargo build --manifest-path boards/nRF9160-DK/Cargo.toml --examples
echo Building boards/nRF52840-DK...
cargo build --manifest-path boards/nRF52840-DK/Cargo.toml --examples
echo Building boards/actinius-icarus...
cargo build --manifest-path boards/actinius-icarus/Cargo.toml --examples
echo Building examples/rtfm-demo...
cargo build --manifest-path examples/rtfm-demo/Cargo.toml
echo Building examples/rtfm-demo...
cargo build --manifest-path examples/rtfm-demo/Cargo.toml --no-default-features --features="51" --target thumbv6m-none-eabi
echo Building examples/rtfm-demo...
cargo build --manifest-path examples/rtfm-demo/Cargo.toml --no-default-features --features="52810" --target thumbv7em-none-eabi
echo Building examples/rtfm-demo...
cargo build --manifest-path examples/rtfm-demo/Cargo.toml --no-default-features --features="52840"
echo Building examples/spi-demo...
cargo build --manifest-path examples/spi-demo/Cargo.toml
echo Building examples/twi-ssd1306...
cargo build --manifest-path examples/twi-ssd1306/Cargo.toml
echo Building examples/twi-ssd1306...
cargo build --manifest-path examples/twi-ssd1306/Cargo.toml --no-default-features --features="52840" --target thumbv7em-none-eabi
echo Checking source code formatting...
cargo +stable fmt -- --check
