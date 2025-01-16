*! enahodata: 
*! Version 0.0.2: 2025/01/09
*! Author: Maykol Medrano
*! Institute of Economics
*! UC
*! mmedrano2@uc.cl

capture program drop enahodata2
program define enahodata2
    version 16.0
    set more off

    /***********************************************************
      1. Definición de sintaxis
    ***********************************************************/
    syntax , 					///
        MODulo(string) 			///
        año(string)    			///
        [ 						///
		  panel					///
          path(string)        	///
          DEScomprimir        	///
          PREServe            	///
          condition(string)   	///
          replace             	///
          load                	///
        ]

    /***********************************************************
      2. Guardar estado si se solicita la opción PREServe
    ***********************************************************/
    if length("`preserve'") != 0 {
        tempfile init
        cap save `init', replace
    }

    clear

    /***********************************************************
      3. Guardar local para `path'
         - Se elimina la lógica de 'place' porque ya no se usa.
    ***********************************************************/
    if length("`path'") == 0 {
        loc path "."
    }

    /***********************************************************
      4. Preparar listas de módulos y años
    ***********************************************************/
    loc yearlist "`año'"
    loc modlist  "`modulo'"

    /***********************************************************
      4a. Chequeamos si se pidió la opción `load`
    ***********************************************************/
    loc do_load = 0
    if "`load'" != "" {
        loc do_load = 1
    }

	/***********************************************************
      4b. Chequeamos si se pidió la opción `panel'
          Si se especifica panel => do_panel = 1
          Caso contrario => do_panel = 0
    ***********************************************************/
    loc do_panel = 0
    if "`panel'" != "" {
        loc do_panel = 1
    }

    /***********************************************************
      5. Bucle por año
    ***********************************************************/
    foreach y of loc yearlist {
		/*******************************************************
         5a. Si es ENAHO PANEL (do_panel=1)
        *******************************************************/
        if `do_panel' == 1 {
            if "`y'"=="2023" {
                loc inei_code 912
                loc year_lab 2023
            }
            else if "`y'"=="2022" {
                loc inei_code 845
                loc year_lab 2022
            }
            else if "`y'"=="2021" {
                loc inei_code 763
                loc year_lab 2021
            }
            else if "`y'"=="2020" {
                loc inei_code 743
                loc year_lab 2020
            }
            else if "`y'"=="2019" {
                loc inei_code 699
                loc year_lab 2019
            }
            else if "`y'"=="2018" {
                loc inei_code 651
                loc year_lab 2018
            }
            else if "`y'"=="2017" {
                loc inei_code 612
                loc year_lab 2017
            }
            else if "`y'"=="2016" {
                loc inei_code 614
                loc year_lab 2016
            }
            else if "`y'"=="2015" {
                loc inei_code 529
                loc year_lab 2015
            }
            else if "`y'"=="2011" {
                loc inei_code 302
                loc year_lab 2011
            }
            else {
                di as error "El año panel `y' no está contemplado."
                continue
            }
        }
		
        /*******************************************************
         5b. Si es ENAHO regular (do_panel=0)
        *******************************************************/
        else {
            if "`y'"=="2023" {
                loc inei_code 906
                loc year_lab 2023
            }
            else if "`y'"=="2022" {
                loc inei_code 784
                loc year_lab 2022
            }
            else if "`y'"=="2021" {
                loc inei_code 759
                loc year_lab 2021
            }
            else if "`y'"=="2020" {
                loc inei_code 737
                loc year_lab 2020
            }
            else if "`y'"=="2019" {
                loc inei_code 687
                loc year_lab 2019
            }
            else if "`y'"=="2018" {
                loc inei_code 634
                loc year_lab 2018
            }
            else if "`y'"=="2017" {
                loc inei_code 603
                loc year_lab 2017
            }
            else if "`y'"=="2016" {
                loc inei_code 546
                loc year_lab 2016
            }
            else if "`y'"=="2015" {
                loc inei_code 498
                loc year_lab 2015
            }
            else if "`y'"=="2014" {
                loc inei_code 440
                loc year_lab 2014
            }
            else if "`y'"=="2013" {
                loc inei_code 404
                loc year_lab 2013
            }
            else if "`y'"=="2012" {
                loc inei_code 324
                loc year_lab 2012
            }
            else if "`y'"=="2011" {
                loc inei_code 291
                loc year_lab 2011
            }
            else if "`y'"=="2010" {
                loc inei_code 279
                loc year_lab 2010
            }
            else if "`y'"=="2009" {
                loc inei_code 285
                loc year_lab 2009
            }
            else if "`y'"=="2008" {
                loc inei_code 284
                loc year_lab 2008
            }
            else if "`y'"=="2007" {
                loc inei_code 283
                loc year_lab 2007
            }
            else if "`y'"=="2006" {
                loc inei_code 282
                loc year_lab 2006
            }
            else if "`y'"=="2005" {
                loc inei_code 281
                loc year_lab 2005
            }
            else if "`y'"=="2004" {
                loc inei_code 280
                loc year_lab 2004
            }
            else {
                di as error "El año `y' no está contemplado en el programa ENAHO regular."
                continue
            }
        }
        /***********************************************************
          6. Bucle por módulo
        ***********************************************************/
		loc baseurl "https://proyectos.inei.gob.pe/iinei/srienaho/descarga/STATA"
		
        foreach m of loc modlist {
            di in green "Importando Módulo `m', año `y'"

            * Construimos el nombre del ZIP en la carpeta de destino
            loc outzip "`path'\modulo_`m'_`year_lab'.zip"

            * Definir opciones para el comando copy
            loc copyopts
            if "`replace'" != "" {
                loc copyopts ", replace"
            }

            copy "`baseurl'/`inei_code'-Modulo`m'.zip" ///
                 "`outzip'" `copyopts'

            di in green "Descarga exitosa: `outzip'"

            /***********************************************************
              7. Descomprimir si el usuario pide la opción `descomprimir`
            ***********************************************************/
            if "`descomprimir'" != "" {
                di in green "Iniciando proceso de descompresión..."

                * Guardamos el directorio actual
                qui pwd
                loc olddir = r(pwd)

                * Creamos una sola carpeta 
                cap mkdir "`path'\modulo_`m'_`year_lab'"
                loc subcarp "`path'\modulo_`m'_`year_lab'"

                * Nos movemos a ella
                qui cd "`subcarp'"
                sleep 3500

                * Descomprimimos (solo .dta), respetando estructura interna
                qui cap unzipfile "`outzip'", replace ifilter(".*\.dta$")

                * Regresamos al directorio anterior
                qui cd "`olddir'"

                /***********************************************************
                  8. Si se pidió `load`, buscamos y cargamos el .dta
                     (solo si existe y > 5 MB)
                ***********************************************************/
                if `do_load' == 1 {
                    * Entramos a la carpeta interna 
                    qui cd "`subcarp'/`inei_code'-Modulo`m'"

                    * Encoding
                    loc files : dir . files "*.dta"
                    foreach f of loc files {
                        clear all
                        qui unicode analyze "`f'"
                        qui unicode encoding set "latin1"
                        qui unicode translate "`f'"
                    }

                    *di in green "Buscando archivos .dta en: `subcarp'"
					sleep 1000
                    * 1) Hacer lista de archivos .dta
                    local dtafiles : dir "" files "*.dta"

                    * 2) Umbral de 5 MB = 5*1024*1024
                    loc threshold = 5242880
                    loc found     = 0

                    * 3) Recorrer la lista
                    foreach file of loc dtafiles {
                        cap file open myFile using "`file'", read
                        if _rc == 0 {
                            loc size = r(filelen)
                            file close myFile

                            if `size' > `threshold' {
                                *di as green "Cargando archivo: `file'"
                                *di as green "Tamaño aproximado: " %9.2f =(`size'/1024/1024) " MB"

                                qui use "`file'", clear

                                if length("`condition'") != 0 {
                                    di as green "Aplicando filtro: `condition'"
                                    qui keep if `condition'
                                }

                                loc found = 1
                                break
                            }
                        }
                    }

                    * 4) Si no se encontró .dta > 5 MB
                    if `found' == 0 {
                        di as error "No se encontró ningún .dta mayor a 5 MB."
                    }

                    * Borramos el zip tras descomprimir y cargar
                    erase "`outzip'"
                }

                * Volvemos al directorio anterior
                qui cd "`olddir'"
            }

        }
    }
end

