# Facturación Electrónica - Laravel + Docker

Este proyecto es una aplicación de facturación electrónica desarrollada en Laravel y dockerizada para facilitar su despliegue.

## Requisitos

- [Docker](https://www.docker.com/products/docker-desktop) instalado
- [Docker Compose](https://docs.docker.com/compose/) (ya viene incluido con Docker Desktop)

---

## 🚀 Pasos para levantar el entorno

### 1. Clonar el repositorio

```bash
git clone https://github.com/cesarmoreno6817/facturacionElectronica.git
cd facturacionElectronica
```

### 2. Crear el archivo .env

Copia el archivo .env.example como .env:

```bash
cp .env.example .env
```

### 3. Levantar los contenedores

```bash
docker compose up -d --build
```

Esto hará lo siguiente:

- Construirá la imagen de la aplicación Laravel

- Creará y levantará un contenedor para la base de datos MySQL

- Ejecutará las migraciones automáticamente (si así lo configuraste)

### 4. 🛠️ Acceso a la aplicación

Una vez levantado el entorno, puedes acceder desde tu navegador:

http://localhost:8000

### 🧪 Comandos útiles

Ver logs del contenedor de la aplicación:

```bash
docker compose logs -f app
```

Ingresar a la terminal del contenedor:

```bash
docker compose exec app bash
```

Detener los contenedores:

```bash
docker compose down
```

Detener y eliminar los contenedores y volúmenes (¡elimina la base de datos!):

    docker compose down -v

### 📦 Estructura de servicios

    app: Contenedor con Laravel + Apache + PHP

    db: Contenedor MySQL 8.0

### 📝 Notas

- Las migraciones se ejecutan automáticamente al levantar los contenedores.

- Asegúrate de que el puerto 3306 o 8000 no esté ocupado por otros servicios locales.
