#!/bin/bash

# AUTHOR: JON PEREZ JORGE
# jonperezjorge@gmail.com

clear


# Colores
ROJO='\033[0;31m'
VERDE='\033[0;32m'
AMARILLO='\033[1;33m'
AZUL='\033[1;34m'
NC='\033[0m'


# Eliminar líneas duplicadas en el archivo sources.list
eliminar_duplicados() {
    local archivo="/etc/apt/sources.list"
    if [ -f "$archivo" ]; then
        sort "$archivo" | uniq > "$archivo.tmp"
        mv "$archivo.tmp" "$archivo"
    fi
}





#Banner:
echo -e ${VERDE}"                                                                                                      
 _  __   _    _     ___         _   _   _ _____ ___            _   _ ____  ____    _  _____ _____ ____  
| |/ /  / \  | |   |_ _|       / \ | | | |_   _/ _ \          | | | |  _ \|  _ \  / \|_   _| ____|  _ \ 
| ' /  / _ \ | |    | |       / _ \| | | | | || | | |  _____  | | | | |_) | | | |/ _ \ | | |  _| | |_) |
| . \ / ___ \| |___ | |      / ___ | |_| | | || |_| | |_____| | |_| |  __/| |_| / ___ \| | | |___|  _ < 
|_|\_/_/   \_|_____|___|    /_/   \_\___/  |_| \___/           \___/|_|   |____/_/   \_|_| |_____|_| \_\                                                                                                               
                                                                                
Author: Jon Pérez Jorge                                        Kali Linux distribution auto-updater tool                               
jonperezjorge@gmail.com                                                                            V.1.1                               
${NC}"

#Borrar el archivo original "sources.list"
#sudo rm -f /etc/apt/sources.list  #Descomentar el inicio de la línea si se desea crear un nuevo archivo cada vez que se ejecute el script.

echo "
Repositorios añadidos:

* Kali Rolling.
* Kali Last Snap Shot.
* Kali Bleeding Edge.

(Se eliminan automáticamente los repositorios duplicados).
"


	


#escribir en él los repositorios:

#1) Kali Rolling:
sudo echo "deb http://http.kali.org/kali kali-rolling main contrib non-free non-free-firmware" >> /etc/apt/sources.list

#2) Kali Last Snap Shot:
sudo echo "deb http://http.kali.org/kali kali-last-snapshot main contrib non-free non-free-firmware" >> /etc/apt/sources.list

#3) Kali Bleeding Edge:
sudo echo "deb http://http.kali.org/kali kali-bleeding-edge main contrib non-free non-free-firmware" >> /etc/apt/sources.list


# Llamar a la función para eliminar duplicados después de añadir repositorios:
eliminar_duplicados



#Pedir actualizar:

echo "


"
echo -e ${AMARILLO}"--> Elige una opción, por favor: ${NC}
"

COLUMNS=30

	opciones=(
"Actualizar repositorios" 
"Actualizar programas" 
"Actualizar programas y borrar paquetes viejos" 
"Actualizar todo: Programas, librerías, y distrubución completa" 
"Salir")



select opt in "${opciones[@]}"
do


    case $opt in 



        "Actualizar repositorios") echo "
        
Actualizando repositorios... $CONT 
" 
                sudo apt update; break
        ;;
        
        
        
        
        "Actualizar programas") echo "
        
Actualizando programas... $CONT 
" 
                sudo apt upgrade -y; break
        ;;
        
        
        
        
        "Actualizar programas y borrar paquetes viejos") echo "
        
Actualizando programas y borrando paquetes viejos... $CONT 
" 
                sudo apt full-upgrade -y; break
        ;;
        
        
        
        "Actualizar todo: Programas, librerías, y distrubución completa") echo "
        
Actualizando completamente el sistema Kali Linux... $CONT 
" 
                sudo apt dist-upgrade -y; break
        
        ;;
        

        "Salir") echo " 
Saliendo... $CONT 
" 
               echo "Hasta la próxima"; break 2

        ;;
       
        
        
        *) echo "Opcion no válida."
    esac
done
