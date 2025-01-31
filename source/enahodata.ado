*! enahodata: 
*! Version 0.0.1: 2025/01/22
*! Author: Maykol Medrano
*! Institute of Economics
*! UC
*! mmedrano2@uc.cl

capture program drop enahodata
program define enahodata
    version 16.0
    set more off

    /***********************************************************
      1. Definición de sintaxis
    ***********************************************************/
    syntax ,                    ///
        MODulo(string)          ///
        año(string)             ///
        [                       ///
          panel                 ///
          path(string)          ///
          DEScomprimir          ///
          PREServe              ///
          condition(string)     ///
          replace               ///
          load                  ///
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

	* Guardamos el directorio actual
        quietly pwd
        local olddir = r(pwd)

        loc baseurl "https://proyectos.inei.gob.pe/iinei/srienaho/descarga/STATA"
		
        foreach m of loc modlist {
            di in green "Importando Módulo `m', año `y'"

            * Construimos el nombre del ZIP en la carpeta de destino
            loc outzip "`path'/modulo_`m'_`year_lab'.zip"

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

                * Creamos la carpeta final donde queremos los .dta (aplanado)
                cap mkdir  "`path'\modulo_`m'_`year_lab_'"
                loc ffiles "`path'\modulo_`m'_`year_lab_'"
		
                * 1) Descomprimir sólo los .dta en la carpeta temporal
                qui cap unzipfile "`outzip'", replace ifilter(".*\.dta$") 
                sleep 1500

                * 2) Mover (o copiar) todos los .dta a la carpeta final (aplanado)
				qui cd "`path'/`inei_code'-Modulo`m'_"
                local dtalist : dir . files "*.dta"
                foreach f of local dtalist {
                    copy "`f'" "`ffiles'/`f'", replace
						sleep 100
					erase "`f'"
                }

                * 3) Borrar el .zip (ya no lo necesitamos)
				qui cd "`path'"
                erase  "`outzip'"
		cap rmdir "`inei_code'-Modulo`m'_"
		* Regresamos a la carpeta anterior
                cd "`olddir'"

                /***********************************************************
                  8. Si se pidió `load`, buscamos y cargamos el .dta
                ***********************************************************/
                if `do_load' == 1 {
                    * Nos movemos a la carpeta final (ya aplanada)
                    qui cd "`ffiles'"

		* Encoding: convertir cada .dta a unicode-latin1 
                    loc files : dir . files "*.dta"
                    foreach f of loc files {
                        clear all
                        qui unicode analyze "`f'"
                        qui unicode encoding set "latin1"
                        qui unicode translate "`f'"
                    }
					
                    * Lista de archivos .dta
                    local dtafiles : dir "." files "*.dta"

                    * Cargar el primer archivo .dta que se encuentre
                    local found = 0
                    foreach file of local dtafiles {
                        qui use "`file'", clear

                        * Aplicar la condición si se especificó
                        if length("`condition'") != 0 {
                            di as green "Aplicando filtro: `condition'"
                            qui keep if `condition'
                        }

                        loc found = 1
                        *di as green "Archivo .dta cargado: `file'"
                        exit
                    }

                    * Si no se encontró ningún archivo .dta
                    if `found' == 0 {
                        di as error "No se encontró ningún archivo .dta para cargar."
                    }
                }
            }
        }
    }
end
