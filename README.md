# API CRUD con FastAPI y Script de Fuerza Bruta

Este proyecto consiste en una API CRUD basica desarrollada con FastAPI y un script de bash para realizar pruebas de fuerza bruta contra el endpoint de login.

## Estructura del Proyecto

```
ApiCRUD.py          # API FastAPI con operaciones CRUD para usuarios
bash.sh            # Script de fuerza bruta para testing
```

## API FastAPI - ApiCRUD.py

### Caracteristicas
- **Framework**: FastAPI con SQLModel
- **Almacenamiento**: Lista en memoria (para demostracion)
- **Endpoints disponibles**:

| Metodo | Endpoint | Descripcion |
|--------|----------|-------------|
| POST | /users | Registrar nuevo usuario |
| GET | /users | Listar todos los usuarios |
| GET | /users/{id} | Obtener usuario por ID |
| PUT | /users/{id} | Actualizar usuario |
| DELETE | /deleteUser/{id} | Eliminar usuario |
| POST | /login | Autenticar usuario |

### Modelos de Datos

```python
class User(SQLModel):
    id: int
    username: str
    password: str
    email: str = None
    is_activate: bool
```

### Ejecutar la API
```bash
uvicorn ApiCRUD:app --reload --port 8000
```

## Script de Fuerza Bruta - bash.sh

### Proposito
Script educativo para demostrar vulnerabilidades de seguridad cuando se usan contrasenas numericas cortas.

### Caracteristicas
- Ataque de fuerza bruta contra el endpoint /login
- Configuracion personalizable de longitud de contrasena
- Monitoreo en tiempo real del progreso
- Manejo de respuestas HTTP

### Uso
```bash
chmod +x bash.sh
./bash.sh
```

### Parametros solicitados:
- **Email**: Correo del usuario objetivo (por defecto: daniel@gmail.com)
- **Longitud de contrasena**: Numero de digitos (por defecto: 3)

## Advertencia de Seguridad

**ESTE PROYECTO ES SOLO PARA FINES EDUCATIVOS**

- La API almacena contrasenas en texto plano (NO SEGURO)
- El script de fuerza bruta demuestra una vulnerabilidad real
- NO usar en produccion sin implementar medidas de seguridad adecuadas

## Mejoras de Seguridad Recomendadas

1. Hash de contrasenas (bcrypt, argon2)
2. Limites de intentos de login
3. Contrasenas complejas (minimo 8 caracteres, mezcla de tipos)
4. Rate limiting en endpoints de autenticacion
5. Almacenamiento seguro en base de datos

## Ejemplo de Ejecucion

```
=== Ataque de Fuerza Bruta ===
Email: daniel@gmail.com
Longitud: 3
Total combinaciones: 1000

Iniciando ataque de fuerza bruta...
Probando 1000 combinaciones posibles

Intento 10/1000 - Probando: 009
Intento 20/1000 - Probando: 019
...
>>> CONTRASENA ENCONTRADA! 214

=== RESULTADO FINAL ===
EXITO! Contrasena encontrada: 214
Numero de intentos: 215
Tiempo: Fri Dec 13 10:30:45 UTC 2024
```

## Requisitos

- Python 3.7+
- FastAPI
- SQLModel
- Uvicorn
- curl (para el script bash)

## Notas

Este proyecto demuestra la importancia de:
- Usar contrasenas fuertes y unicas
- Implementar hash seguro de contrasenas
- Anadir medidas anti-fuerza bruta
- Realizar pruebas de seguridad regulares
