capture program drop _all
clear all
set more off

* 1) Mostrar versión y directorio actual para control
di as txt "Test: Descarga básica de enahodata2"
di as txt "Stata version: `c(version)'"
pwd

* 2) Definir variables de prueba
local test_year "2023"
local test_module "01"
local test_path  "C:\User\stata\test_basic"

* 3) Crear la carpeta de prueba (si no existe)
capture mkdir "`test_path'"

* 4) Llamar a enahodata2 sin descomprimir ni load
enahodata, ///
    modulo("`test_module'") ///
    año("`test_year'") ///
    path("`test_path'") ///
    replace

* 5) Verificar la existencia del ZIP
local zip_file "`test_path'/modulo_`test_module'_`test_year'.zip"
if (fileexists("`zip_file'")) {
    di as result "OK: El archivo ZIP se descargó en: `zip_file'"
}
else {
    di as error "ERROR: No se encontró el archivo ZIP: `zip_file'"
}

di as txt "Fin de test_enahodata_basic.do"

