import subprocess
import time
import os

def run_cmd(cmd):
    start = time.perf_counter()
    subprocess.run(cmd, shell=True, check=True)
    return time.perf_counter() - start

# Estem a /ROOT/benchmark/, hem de pujar un nivell per executar cargo
os.chdir("..") 

print("Compilant Nera...")
# Afegim --release perquè el teu compilador vagi ràpid.
# Fem una execució prèvia (sense mesurar) perquè el teu main.rs 
# s'encarregui de cridar a clang i generar l'executable final.
nera_compiler = "cargo run --release --"
subprocess.run(f"{nera_compiler} run benchmark/bench.nera", shell=True, check=True)

# Tornem a la carpeta benchmark per als altres
os.chdir("benchmark")

print("Compilant C i Rust...")
# Afegim -march=native a C i Rust per igualar condicions d'optimització de maquinari
subprocess.run("clang -O3 -march=native bench.c -o bench_c", shell=True, check=True)
subprocess.run("rustc -C opt-level=3 -C target-cpu=native bench.rs -o bench_rust", shell=True, check=True)

print("\nExecutant benchmarks (mesurant només l'execució)...")
# El teu main.rs ha deixat el binari generat amb el nom "bench" a la carpeta benchmark
t_nera = run_cmd("./bench")
t_c = run_cmd("./bench_c")
t_rust = run_cmd("./bench_rust")

print(f"\nResultats de rendiment pur:")
print(f"Nera: {t_nera:.4f}s")
print(f"C:    {t_c:.4f}s")
print(f"Rust: {t_rust:.4f}s")