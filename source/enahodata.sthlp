{smcl}
{* *! version 0.0.2 15jan2025}

{p2colset 1 16 18 2}{...}
{p2col:{bf:enahodata} {hline 2}}Automatiza la descarga de información de la Encuesta Nacional de Hogares (ENAHO) que realiza el Instituto Nacional de Estadística e Informática del Perú cada año. (corte transversal y panel){p_end}
{p2colreset}{...}

{marker syntax}{...}
{title:Syntax}

{p 8 16 2}
{cmd:enahodata} {cmd:,} {opt modulo(string)} {opt año(string)} [{opt panel} {opt path(string)} {opt descomprimir} {opt preserve} {opt condition(string)} {opt replace} {opt load}]

{dlgtab:Description} 

{pstd}
El comando {cmd:enahodata} facilita la descarga y el procesamiento de datos de la
Encuesta Nacional de Hogares (ENAHO) de Perú, publicados por el INEI.  
Permite manejar tanto datos de {it:corte transversal} como de {it:panel} (2011–en adelante).  
Soporta múltiples módulos y años, la descompresión de archivos ZIP, el filtrado de datos,
y la carga automática de los archivos {it:.dta} en memoria.

{phang}
Existen dos grandes categorías de módulos disponibles:

	{bf:1) Corte Transversal (generalmente 2004–presente)}  
	Se identifican con códigos como {cmd:01}, {cmd:02}, {cmd:03}, {cmd:34}, etc.

{col 10}{hline 80}
{col 10}{cmd:ID módulo}  {col 28} Descripción
{col 10}{hline 80}
{col 10}{cmd:01}        {col 28} Características de la Vivienda y del Hogar  
{col 10}{cmd:02}        {col 28} Características de los Miembros del Hogar  
{col 10}{cmd:03}        {col 28} Educación  
{col 10}{cmd:04}        {col 28} Salud  
{col 10}{cmd:05}        {col 28} Empleo e Ingresos  
{col 10}{cmd:07}        {col 28} Gastos en Alimentos y Bebidas  
{col 10}{cmd:08}        {col 28} Instituciones Benéficas  
{col 10}{cmd:09}        {col 28} Mantenimiento de la Vivienda  
{col 10}{cmd:10}        {col 28} Transportes y Comunicaciones  
{col 10}{cmd:11}        {col 28} Servicios a la Vivienda  
{col 10}{cmd:12}        {col 28} Esparcimiento, Diversión y Cultura  
{col 10}{cmd:13}        {col 28} Vestido y Calzado  
{col 10}{cmd:15}        {col 28} Gastos de Transferencias  
{col 10}{cmd:16}        {col 28} Muebles y Enseres  
{col 10}{cmd:17}        {col 28} Otros Bienes y Servicios  
{col 10}{cmd:18}        {col 28} Equipamiento del Hogar  
{col 10}{cmd:22}        {col 28} Producción Agrícola  
{col 10}{cmd:23}        {col 28} Subproductos Agrícolas  
{col 10}{cmd:24}        {col 28} Producción Forestal  
{col 10}{cmd:25}        {col 28} Gastos en Actividades Agrícolas y Forestales  
{col 10}{cmd:26}        {col 28} Producción Pecuaria  
{col 10}{cmd:27}        {col 28} Subproductos Pecuarios  
{col 10}{cmd:28}        {col 28} Gastos en Actividades Pecuarias  
{col 10}{cmd:34}        {col 28} Sumarias (Variables Calculadas)  
{col 10}{cmd:37}        {col 28} Programas Sociales (Miembros del Hogar)  
{col 10}{cmd:77}        {col 28} Ingresos del Trabajador Independiente  
{col 10}{cmd:78}        {col 28} Bienes y Servicios de Cuidados Personales  
{col 10}{cmd:84}        {col 28} Participación Ciudadana  
{col 10}{cmd:85}        {col 28} Gobernabilidad, Democracia y Transparencia  
{col 10}{cmd:1825}      {col 28} Olla Común  
{col 10}{hline 80}

	{bf:2) Panel (2011–presente)}  
	Se identifican con códigos como {cmd:1474}, {cmd:1475}, {cmd:1476}, etc.,  
	o con los mismos códigos transversales en algunos casos (p. ej. {cmd:01}, {cmd:03}).

{col 10}{hline 80}
{col 10}{cmd:ID módulo} {col 28} Descripción
{col 10}{hline 80}
{col 10}{cmd:1474}      {col 28} (2018–presente) Características de la Vivienda y del Hogar  
{col 10}{cmd:1475}      {col 28} (2018–presente) Educación  
{col 10}{cmd:1476}      {col 28} (2018–presente) Salud  
{col 10}{cmd:1477}      {col 28} (2018–presente) Empleo e Ingresos  
{col 10}{cmd:1478}      {col 28} (2018–presente) Sumarias (Variables Calculadas)  
{col 10}{cmd:1479}      {col 28} (2018–presente) Características de los Miembros del Hogar  
{col 10}{cmd:01}        {col 28} (2011–2017) Vivienda y Hogar  
{col 10}{cmd:03}        {col 28} (2011–2017) Educación  
{col 10}{cmd:04}        {col 28} (2011–2017) Salud  
{col 10}{cmd:05}        {col 28} (2011–2017) Empleo e Ingresos  
{col 10}{cmd:34}        {col 28} (2011–2017) Sumarias  
{col 10}{hline 80}

{dlgtab:Options} 
{synoptset 20 tabbed}
{synopthdr}
{synoptline}
{synopt :{opt mod:ulo(string)}}Lista de módulos a descargar, por ejemplo {cmd:"01"} o {cmd:"1474"}. {it:Obligatorio}.{p_end}
{synopt :{opt año(string)}}Lista de años a procesar, por ejemplo {cmd:"2020 2021"}. {it:Obligatorio}.{p_end}
{synopt :{opt panel}}Indica que se utilizan datos del Panel ENAHO (2011–presente).{p_end}
{synopt :{opt path(string)}}Directorio donde se guardarán los archivos. Por defecto, el directorio actual.{p_end}
{synopt :{opt des:comprimir}}Descomprime los archivos ZIP descargados en subcarpetas organizadas por módulo y año.{p_end}
{synopt :{opt pres:erve}}Guarda el estado de la base de datos antes de ejecutar {cmd:enahodata} (Stata {cmd:preserve}).{p_end}
{synopt :{opt condition(string)}}Aplica un filtro opcional a los datos. Por ejemplo, {cmd:"region==6"}.{p_end}
{synopt :{opt replace}}Sobrescribe archivos existentes durante la descarga y/o descompresión.{p_end}
{synopt :{opt load}}Carga en memoria los archivos {it:.dta} tras descomprimir.{p_end}
{synoptline}


{dlgtab:Examples} 

{pstd}{bf:Ejemplo 1: Descargar ENAHO Corte Transversal}{p_end}

{phang2}{cmd:. enahodata, modulo("01") año("2023") path("/path/to/directory") descomprimir load replace}

{phang2}{cmd:. enahodata, mod("01") año("2023") path("/path/to/directory") des load replace}

{pstd}{it:Comportamiento:}  

{phang2}- Descarga el archivo ZIP correspondiente a {cmd:01} (por ejemplo, {cmd:906-Modulo01.zip}) para el año 2023.{p_end}
{phang2}- Lo guarda en {cmd:/path/to/directory/modulo_01_2023.zip}.{p_end}
{phang2}- Crea la carpeta {cmd:/path/to/directory/modulo_01_2023/} y descomprime los {it:.dta}.{p_end}
{phang2}- Carga en memoria el primer {it:.dta}, si existe.{p_end}

{pstd}{bf:Ejemplo 2: Descargar ENAHO Panel}{p_end}

{phang2}{cmd:. enahodata, modulo("1474") año("2023") panel path("/path/to/directory") descomprimir load replace}

{phang2}{cmd:. enahodata, mod("1474") año("2023") panel path("/path/to/directory") des load replace}

{pstd}{it:Comportamiento:}  

{phang2}- Identifica {cmd:2023} como panel y mapea al código INEI adecuado (p. ej. {cmd:912-Modulo1474.zip}).{p_end}
{phang2}- Descarga y descomprime en {cmd:/path/to/directory/modulo_1474_2023/}.{p_end}
{phang2}- Carga el primer {it:.dta} en memoria.{p_end}

{pstd}{bf:Ejemplo 3: Descargar sin descomprimir}{p_end}

{phang2}{cmd:. enahodata, modulo("01") año("2022") path("/path/to/directory") replace}

{pstd}{it:Comportamiento:}  

{phang2}- No especifica {cmd:descomprimir} ni {cmd:load}, por lo que sólo descarga el archivo ZIP y lo deja intacto.{p_end}

{pstd}{bf:Ejemplo 4: Descargar varios años y módulos}{p_end}

{phang2}{cmd:. enahodata, modulo("01 02") año("2022 2023") path("/path/to/directory") descomprimir load}

{phang2}{cmd:. enahodata, mod("01 02") año("2022 2023") path("/path/to/directory") des load}

{pstd}{it:Comportamiento:}  

{phang2}- Genera combinaciones: {cmd:2022-01}, {cmd:2022-02}, {cmd:2023-01}, {cmd:2023-02}, descargando y descomprimiendo para cada una.{p_end}

{dlgtab:Remarks} 

{phang2}- Verifique que los códigos de módulo y años estén disponibles en la plataforma del INEI.{p_end}
{phang2}- Con la opción {cmd:load}, solo se cargan en memoria archivos {it:.dta}.{p_end}
{phang2}- La lógica interna del programa asocia años y códigos de panel según las nomenclaturas oficiales del INEI.{p_end}

{psee}
Online:  {manhelp copy G}, {help usebcrp}, {help wbopendata}.

{marker author}{...}
{title:Author}

{pstd}Maykol Medrano{break}
Instituto de Economía UC.{break}
Email: {browse "mailto:mmedrano2@uc.cl":mmedrano2@uc.cl}
{p_end}

{marker support}{...}
{title:Support and updates}

{pstd}{cmd:enahodata} Revisa más actualizaciones en: 
({browse "https://github.com/MaykolMedrano/enahodata":Github repo}).{p_end}



