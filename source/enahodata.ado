*! enahodata: 
*! Version 2.3.1: 2020/10/02
*! Author: Maykol Medrano
*! Department of Economics
*! CICEPP
*! maykolmedrano35@gmail.com


capture program drop enahodata
program define enahodata
	vers 15.0
	set more off
	
	
syntax name(id="inei" name=place), 	              ///
						modulo(string)		  	  ///
						año(string)               ///
								 	              ///
						[						  ///
								year(numlist) 	  ///
								PREServe		  ///
								condition(string) ///
						]

if length("`preserve'") != 0 {
		tempfile init
		cap save `init', replace
}

clear


if length(`"`place'"') != 0 {
		local place `place'

}

if length(`"`modulo'"') != 0 {
		local id_modulo `id_modulo'
}		

********************************************************************************
*** CODIGO DE ESCUESTA POR AÑO
********************************************************************************
	//Intercambiamos el codigo por el año de encuesta

	if "`año'"=="2019" {
		local año 641
		local year 2019
	}
	else if "`año'"=="2018" {
		local año 634
		local year 2018
	}
	else if "`año'"=="2017" {
		local año 603
		local year 2017
	}
	else if "`año'"=="2016" {
		local año 546
		local year 2016
	}
	else if "`año'"=="2015" {
		local año 498
		local year 2015
	}
	else if "`año'"=="2014" {
		local año 440
		local year 2014	
	}	
	else if "`año'"=="2013" {
		local año 404
		local year 2013
	}
	else if "`año'"=="2012" {
		local año 324
		local year 2012
	}
	else if "`año'"=="2011" {
		local año 291
		local year 2011
	}
	else if "`año'"=="2010" {
		local año 279
		local year 2010
	}
	else if "`año'"=="2009" {
		local año 285
		local year 2009
	}
	else if "`año'"=="2008" {
		local año 284
		local year 2008
	}
	else if "`año'"=="2007" {
		local año 283
		local year 2007
	}
	else if "`año'"=="2006" {
		local año 282
		local year 2006
	}
	else if "`año'"=="2005" {
		local año 281
		local year 2005
	}
	else if "`año'"=="2004" {
		local año 280
		local year 2004
	}
	
********************************************************************************
*** Remplazamos los valores de sintaxis
********************************************************************************
	//Usamos el comando nativo copy para descargar los datos
	
copy "http://iinei.`place'.gob.pe/iinei/srienaho/descarga/STATA/`año'-Modulo`modulo'.zip"  modulo_`modulo'_`year'.zip


di in green "Importing modulo_`modulo'_`año' from {browse www.inei.gob.pe/bases-de-datos:INEI database}"	
	di in green "Descarga exitosa"
	di in green "{text} Consulte por más datos aquí:{browse www.inei.gob.pe:www.inei.gob.pe}"
	
end

