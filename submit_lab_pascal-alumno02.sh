#!/bin/bash
#SBATCH -p hpc-bio-pascal           # Cola/partición a usar
#SBATCH -D /home/alumno02/lab-git   # Directorio de trabajo
#SBATCH --job-name=fastq_cut        # Nombre del trabajo
#SBATCH --output=cut_%j.out         # Archivo de salida
#SBATCH --error=cut_%j.err          # Archivo de error
#SBATCH --ntasks=4                  # Número de tareas (una por archivo)
#SBATCH --time=00:10:00             # Tiempo límite
#SBATCH --mem=1G                    # Memoria por nodo

# Ejecuta el script file-cut.sh
bash file-cut.sh

