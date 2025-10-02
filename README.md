# CRUD-de-Usuarios-Prueba-controlada-de-fuerza-bruta-contra-tu-propia-API
# API CRUD de Usuarios + Pruebas de Seguridad

## Descripción
Este proyecto implementa una API REST con operaciones CRUD para gestión de usuarios, junto con pruebas éticas de fuerza bruta para análisis de seguridad en entornos controlados.

## Características Principales
- API REST con FastAPI
- Operaciones CRUD completas para usuarios
- Sistema de autenticación básico
- Pruebas de seguridad éticas con scripts de fuerza bruta
- Base de datos en memoria

## Requisitos Previos
- Python 3.8 o superior
- pip (gestor de paquetes de Python)

## Instalación y Configuración

### 1. Crear entorno virtual
```bash
python -m venv venv

# Activación en Linux/Mac:
source venv/bin/activate

# Activación en Windows:
venv\Scripts\activate
```

### 2. Instalar dependencias
```bash
pip install fastapi uvicorn sqlmodel
```

## Ejecución de la API

### Iniciar el servidor
```bash
uvicorn ApiCRUD:app --reload --port 8000
```

### Verificar que la API está funcionando
La API estará disponible en: http://localhost:8000

Puedes verificar la documentación interactiva en:
- http://localhost:8000/docs
- http://localhost:8000/redoc

## Estructura de la API

### Endpoints disponibles:

**Gestión de Usuarios:**
- POST /users - Crear nuevo usuario
- GET /users - Listar todos los usuarios
- GET /users/{id} - Obtener usuario por ID
- PUT /users/{id} - Actualizar usuario (excepto contraseña)
- DELETE /users/{id} - Eliminar usuario

**Autenticación:**
- POST /login - Iniciar sesión

### Usuario de prueba por defecto
La API incluye un usuario de prueba predefinido:
- Username: DGIM
- Password: 2106

## Pruebas de Seguridad Éticas

### Preparación para las pruebas

1. **Asegúrate de que la API esté ejecutándose** en el puerto 8000
2. **Verifica que el usuario de prueba exista** en la base de datos

### Scripts de Prueba Disponibles

#### 1. Script Básico de Ataque
```bash
# Hacer el script ejecutable
chmod +x attack_api.sh

# Ejecutar el script
./attack_api.sh
```

#### 2. Script Avanzado con Diccionario
```bash
# Hacer el script ejecutable
chmod +x advanced_attack.sh

# Ejecutar el script
./advanced_attack.sh
```

#### 3. Script con Logging Detallado
```bash
chmod +x ethical_bruteforce.sh
./ethical_bruteforce.sh
```

#### 4. Ejecutar el Algoritmo Python Directamente
```bash
python3 bruterforces.py
```

### Configuración de los Scripts

Antes de ejecutar los scripts, puedes modificar estas variables según tus necesidades:

**En attack_api.sh:**
```bash
API_URL="http://localhost:8000"
TARGET_USER="DGIM"  # Cambiar por el usuario que quieres probar
```

**Contraseñas a probar (en el script):**
```bash
PASSWORDS=("2106" "password123" "admin" "test123" "Password1!")
```

### Ejemplo de Uso Paso a Paso

1. **Iniciar la API:**
```bash
uvicorn ApiCRUD:app --reload --port 8000
```

2. **En otra terminal, ejecutar las pruebas:**
```bash
./attack_api.sh
```

3. **Observar los resultados** en la consola

### Crear Archivo de Diccionario Personalizado

Para pruebas más extensas, crea un archivo `passwords.txt`:

```bash
echo "2106" > passwords.txt
echo "password123" >> passwords.txt
echo "admin" >> passwords.txt
echo "123456" >> passwords.txt
echo "test" >> passwords.txt
```

## Ejemplos de Uso de la API

### Crear un nuevo usuario
```bash
curl -X POST "http://localhost:8000/users" \
-H "Content-Type: application/json" \
-d '{
  "id": 2,
  "username": "usuario_prueba",
  "password": "clave_secreta",
  "email": "prueba@email.com",
  "is_activate": true
}'
```

### Intentar login
```bash
curl -X POST "http://localhost:8000/login" \
-H "Content-Type: application/json" \
-d '{
  "username": "DGIM",
  "password": "2106"
}'
```

### Listar todos los usuarios
```bash
curl -X GET "http://localhost:8000/users"
```

## Interpretación de Resultados

Al ejecutar las pruebas de fuerza bruta, observarás:

- **Intentos fallidos:** Indicados con "Falló" 
- **Login exitoso:** Indicado con "CONTRASEÑA ENCONTRADA" 
- **Estadísticas:** Número total de intentos y tasa de éxito
- **Tiempo de ejecución:** Tiempo total del ataque

## Consideraciones de Seguridad

### Para Entornos de Producción
Esta implementación es básica y para fines educativos. En producción se debe:

1. Implementar hash de contraseñas (bcrypt, argon2)
2. Agregar rate limiting
3. Usar autenticación JWT
4. Implementar logs de seguridad
5. Validar y sanitizar todas las entradas

### Uso Ético
- EJECUTAR SOLO EN ENTORNOS DE DESARROLLO
- USAR SOLO CUENTAS DE PRUEBA CREADAS PARA ESTE PROPÓSITO
- NUNCA USAR CONTRA SISTEMAS EN PRODUCCIÓN
- RESPETAR TODAS LAS LEYES Y REGULACIONES LOCALES

## Solución de Problemas

### La API no inicia
- Verificar que el puerto 8000 esté libre
- Revisar que todas las dependencias estén instaladas
- Comprobar que el archivo ApiCRUD.py esté en el directorio correcto

### Los scripts no ejecutan
- Asegurarse de que tienen permisos de ejecución: `chmod +x *.sh`
- Verificar que la ruta de Python sea correcta en los scripts
- Comprobar que la API esté ejecutándose antes de lanzar las pruebas

### Las pruebas no encuentran la API
- Verificar que la URL en los scripts coincida con donde se ejecuta la API
- Comprobar que no hay firewalls bloqueando la conexión
- Asegurarse de que la API esté respondiendo en /login

## Conclusión

Este proyecto demuestra cómo implementar una API CRUD básica y cómo realizar pruebas de seguridad controladas para entender vulnerabilidades comunes. Los resultados ayudan a comprender la importancia de implementar medidas de seguridad robustas en aplicaciones web.
