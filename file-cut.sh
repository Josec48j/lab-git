#!/bin/bash

# Script: file-cut.sh
# Descripción: Corta archivos .fastq en la proporción correspondiente al usuario.

# Función para cortar un archivo
cut_file() {
    local file=$1
    echo "Procesando $file..."
    local lines=$(wc -l < "$file")       # Calcula el número total de líneas
    local proportion=$((lines / 2))     # Calcula la mitad superior para alumno02
    head -n "$proportion" "$file" > "${file}.tmp"  # Guarda la mitad superior en un archivo temporal
    mv "${file}.tmp" "$file"            # Renombra el archivo temporal para reemplazar el original
    echo "Procesado $file: cortado a $proportion líneas."
}

# Procesa cada archivo .fastq en paralelo
for file in *.fastq; do
    cut_file "$file" &
done

# Espera a que todos los trabajos paralelos terminen
wait

echo "Todos los archivos han sido procesados."

