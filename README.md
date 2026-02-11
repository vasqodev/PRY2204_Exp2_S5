# Evaluación Sumativa Semana 5: Caso "Retail Solari S.A."

## Descripción del Proyecto
Este repositorio contiene la solución para el caso de negocio **Retail Solari S.A.**. El objetivo del trabajo fue tomar un requerimiento de base de datos que estaba incompleto y sin normalizar, para transformarlo en un modelo robusto, aplicando las reglas de normalización y generando finalmente el script SQL.

## Desarrollo del modelo

Para llegar a la solución, realicé los siguientes pasos en **Oracle SQL Developer Data Modeler**:

### 1. Normalización (3FN)
Lo primero fue arreglar los problemas de diseño del caso original para cumplir con la Tercera Forma Normal:
- **Comunas:** Saqué el nombre de la comuna de la entidad `Sucursal` y creé una entidad aparte llamada `COMUNA` para evitar redundancia.
- **Detalle de Venta:** Para manejar la relación muchos a muchos entre `VENTA` y `PRODUCTO`, y para guardar el precio histórico de venta, creé la entidad `DETALLE_VENTA`.

### 2. Manejo de Jerarquías (Herencia)
El caso especificaba que los proveedores podían ser de dos tipos. Usé la herramienta de **Herencia** (Subtipos y Supertipos):
- **Entidad Padre:** `PROVEEDOR` (datos comunes como dirección y teléfono).
- **Entidades Hijas:** `EMPRESA` (Razón social, RUT empresa) y `INDIVIDUO` (Nombre, DNI).

### 3. Reglas de Negocio Específicas
- **Transferencia de Identidad:** Apliqué una **relación identificadora** (línea sólida) entre `SUCURSAL` y `PRODUCTO`. Esto hace que el código de la sucursal sea parte de la clave primaria del producto, cumpliendo con el requerimiento de que "la sucursal transfiere su identificación".
- **Atributos:** Definí los tipos de datos lógicos (Integer, Varchar, Date) y marqué como **Obligatorios** los campos críticos para asegurar la integridad de los datos.

## Generación del Modelo Relacional
Una vez listo el Modelo Lógico (Barker), utilicé la función de **Ingeniería** (Engineer to Relational Model) para generar automáticamente las tablas y las claves foráneas (FK).

## Contenido del Repositorio
- **Script SQL:** Archivo `.sql` con el código DDL generado para crear la base de datos.
- **Diseño Data Modeler:** Archivos fuente del diseño.
- **Capturas:** Imágenes del Modelo Lógico y Relacional.

---
*Trabajo realizado para la asignatura de Modelamiento de Base de Datos - Duoc UC.*
