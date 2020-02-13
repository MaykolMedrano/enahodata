{smcl}
{* *! version 1.0.0 10jan2020}{...}

{title:Title}

{p2colset 5 16 20 2}{...}
{p2col :{cmd:enahodata} {hline 2}}Download National Household Survey on Living Conditions and Poverty data from INEI - Perú.  {p_end}
{p2colreset}{...}

{title:Syntax}

{p 8 16 2}
{cmd:enahodata inei}
{cmd:,}
{opt modulo(ID_modulo)}
{opt año(año)}

{title:Description}

{pstd}
{cmd:enahodata} is a command which allows download National Household Survey on Living Conditions and Poverty (ENAHO) data from INEI - Perú.


{cmd:ID_modulo} lists the year that the user wishes to download for the module in question; It should generally be between 2004-2020.

	     ID modulo      	 Description of modulo (Spanish)
           {hline 80}
              {cmd:01}		Características de la Vivienda y del Hogar
              {cmd:02}		Características de los Miembros del Hogar
              {cmd:03}		Educación
              {cmd:04}		Salud
              {cmd:05}		Empleo e Ingresos
              {cmd:07}		Gastos en Alimentos y Bebidas 
              {cmd:08}		Instituciones Beneficas
              {cmd:09}		Mantenimiento de la Vivienda
              {cmd:10}		Transportes y Comunicaciones
              {cmd:11}		Servicios a la Vivienda
              {cmd:12}		Esparcimiento , Diversion y Servicios de Cultura
              {cmd:13}		Vestido y Calzado
              {cmd:15}		Gastos de Transferencias
              {cmd:16}		Muebles y Enseres
              {cmd:17}		Otros Bienes y Servicios
              {cmd:18}		Equipamiento del Hogar
              {cmd:22}		Producción Agrícola
              {cmd:23}		Subproductos Agricolas
              {cmd:24}		Producción Forestal
              {cmd:25}		Gastos en Actividades Agricolas y/o Forestales
              {cmd:26}		Producción Pecuaria
              {cmd:27}		Subproductos Pecuarios
              {cmd:28}		Gastos en Actividades Pecuarias
              {cmd:34}		Sumarias ( Variables Calculadas )
              {cmd:37}		Programas Sociales (Miembros del Hogar)
              {cmd:77}		Ingresos del Trabajador Independiente
              {cmd:78}		Bienes y Servicios de Cuidados Personales
              {cmd:84}		Participación Ciudadana
              {cmd:85}		Gobernabilidad, Democracia y Transparencia	  
          {hline 80}
		  
{cmd:año} lists the year that the user wishes to download for the module in question; It should generally be between 2004-2020.

	       año      	Description of modulo
           {hline 80}
              {cmd:2004}		Year of start of enaho updated methodology
              {cmd: ..}		
              {cmd: ..}		
              {cmd: ..}		
              {cmd:2020}		
          {hline 80}		  
{marker examples}{...}
{title:Examples}
{pstd}

Select a module of interest and year. Examples:

{pstd}{inp:enahodata inei, modulo(01) año(2018)}{p_end}
{pstd}{inp:enahodata inei, modulo(34) año(2017)}{p_end}

{title:Notes}
{pstd}

If you want to know more about the data you can see in at {browse "http://iinei.inei.gob.pe/microdatos/"}.

{title:Also see}

{psee}
Online:  {manhelp copy G}, {help usebcrp}, {help wbopendata}.

{title:Author}

{pstd}
Maykol Medrano, National University of San Antonio Abad of Cusco. {browse "mailto:maykolmedrano35@gmail.com":maykolmedrano35@gmail.com}
{p_end}


