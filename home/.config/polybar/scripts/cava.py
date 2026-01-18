import os
import subprocess
import sys

# Forzamos a que use 'fifo' o 'pulse' para evitar el crash de Pipewire
config_cava = """
[general]
bars = 8
[input]
method = pulse
source = auto
[output]
method = raw
raw_target = /dev/stdout
data_format = ascii
ascii_max_range = 7
"""

config_path = "/tmp/cava_config_polybar"
with open(config_path, "w") as f:
    f.write(config_cava)

# Ejecutamos cava capturando errores
process = subprocess.Popen(["cava", "-p", config_path], stdout=subprocess.PIPE, stderr=subprocess.DEVNULL)
chars = [" ", " ", "▂", "▃", "▄", "▅", "▆", "▇", "█"]

try:
    while True:
        line = process.stdout.readline().decode("utf-8").strip()
        if line:
            bars = line.split(";")
            output = "".join([chars[int(b)] if b.isdigit() else chars[0] for b in bars if b])
            print(output, flush=True)
except KeyboardInterrupt:
    process.terminate()
