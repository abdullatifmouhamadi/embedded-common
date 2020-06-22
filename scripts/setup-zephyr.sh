#!/bin/bash

# https://docs.zephyrproject.org/latest/getting_started/index.html

west init zephyrproject
cd zephyrproject
west update

west zephyr-export
pip install --user -r zephyr/scripts/requirements.txt



