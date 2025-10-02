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
uvicorn ApiCRUD:app --reload 
```

### Verificar que la API está funcionando
La API estará disponible en: http://localhost

Puedes verificar la documentación interactiva en:
- http://localhost/docs
- http://localhost/redoc

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

## Conclusión

Este proyecto demuestra cómo implementar una API CRUD básica y cómo realizar pruebas de seguridad controladas para entender vulnerabilidades comunes. Los resultados ayudan a comprender la importancia de implementar medidas de seguridad robustas en aplicaciones web.
