enahodata (versión Stata)
=========================

Este **comando** de Stata, llamado enahodata2, permite **descargar** y (opcionalmente) **descomprimir** los datos de la **Encuesta Nacional de Hogares (ENAHO)**, la cual se realiza cada año desde 2004 en Perú. Además, incluye la **opción** para descargar **datos de panel** (ENAHO PANEL).

> **Ficha técnica**: [Consulta aquí](https://proyectos.inei.gob.pe/iinei/srienaho/Descarga/FichaTecnica/498-Ficha.pdf)

Contenido
---------

*   [Módulos de la Encuesta (Corte transversal)](https://chatgpt.com/c/67781e33-0f40-8013-930f-c5b8ab1dca25#módulos-de-la-encuesta-nacional-de-hogares-enaho)
    
*   [Datos de panel](https://chatgpt.com/c/67781e33-0f40-8013-930f-c5b8ab1dca25#datos-de-panel)
    
*   [I. Instalación](https://chatgpt.com/c/67781e33-0f40-8013-930f-c5b8ab1dca25#i-instalacion)
    
*   [II. Descripción del comando](https://chatgpt.com/c/67781e33-0f40-8013-930f-c5b8ab1dca25#ii-descripción-del-comando)
    
*   [III. Ejemplos prácticos](https://chatgpt.com/c/67781e33-0f40-8013-930f-c5b8ab1dca25#iii-ejemplo-práctico)
    
*   [Licencia](https://chatgpt.com/c/67781e33-0f40-8013-930f-c5b8ab1dca25#licencia)
    

Módulos de la Encuesta Nacional de Hogares (ENAHO)
--------------------------------------------------

### Corte transversal

Nro | Código Módulo | Módulo | Preguntas
:-------|:-------|:---------|:------
1|`01`|Características de la Vivienda y del Hogar|[Preguntas](https://proyectos.inei.gob.pe/microdatos/Detalle_Encuesta.asp?CU=19558&CodEncuesta=906&CodModulo=01&NombreEncuesta=Condiciones+de+Vida+y+Pobreza+-+ENAHO&NombreModulo=Características+de+la+Vivienda+y+del+Hogar)
2|`02`|Características de los Miembros del Hogar|[Preguntas](https://proyectos.inei.gob.pe/microdatos/Detalle_Encuesta.asp?CU=19558&CodEncuesta=906&CodModulo=02&NombreEncuesta=Condiciones+de+Vida+y+Pobreza+-+ENAHO&NombreModulo=Características+de+los+Miembros+del+Hogar)
3|`03`|Educación|[Preguntas](https://proyectos.inei.gob.pe/microdatos/Detalle_Encuesta.asp?CU=19558&CodEncuesta=906&CodModulo=03&NombreEncuesta=Condiciones+de+Vida+y+Pobreza+-+ENAHO&NombreModulo=Educación)
4|`04`|Salud|[Preguntas](https://proyectos.inei.gob.pe/microdatos/Detalle_Encuesta.asp?CU=19558&CodEncuesta=906&CodModulo=04&NombreEncuesta=Condiciones+de+Vida+y+Pobreza+-+ENAHO&NombreModulo=Salud)
5|`05`|Empleo e Ingresos|[Preguntas](https://proyectos.inei.gob.pe/microdatos/Detalle_Encuesta.asp?CU=19558&CodEncuesta=906&CodModulo=05&NombreEncuesta=Condiciones+de+Vida+y+Pobreza+-+ENAHO&NombreModulo=Empleo+e+Ingresos)
6|`07`|Gastos en Alimentos y Bebidas (Módulo 601)|[Preguntas](https://proyectos.inei.gob.pe/microdatos/Detalle_Encuesta.asp?CU=19558&CodEncuesta=906&CodModulo=07&NombreEncuesta=Condiciones+de+Vida+y+Pobreza+-+ENAHO&NombreModulo=Gastos+en+Alimentos+y+Bebidas+(Módulo+601))
7|`08`|Instituciones Beneficas|[Preguntas](https://proyectos.inei.gob.pe/microdatos/Detalle_Encuesta.asp?CU=19558&CodEncuesta=906&CodModulo=08&NombreEncuesta=Condiciones+de+Vida+y+Pobreza+-+ENAHO&NombreModulo=Instituciones+Beneficas)
8|`09`|Mantenimiento de la Vivienda|[Preguntas](https://proyectos.inei.gob.pe/microdatos/Detalle_Encuesta.asp?CU=19558&CodEncuesta=906&CodModulo=09&NombreEncuesta=Condiciones+de+Vida+y+Pobreza+-+ENAHO&NombreModulo=Mantenimiento+de+la+Vivienda)
9|`10`|Transportes y Comunicaciones|[Preguntas](https://proyectos.inei.gob.pe/microdatos/Detalle_Encuesta.asp?CU=19558&CodEncuesta=906&CodModulo=10&NombreEncuesta=Condiciones+de+Vida+y+Pobreza+-+ENAHO&NombreModulo=Transportes+y+Comunicaciones)
10|`11`|Servicios a la Vivienda|[Preguntas](https://proyectos.inei.gob.pe/microdatos/Detalle_Encuesta.asp?CU=19558&CodEncuesta=906&CodModulo=11&NombreEncuesta=Condiciones+de+Vida+y+Pobreza+-+ENAHO&NombreModulo=Servicios+a+la+Vivienda)
11|`12`|Esparcimiento , Diversion y Servicios de Cultura|[Preguntas](https://proyectos.inei.gob.pe/microdatos/Detalle_Encuesta.asp?CU=19558&CodEncuesta=906&CodModulo=12&NombreEncuesta=Condiciones+de+Vida+y+Pobreza+-+ENAHO&NombreModulo=Esparcimiento+,+Diversion+y+Servicios+de+Cultura)
12|`13`|Vestido y Calzado|[Preguntas](https://proyectos.inei.gob.pe/microdatos/Detalle_Encuesta.asp?CU=19558&CodEncuesta=906&CodModulo=13&NombreEncuesta=Condiciones+de+Vida+y+Pobreza+-+ENAHO&NombreModulo=Vestido+y+Calzado)
13|`15`|Gastos de Transferencias|[Preguntas](https://proyectos.inei.gob.pe/microdatos/Detalle_Encuesta.asp?CU=19558&CodEncuesta=906&CodModulo=15&NombreEncuesta=Condiciones+de+Vida+y+Pobreza+-+ENAHO&NombreModulo=Gastos+de+Transferencias)
14|`16`|Muebles y Enseres|[Preguntas](https://proyectos.inei.gob.pe/microdatos/Detalle_Encuesta.asp?CU=19558&CodEncuesta=906&CodModulo=16&NombreEncuesta=Condiciones+de+Vida+y+Pobreza+-+ENAHO&NombreModulo=Muebles+y+Enseres)
15|`17`|Otros Bienes y Servicios|[Preguntas](https://proyectos.inei.gob.pe/microdatos/Detalle_Encuesta.asp?CU=19558&CodEncuesta=906&CodModulo=17&NombreEncuesta=Condiciones+de+Vida+y+Pobreza+-+ENAHO&NombreModulo=Otros+Bienes+y+Servicios)
16|`18`|Equipamiento del Hogar|[Preguntas](https://proyectos.inei.gob.pe/microdatos/Detalle_Encuesta.asp?CU=19558&CodEncuesta=906&CodModulo=18&NombreEncuesta=Condiciones+de+Vida+y+Pobreza+-+ENAHO&NombreModulo=Equipamiento+del+Hogar)
17|`22`|Producción Agrícola|[Preguntas](https://proyectos.inei.gob.pe/microdatos/Detalle_Encuesta.asp?CU=19558&CodEncuesta=906&CodModulo=22&NombreEncuesta=Condiciones+de+Vida+y+Pobreza+-+ENAHO&NombreModulo=Producción+Agrícola)
18|`23`|Subproductos Agricolas|[Preguntas](https://proyectos.inei.gob.pe/microdatos/Detalle_Encuesta.asp?CU=19558&CodEncuesta=906&CodModulo=23&NombreEncuesta=Condiciones+de+Vida+y+Pobreza+-+ENAHO&NombreModulo=Subproductos+Agricolas)
19|`24`|Producción Forestal|[Preguntas](https://proyectos.inei.gob.pe/microdatos/Detalle_Encuesta.asp?CU=19558&CodEncuesta=906&CodModulo=24&NombreEncuesta=Condiciones+de+Vida+y+Pobreza+-+ENAHO&NombreModulo=Producción+Forestal)
20|`25`|Gastos en Actividades Agricolas y/o Forestales|[Preguntas](https://proyectos.inei.gob.pe/microdatos/Detalle_Encuesta.asp?CU=19558&CodEncuesta=906&CodModulo=25&NombreEncuesta=Condiciones+de+Vida+y+Pobreza+-+ENAHO&NombreModulo=Gastos+en+Actividades+Agricolas+y/o+Forestales)
21|`26`|Producción Pecuaria|[Preguntas](https://proyectos.inei.gob.pe/microdatos/Detalle_Encuesta.asp?CU=19558&CodEncuesta=906&CodModulo=26&NombreEncuesta=Condiciones+de+Vida+y+Pobreza+-+ENAHO&NombreModulo=Producción+Pecuaria)
22|`27`|Subproductos Pecuarios|[Preguntas](https://proyectos.inei.gob.pe/microdatos/Detalle_Encuesta.asp?CU=19558&CodEncuesta=906&CodModulo=27&NombreEncuesta=Condiciones+de+Vida+y+Pobreza+-+ENAHO&NombreModulo=Subproductos+Pecuarios)
23|`28`|Gastos en Actividades Pecuarias|[Preguntas](https://proyectos.inei.gob.pe/microdatos/Detalle_Encuesta.asp?CU=19558&CodEncuesta=906&CodModulo=28&NombreEncuesta=Condiciones+de+Vida+y+Pobreza+-+ENAHO&NombreModulo=Gastos+en+Actividades+Pecuarias)
24|`34`|Sumarias ( Variables Calculadas )|[Preguntas](https://proyectos.inei.gob.pe/microdatos/Detalle_Encuesta.asp?CU=19558&CodEncuesta=906&CodModulo=34&NombreEncuesta=Condiciones+de+Vida+y+Pobreza+-+ENAHO&NombreModulo=Sumarias+(+Variables+Calculadas+))
25|`37`|Programas Sociales (Miembros del Hogar)|[Preguntas](https://proyectos.inei.gob.pe/microdatos/Detalle_Encuesta.asp?CU=19558&CodEncuesta=906&CodModulo=37&NombreEncuesta=Condiciones+de+Vida+y+Pobreza+-+ENAHO&NombreModulo=Programas+Sociales++(Miembros+del+Hogar))
26|`77`|Ingresos del Trabajador Independiente|[Preguntas](https://proyectos.inei.gob.pe/microdatos/Detalle_Encuesta.asp?CU=19558&CodEncuesta=906&CodModulo=77&NombreEncuesta=Condiciones+de+Vida+y+Pobreza+-+ENAHO&NombreModulo=Ingresos+del+Trabajador+Independiente)
27|`78`|Bienes y Servicios de Cuidados Personales|[Preguntas](https://proyectos.inei.gob.pe/microdatos/Detalle_Encuesta.asp?CU=19558&CodEncuesta=906&CodModulo=78&NombreEncuesta=Condiciones+de+Vida+y+Pobreza+-+ENAHO&NombreModulo=Bienes+y+Servicios+de+Cuidados+Personales)
28|`84`|Participación Ciudadana|[Preguntas](https://proyectos.inei.gob.pe/microdatos/Detalle_Encuesta.asp?CU=19558&CodEncuesta=906&CodModulo=84&NombreEncuesta=Condiciones+de+Vida+y+Pobreza+-+ENAHO&NombreModulo=Participación+Ciudadana)
29|`85`|Gobernabilidad, Democracia y Transparencia|[Preguntas](https://proyectos.inei.gob.pe/microdatos/Detalle_Encuesta.asp?CU=19558&CodEncuesta=906&CodModulo=85&NombreEncuesta=Condiciones+de+Vida+y+Pobreza+-+ENAHO&NombreModulo=Gobernabilidad,+Democracia+y+Transparencia)
30|`1825`|Beneficiarios de Instituciones sin fines de lucro: Olla comun|[Preguntas](https://proyectos.inei.gob.pe/microdatos/Detalle_Encuesta.asp?CU=19558&CodEncuesta=906&CodModulo=1825&NombreEncuesta=Condiciones+de+Vida+y+Pobreza+-+ENAHO&NombreModulo=Beneficiarios+de+Instituciones+sin+fines+de+lucro:+Olla+Común)

---

### Datos de panel

Nro | Año           | Código Módulo | Módulo
:---|:-------------:|:------------:|:-----------------------------------------
1|2023-2018|`1474`|Características de la Vivienda y del Hogar
2|2023-2018|`1475`|Educación
3|2023-2018|`1476`|Salud
4|2023-2018|`1477`|Empleo e Ingresos
5|2023-2018|`1478`|Sumarias ( Variables Calculadas )
6|2023-2018|`1479`|Características de los Miembros del Hogar
7|2017-2011|`01`|Características de la Vivienda y del Hogar
8|2017-2011|`03`|Educación
9|2017-2011|`04`|Salud
10|2017-2011|`05`|Empleo e Ingresos
11|2017-2011|`34`|Sumarias( Variables calculadas )
12|2017-2011|`1314`|Características de los Miembros del Hogar

I. Instalación
--------------
Copie el siguiente codigo en Stata y ejecute.
```
cap ado uninstall enahodata 
net install enahodata, from(https://github.com/MaykolMedrano/enahodata/raw/master/source/)
```


II. Descripción del comando
---------------------------

El comando principal es enahodata. Su **sintaxis** es:

```
enahodata, ///
  MODulo(string) ///
  año(string)    ///
  [ ///
    panel            ///
    path(string)     ///
    DEScomprimir     ///
    PREServe         ///
    condition(string) ///
    replace          ///
    load
  ]
```

### Parámetros:

*   **modulo(string)**: lista de **códigos** de módulo (por ejemplo, "01 02 03").
    
*   **año(string)**: lista de **años** (por ejemplo, "2022 2023").
    
*   **panel**: (opcional) indica que se descarga la **ENAHO panel** en lugar de la ENAHO regular.
    
*   **path(string)**: ruta de la carpeta de destino para guardar los ZIP y/o descomprimir.
    
*   **descomprimir**: si se incluye, se descomprime el ZIP.
    
*   **PREServe**: (opcional) para guardar el estado actual de la data.
    
*   **condition(string)**: (opcional) para filtrar observaciones si se **carga** un .dta.
    
*   **replace**: si se incluye, sobrescribe archivos existentes.
    
*   **load**: si se incluye, busca y **carga** en memoria un .dta mayor a 5 MB (según la lógica interna).
    

III. Ejemplo práctico
---------------------

### 1) Descargar ENAHO Corte Transversal

**Ejemplo**: Descargar el **módulo 01** del **año 2023**, descomprimir y cargar el primer .dta encontrado (>5MB), en la carpeta C:\\Users\\User\\Desktop\\pruebas\\stata, sobrescribiendo si existiera:

```
enahodata, modulo("01") año("2023") ///
    path("/path/to/your/directory") ///
    DEScomprimir load replace
```
**Comportamiento**:

1.  Baja el archivo 906-Modulo01.zip desde la URL oficial.
    
2.  Lo almacena en "/path/to/your/directory/modulo_01_2023.zip.
    
3.  Si se especificó descomprimir, crea la carpeta /path/to/your/directory/modulo_01_2023 y extrae los .dta.
    
4.  Si se incluyó load, busca un .dta mayor a 5 MB y lo **carga en memoria**.
    
5.  Aplica condition(), si está definida.
    
6.  Sobrescribe (replace) todo si ya existían archivos.
    

### 2) Descargar ENAHO Panel

**Ejemplo**: Descargar el **módulo 1474** del **año 2023** (panel), descomprimir y cargar en memoria:

```
enahodata, modulo("1474") año("2023") ///
    panel ///
    path("/path/to/your/directory") ///
    DEScomprimir load replace
```

**Comportamiento**:

1.  Usa la tabla de códigos **panel** y detecta que 2023 corresponde a inei_code=912.
    
2.  Descarga 912-Modulo1474.zip y lo guarda en "/path/to/your/directory/modulo_1474_2023.zip".
    
3.  Lo descomprime en "/path/to/your/directory/modulo_1474_2023".
    
4.  Carga en memoria el primer .dta encontrado que supere los 5 MB.
    
5.  Elimina el ZIP tras cargar, si así está definido en la lógica interna.
    

### 3) Descargar sin descomprimir

Si quieres **solo** descargar el ZIP (sin descomprimir ni cargar en memoria):
```
enahodata, modulo("01") año("2022") ///
    path("/path/to/your/directory") ///
    replace
```
**No** incluyes ni descomprimir ni load. De esa manera, el ZIP se mantendrá **intacto** en la carpeta destino.

### 4) Descargar varios años y módulos

Supón que deseas **módulos 01 y 02** para **2022 y 2023**. Sencillamente:

```
enahodata, ///
    modulo("01 02") ///
    año("2022 2023") ///
    path("/path/to/your/directory") ///
    DEScomprimir load
```
Generará todas las combinaciones (2022 - 01, 2022 - 02, 2023 - 01, 2023 - 02) y seguirá la misma lógica para cada par.

### Nota sobre archivos .dta

El **programa** tiene internamente un umbral de 5 MB para **cargar** un .dta.Si deseas manejarlo de otra forma (por ejemplo, cargar **todos** los .dta o usar append), podrías modificar el bloque interno de load.

Licencia
--------

Este repositorio está autorizado bajo la **licencia MIT**. Ver [LICENSE](https://chatgpt.com/c/LICENSE) para más detalles.

**¡Listo!** Con este comando enahodata2, ya puedes automatizar la **descarga** y (opcional) **carga** de datos **ENAHO** (corte transversal o panel) dentro de **Stata**.

## Notas

Los datos se descargarán en formato zip. Es necesario crear una carpeta. 
- Más información en el archivo de
