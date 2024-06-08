//ESTE PROGRAMA ES UN SOFTWARE PEQUEÑO QUE SERA UTILIZADO PARA APRENDER SOBRE LA SEGUNGA GUERRA MUNDIAL.
//HABRA DE MUCHOS TEMAS.
PROGRAM world_war_II_enciclopedia;
USES crt;

TYPE

    informacion = RECORD
                  anio: integer;
                  titulo: string;
                  texto: string;
                  bandos_enfrentados: string;
                  END;

    batallas = RECORD
               anio: integer;
               titulo: string;
               texto: string;
               victoria: string;
               END;

    lideres = RECORD
              nombre_apellido: string;
              fecha_nacimiento: string;
              fecha_fallecimiento: string;
              biografia: string;
              bando: string;
              END;

    armas = RECORD
            nombre_arma: string;
            clase_arma: string;
            pais_de_origen: string;
            info_arma: string;
            END;

VAR
   archivo_informacion: FILE OF informacion;
   registro_informacion: informacion;
   archivo_batallas: FILE OF batallas;
   registro_batallas: batallas;
   archivo_lideres: FILE OF lideres;
   registro_lideres: lideres;
   archivo_armas: FILE OF armas;
   registro_armas: armas;

PROCEDURE crea_archivo_informacion;
 BEGIN
 rewrite(archivo_informacion);
 close(archivo_informacion);
 END;

PROCEDURE crea_archivo_batallas;
 BEGIN
 rewrite(archivo_batallas);
 close(archivo_batallas);
 END;

PROCEDURE crea_archivo_lideres;
 BEGIN
 rewrite(archivo_lideres);
 close(archivo_lideres);
 END;

PROCEDURE crea_archivo_armas;
 BEGIN
 rewrite(archivo_armas);
 close(archivo_armas);
 END;

FUNCTION valida_anio(): integer;
VAR
 anio:integer;
 BEGIN
 REPEAT
 textcolor(lightgreen);
 writeln('||||||||||||||||||||||||||||||||||||||||');
 writeln('----------------------------------------');
 write('>>> Ingrese un anio entre 1939 y 1945: ');
 readln(anio);
 IF (anio < 1939) OR (anio > 1945) THEN
  BEGIN
  textcolor(lightred);
  writeln();
  writeln('|/////////////////////////////////////////////////////////////////|');
  writeln('|Anio no valido. Debe ser de entre 1939 y 1945. Vuelva a ingresar!|');
  writeln('|/////////////////////////////////////////////////////////////////|');
  writeln();
  delay(5000);
  clrscr;
  END;
 UNTIL (anio >= 1939) AND (anio <= 1945);
 valida_anio:= anio;
 END;

PROCEDURE orderna_archivo_informacion_por_anio;
VAR
 i,j: integer;
 raux: informacion;
 BEGIN
 FOR i:= 0 TO filesize(archivo_informacion) - 2 DO
  BEGIN
   FOR j:= i + 1 TO filesize(archivo_informacion) - 1 DO
    BEGIN
    seek(archivo_informacion,i);
    read(archivo_informacion,registro_informacion);
    seek(archivo_informacion,j);
    read(archivo_informacion,raux);
    IF registro_informacion.anio > raux.anio THEN
     BEGIN
     seek(archivo_informacion,i);
     write(archivo_informacion,raux);
     seek(archivo_informacion,j);
     write(archivo_informacion,registro_informacion);
     END;
    END;
  END;
 END;

PROCEDURE carga_crea_enciclopedia;
VAR
 opcion: string;
 BEGIN
 reset(archivo_informacion);
 REPEAT
 clrscr;
 textcolor(lightgreen);
 registro_informacion.anio:= valida_anio();
 writeln();
 write('>>> Ingrese titulo: ');
 readln(registro_informacion.titulo);
 writeln();
 writeln('>>> Ingrese la informacion: ');
 writeln();
 readln(registro_informacion.texto);
 writeln();
 write('>>> Ingrese que bandos se han enfrentado: ');
 readln(registro_informacion.bandos_enfrentados);
 writeln();
 writeln('--------------------------------------');
 writeln('||||||||||||||||||||||||||||||||||||||');
 seek(archivo_informacion, filesize(archivo_informacion));
 write(archivo_informacion, registro_informacion);
 writeln();
 REPEAT
 textcolor(lightcyan);
 write('>>> Desea volver a ingresar nueva informacion[si/no]?: ');
 readln(opcion);
 IF (opcion <> 'si') AND (opcion <> 'no') THEN
  BEGIN
  textcolor(lightred);
  writeln();
  writeln('|////////////////////////////////////////|');
  writeln('|Ingrese una respuesta valida. Por favor.|');
  writeln('|////////////////////////////////////////|');
  writeln();
  END;
 UNTIL (opcion = 'si') OR (opcion = 'no');
 UNTIL (opcion = 'no');
 orderna_archivo_informacion_por_anio;
 close(archivo_informacion);
 END;

PROCEDURE carga_batallas_iconicas;
VAR
   opcion: string;
   BEGIN
   reset(archivo_batallas);
   REPEAT
   clrscr;
   textcolor(lightcyan);
   registro_batallas.anio:= valida_anio();
   writeln();
   write('>>> Ingrese titulo: ');
   readln(registro_batallas.titulo);
   writeln();
   writeln('>>> Ingrese la informacion: ');
   writeln();
   readln(registro_batallas.texto);
   writeln();
   write('>>> Ingrese bando ganador: ');
   readln(registro_batallas.victoria);
   writeln();
   writeln('--------------------------------------');
   writeln('||||||||||||||||||||||||||||||||||||||');
   seek(archivo_batallas,filesize(archivo_batallas));
   write(archivo_batallas,registro_batallas);
   writeln();
    REPEAT
    textcolor(lightgreen);
    write('>>> Desea volver a ingresar nueva informacion[si/no]?: ');
    readln(opcion);
    IF (opcion <> 'si') AND (opcion <> 'no') THEN
    BEGIN
    textcolor(lightred);
    writeln();
    writeln('|////////////////////////////////////////|');
    writeln('|Ingrese una respuesta valida. Por favor.|');
    writeln('|////////////////////////////////////////|');
    writeln();
    END;
    UNTIL (opcion = 'si') OR (opcion = 'no');
   UNTIL (opcion = 'no');
   close(archivo_batallas);
   END;

PROCEDURE carga_informacion_lideres;
VAR
   opcion: string;
   BEGIN
   reset(archivo_lideres);
   REPEAT
    clrscr;
    textcolor(green);
    writeln('---------------------------------------');
    writeln('|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|');
    writeln('---------------------------------------');
    write('>>> Ingrese nombre: ');
    readln(registro_lideres.nombre_apellido);
    writeln();
    write('>>> Ingrese fecha de nacimiento: ');
    readln(registro_lideres.fecha_nacimiento);
    writeln();
    write('>>> Ingrese fecha de fallecimiento: ');
    readln(registro_lideres.fecha_fallecimiento);
    writeln();
    writeln('>>> Ingrese biografia: ');
    writeln();
    readln(registro_lideres.biografia);
    writeln();
    write('>>> Ingrese bando al que pertenece: ');
    readln(registro_lideres.bando);
    writeln();
    writeln('---------------------------------------');
    writeln('|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|');
    writeln('---------------------------------------');
    seek(archivo_lideres,filesize(archivo_lideres));
    write(archivo_lideres,registro_lideres);
    writeln();
    REPEAT
    textcolor(lightgreen);
    write('>>> Desea volver a ingresar nueva informacion[si/no]?: ');
    readln(opcion);
    IF (opcion <> 'si') AND (opcion <> 'no') THEN
    BEGIN
    textcolor(lightred);
    writeln();
    writeln('|////////////////////////////////////////|');
    writeln('|Ingrese una respuesta valida. Por favor.|');
    writeln('|////////////////////////////////////////|');
    writeln();
    END;
    UNTIL (opcion = 'si') OR (opcion = 'no');
   UNTIL (opcion = 'no');
   close(archivo_lideres);
   END;

FUNCTION verificar_estado_archivo_armas(): boolean;
VAR
 f: boolean;
 BEGIN
 IF filesize(archivo_armas) = 0 THEN
  f:= true;
 IF f = true THEN
  verificar_estado_archivo_armas:= true
 ELSE
  verificar_estado_archivo_armas:= false;
 END;

FUNCTION existe_arma(arma: string): boolean;
VAR
 f: boolean;
 BEGIN
 f:= false;
 REPEAT
 seek(archivo_armas,filesize(archivo_armas) - 1);
 read(archivo_armas,registro_armas);
 IF arma = registro_armas.nombre_arma THEN
  f:=  true;
 UNTIL eof(archivo_armas) OR (f = true);
 IF f = true THEN
  existe_arma:= true
 ELSE
  existe_arma:= false;
 END;

PROCEDURE carga_de_armas;
VAR
 arma,opcion: string;
 BEGIN
 reset(archivo_armas);
 REPEAT
 clrscr;
 textcolor(lightcyan);
 IF verificar_estado_archivo_armas = true THEN
  BEGIN
  writeln('---------------------------------------------');
  writeln('/////////////////////////////////////////////');
  writeln('---------------------------------------------');
  write('>>> Ingrese nombre del arma: ');
  readln(registro_armas.nombre_arma);
  writeln();
  write('>>> Ingrese clase de arma: ');
  readln(registro_armas.clase_arma);
  writeln();
  write('>>> Ingrese pais de origen: ');
  readln(registro_armas.pais_de_origen);
  writeln();
  write('>>> Ingrese informacion adicional del arma: ');
  readln(registro_armas.info_arma);
  writeln();
  writeln('--------------------------------------------');
  writeln('////////////////////////////////////////////');
  writeln('--------------------------------------------');
  seek(archivo_armas,filesize(archivo_armas));
  write(archivo_armas,registro_armas);
  writeln();
  writeln('==================================================');
  writeln('*** Se han registrado los datos existosamente! ***');
  writeln('==================================================');
  END
 ELSE
  BEGIN
  writeln('---------------------------------------------');
  writeln('/////////////////////////////////////////////');
  writeln('---------------------------------------------');
  write('>>> Ingrese nombre del arma: ');
  readln(arma);
  IF existe_arma(arma) = true THEN
   BEGIN
   textcolor(lightred);
   writeln();
   writeln('=================================');
   writeln('x Ya esta cargado en el archivo x');
   writeln('=================================');
   END
  ELSE
   BEGIN
   registro_armas.nombre_arma:= arma;
   write('>>> Ingrese clase de arma: ');
   readln(registro_armas.clase_arma);
   writeln();
   write('>>> Ingrese pais de origen: ');
   readln(registro_armas.pais_de_origen);
   writeln();
   write('>>> Ingrese informacion adicional del arma: ');
   readln(registro_armas.info_arma);
   writeln();
   writeln('--------------------------------------------');
   writeln('////////////////////////////////////////////');
   writeln('--------------------------------------------');
   seek(archivo_armas,filesize(archivo_armas));
   write(archivo_armas,registro_armas);
   writeln();
   writeln('==================================================');
   writeln('*** Se han registrado los datos existosamente! ***');
   writeln('==================================================');
   END;
 END;
 writeln();
  REPEAT
   textcolor(lightgreen);
   write('>>> Desea volver a ingresar otra arma[si/no]?: ');
   readln(opcion);
   IF (opcion <> 'si') AND (opcion <> 'no') THEN
   BEGIN
    textcolor(lightred);
    writeln();
    writeln('|////////////////////////////////////////|');
    writeln('|Ingrese una respuesta valida. Por favor.|');
    writeln('|////////////////////////////////////////|');
    writeln();
    END;
  UNTIL (opcion = 'si') OR (opcion = 'no');
 UNTIL (opcion = 'no');
 close(archivo_armas);
 END;

PROCEDURE carga_de_informacion;
VAR
  opcion: integer;
  BEGIN
  REPEAT
   clrscr;
   textcolor(lightgreen);
   writeln('=====================================================');
   writeln('||                         ____                    ||');
   writeln('||  ____  _____  _______  / ___\ _____     ______  ||');
   writeln('|| / ___\ \__  \ \_  __ \/ /_/  >\__  \   /  ___/  ||');
   writeln('|| \  \___  / __ \_|  | \/\___  /  / __ \_ \___ \  ||');
   writeln('||  \___  >(____  /|__|  /_____/  (____  //____  > ||');
   writeln('||      \/      \/                     \/      \/  ||');
   writeln('||                                                 ||');
   writeln('=====================================================');
   writeln();
   textcolor(lightcyan);
   writeln('=================');
   writeln('* MENU DE ALTAS *');
   writeln('=================');
   writeln();
   writeln('----------------------------------------------------------------');
   writeln('|1| Cargar y crear enciclopedia de la Segunda Guerra Mundial |1|');
   writeln('----------------------------------------------------------------');
   writeln('|2|           Cargar sobre las batallas iconicas             |2|');
   writeln('----------------------------------------------------------------');
   writeln('|3|              Cargar sobre los lideres                    |3|');
   writeln('----------------------------------------------------------------');
   writeln('|4|               Cargar sobre las armas                     |4|');
   writeln('----------------------------------------------------------------');
   writeln('|5|          Cargar archivo de las Wanderwaffe               |5|');
   writeln('----------------------------------------------------------------');
   writeln('|6|               Cargar archivo trivia                      |6|');
   writeln('----------------------------------------------------------------');
   writeln('|7|         Regresar al menu del desarollador                |7|');
   writeln('----------------------------------------------------------------');
   writeln();
   textcolor(lightmagenta);
   writeln('----------------------------------------------------------------');
   write('Seleccione una opcion(teclas 1 al 7): ');
   readln(opcion);
   CASE opcion OF
        1:BEGIN
          clrscr;
          carga_crea_enciclopedia;
          END;
        2:BEGIN
          clrscr;
          carga_batallas_iconicas;
          END;
        3:BEGIN
          clrscr;
          carga_informacion_lideres;
          END;
        4:BEGIN
          clrscr;
          carga_de_armas;
          END;
        5:BEGIN
          END;
        6:BEGIN
          END;
   END;
  UNTIL (opcion = 7);
  END;

FUNCTION verifica_estado_archivo_informacion(): boolean;
 BEGIN
 IF filesize(archivo_informacion) = 0 THEN
  verifica_estado_archivo_informacion:= true
 ELSE
  verifica_estado_archivo_informacion:= false;
 END;

PROCEDURE muestra_eventos_respecto_de_anio(anio: integer);
 BEGIN
 WHILE NOT eof(archivo_informacion) DO
  BEGIN
  read(archivo_informacion,registro_informacion);
  IF anio = registro_informacion.anio THEN
   BEGIN
   writeln('Titulo: ',registro_informacion.titulo);
   writeln('Texto: ',registro_informacion.texto);
   writeln('Bandos enfrentados: ',registro_informacion.bandos_enfrentados);
   END;
   END;
 END;

PROCEDURE selecciona_titulo(titulo: string);
VAR
  f: boolean;
  BEGIN
  REPEAT
  seek(archivo_informacion,filesize(archivo_informacion) - 1);
  read(archivo_informacion,registro_informacion);
  IF titulo = registro_informacion.titulo THEN
   f:= true;
  UNTIL eof(archivo_informacion) OR (f = true);
  IF f = true THEN
   BEGIN
   writeln();
   write('Ingrese la nueva modificacion: ');
   readln(registro_informacion.texto);
   seek(archivo_informacion,filesize(archivo_informacion) - 1);
   write(archivo_informacion,registro_informacion);
   writeln();
   writeln('=========================================');
   writeln('*** Registro modificado correctamente ***');
   writeln('=========================================');
   END;
  END;


PROCEDURE modificar_informacion_enciclopedia;
VAR
 titulo,opcion: string;
 anio: integer;
 BEGIN
 reset(archivo_informacion);
 IF verifica_estado_archivo_informacion() = true THEN
  BEGIN
   textcolor(lightred);
   writeln();
   writeln('==============================================================');
   writeln('X Aun no hay registros cargados en el archivo de informacion X');
   writeln('==============================================================');
   delay(3000);
   close(archivo_informacion);
  END
 ELSE
  BEGIN
  REPEAT
  reset(archivo_informacion);
  anio:= valida_anio();
  muestra_eventos_respecto_de_anio(anio);
  writeln();
  writeln('Ingrese titulo del registro que desee modificar: ');
  readln(titulo);
  selecciona_titulo(titulo);
  writeln();
  REPEAT
   textcolor(lightgreen);
   write('>>> Desea volver a modificar otra registro[si/no]?: ');
   readln(opcion);
   IF (opcion <> 'si') AND (opcion <> 'no') THEN
   BEGIN
    textcolor(lightred);
    writeln();
    writeln('|////////////////////////////////////////|');
    writeln('|Ingrese una respuesta valida. Por favor.|');
    writeln('|////////////////////////////////////////|');
    writeln();
    END;
  UNTIL (opcion = 'si') OR (opcion = 'no');
  UNTIL (opcion = 'no');
  close(archivo_informacion);
  END;
 END;

PROCEDURE Modifica_informacion;
VAR
  opcion: integer;
  BEGIN
  REPEAT
   writeln('1. Modificar enciclopedia de la Segunda Guerra Mundial');
   writeln('2. Modificar sobre las batallas iconicas');
   writeln('3. Modificar sobre los lideres');
   writeln('4. Modificar sobre las armas');
   writeln('5. Modificar archivo de las Wanderwaffe');
   writeln('6. Modificar archivo trivia');
   writeln('7. Regresar al menu del desarollador.');
   writeln();
   writeln('-----------------------------------------------------------');
   write('Seleccione una opcion(teclas 1 al 7): ');
   readln(opcion);
   CASE opcion OF
        1:BEGIN
          clrscr;
          modificar_informacion_enciclopedia;
          END;
        2:BEGIN
          END;
        3:BEGIN
          END;
        4:BEGIN
          END;
        5:BEGIN
          END;
        6:BEGIN
          END;
   END;
  UNTIL (opcion = 7);
  END;

PROCEDURE baja_informacion;
VAR
  opcion: integer;
  BEGIN
  REPEAT
   clrscr;
   writeln('1. Baja informacion de la enciclopedia de la Segunda Guerra Mundial');
   writeln('2. Baja sobre las batallas iconicas');
   writeln('3. Baja sobre los lideres');
   writeln('4. Baja sobre las armas');
   writeln('5. Baja archivo de las Wanderwaffe');
   writeln('6. Baja archivo trivia');
   writeln('7. Regresar al menu del desarollador.');
   writeln();
   writeln('-----------------------------------------------------------');
   write('Seleccione una opcion(teclas 1 al 7): ');
   readln(opcion);
   CASE opcion OF
        1:BEGIN
          END;
        2:BEGIN
          END;
        3:BEGIN
          END;
        4:BEGIN
          END;
        5:BEGIN
          END;
        6:BEGIN
          END;
        7:BEGIN
          END;
   END;
  UNTIL (opcion = 7);
  END;

PROCEDURE menu_desarrollador;
VAR
   opcion: integer;
   BEGIN
   REPEAT
   clrscr;
   writeln('--------------------------------------');
   writeln('|1|       Alta de informacion      |1|');
   writeln('--------------------------------------');
   writeln('|2|  Modificaciones de informacion |2|');
   writeln('--------------------------------------');
   writeln('|3|       Baja de informacion      |3|');
   writeln('--------------------------------------');
   writeln('|4|    Regresar al menu principal  |4|');
   writeln('--------------------------------------');
   writeln();
   textcolor(lightmagenta);
   writeln('======================================');
   writeln('Seleccione una opcion(teclas 1 al 4): ');
   readln(opcion);
   CASE opcion OF
        1:BEGIN
          clrscr;
          carga_de_informacion;
          END;
        2:BEGIN
          clrscr;
          Modifica_informacion;
          END;
        3:BEGIN
          clrscr;
          baja_informacion;
          END;
   END;
   UNTIL (opcion = 4);
   END;

PROCEDURE muestra_eventos_de_ese_anio(anio: integer);
 BEGIN
  WHILE NOT eof(archivo_informacion) DO
   BEGIN
   read(archivo_informacion,registro_informacion);
   IF anio = registro_informacion.anio THEN
    BEGIN
    writeln(registro_informacion.titulo);
    writeln(registro_informacion.texto);
    writeln(registro_informacion.bandos_enfrentados);
    writeln();
    writeln('====================================================================');
    END;
   END;
 END;

PROCEDURE ver_enciclopedia_segunda_guerra_mundial;
VAR
 opcion: string;
 anio:integer;
 BEGIN
  reset(archivo_informacion);
  IF verifica_estado_archivo_informacion = true THEN
   BEGIN
   textcolor(lightred);
   writeln();
   writeln('==============================================================');
   writeln('X Aun no hay registros cargados en el archivo de informacion X');
   writeln('==============================================================');
   delay(3000);
   END
  ELSE
   BEGIN
   REPEAT
    clrscr;
    textcolor(lightgreen);
    anio:= valida_anio();
    writeln();
    writeln('====================================================================');
    writeln('///////////////////////////',anio,'/////////////////////////////////');
    writeln('====================================================================');
    muestra_eventos_de_ese_anio(anio);
    writeln();
    REPEAT
     textcolor(lightgreen);
     write('>>> Desea volver a ingresar otra arma[si/no]?: ');
     readln(opcion);
      IF (opcion <> 'si') AND (opcion <> 'no') THEN
       BEGIN
       textcolor(lightred);
       writeln();
       writeln('|////////////////////////////////////////|');
       writeln('|Ingrese una respuesta valida. Por favor.|');
       writeln('|////////////////////////////////////////|');
       writeln();
       END;
    UNTIL (opcion = 'si') OR (opcion = 'no');
   UNTIL (opcion = 'no');
   END;
  close(archivo_informacion);
 END;

FUNCTION verifica_estado_archivo_batallas(): boolean;
 BEGIN
 reset(archivo_batallas);
 IF filesize(archivo_batallas) = 0 THEN
  verifica_estado_archivo_batallas:= true
 ELSE
  verifica_estado_archivo_batallas:= false;
 close(archivo_batallas);
 END;

FUNCTION muestra_batalla(batalla: string): boolean;
VAR
 f: boolean;
 BEGIN
  f:= false;
  REPEAT
   read(archivo_batallas,registro_batallas);
   IF batalla = registro_batallas.titulo THEN
    f:= true;
  UNTIL eof(archivo_batallas) OR (f = true);
  IF f = true THEN
   muestra_batalla:= true
  ELSE
   muestra_batalla:= false;

 END;

PROCEDURE ver_batallas_iconicas;
VAR
 batalla,opcion: string;
 BEGIN
 IF verifica_estado_archivo_batallas = true THEN
  BEGIN
  textcolor(lightred);
  writeln();
  writeln('===========================================================');
  writeln('X Aun no hay registros cargados en el archivo de batallas X');
  writeln('===========================================================');
  delay(3000);
  END
 ELSE
  BEGIN
   REPEAT
   reset(archivo_batallas);
   clrscr;
   textcolor(cyan);
   writeln('-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-');
   writeln('///////////////////////////////////////////////////////////////////////////////////////');
   writeln('-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-');
   write('>>> Ingrese nombre de alguna batalla de la Segunda Guerra Mundial: ');
   readln(batalla);
   writeln();
   IF muestra_batalla(batalla) = true THEN
   BEGIN
   writeln();
   writeln('Batalla: ',registro_batallas.titulo);
   writeln('Anio: ',registro_batallas.anio);
   writeln('Victoria: ',registro_batallas.victoria);
   writeln('Informacion: ',registro_batallas.texto);
   writeln();
   writeln('-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-');
   writeln('///////////////////////////////////////////////////////////////////////////////////////');
   writeln('-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-');
   writeln();
  END
  ELSE
   BEGIN
   textcolor(lightred);
   writeln();
   writeln('=========================');
   writeln('X No existe esa batalla X');
   writeln('=========================');
   writeln();
   END;
    REPEAT
     textcolor(lightgreen);
     write('>>> Desea volver a ingresar otra batalla[si/no]?: ');
     readln(opcion);
      IF (opcion <> 'si') AND (opcion <> 'no') THEN
       BEGIN
       textcolor(lightred);
       writeln();
       writeln('|////////////////////////////////////////|');
       writeln('|Ingrese una respuesta valida. Por favor.|');
       writeln('|////////////////////////////////////////|');
       writeln();
       END;
    UNTIL (opcion = 'si') OR (opcion = 'no');
   UNTIL (opcion = 'no');
   close(archivo_batallas);
  END;
 END;

FUNCTION verificar_estado_archivo_lideres(): boolean;
 BEGIN
  reset(archivo_lideres);
  IF filesize(archivo_lideres) = 0 THEN
   verificar_estado_archivo_lideres:= true
  ELSE
   verificar_estado_archivo_lideres:= false;
  close(archivo_lideres);
 END;

FUNCTION busca_lider(lider: string): boolean;
VAR
 f: boolean;
 BEGIN
  f:= false;
  REPEAT
  read(archivo_lideres,registro_lideres);
  IF lider = registro_lideres.nombre_apellido THEN
   f:= true;
  UNTIL eof(archivo_lideres) OR (f = true);
  IF f = true THEN
    busca_lider:= true
  ELSE
    busca_lider:= false;
 END;

PROCEDURE ver_lideres;
VAR
 opcion,lider: string;
 BEGIN
 IF verificar_estado_archivo_lideres() = true THEN
  BEGIN
  textcolor(lightred);
  writeln();
  writeln('==========================================================');
  writeln('X Aun no hay registros cargados en el archivo de lideres X');
  writeln('==========================================================');
  delay(3000);
  END
 ELSE
  BEGIN
   REPEAT
   reset(archivo_lideres);
   clrscr;
   textcolor(green);
   writeln('PARA EMPEZAR CON LA BUSQUEDA INGRESE NOMBRE Y APELLIDO DE ALGUNA PERSONALIDAD HISTORICA');
   writeln('=======================================================================================');
   write('>>> Ingrese nombre y apellido: ');
   readln(lider);
   IF busca_lider(lider) = true THEN
    BEGIN
    textcolor(brown);
    writeln('/////////////////////////////////////',lider,'///////////////////////////////////////');
    writeln('-------------------------------------------------------------------------------------');
    write('Nombre y Apellido: ',registro_lideres.nombre_apellido);
    writeln();
    write('Fecha de nacimiento: ',registro_lideres.fecha_nacimiento);
    writeln();
    write('Fecha de fallecimiento: ',registro_lideres.fecha_fallecimiento);
    writeln();
    write('Biografia: ',registro_lideres.biografia);
    writeln();
    write('Bando: ',registro_lideres.bando);
    writeln();
    textcolor(green);
    writeln('======================================================================================');
    writeln();
    close(archivo_lideres);
    END
   ELSE
   BEGIN
   textcolor(lightred);
   writeln();
   writeln('=======================');
   writeln('X No existe ese lider X');
   writeln('=======================');
   writeln();
   END;
   REPEAT
   textcolor(lightgreen);
   write('>>> Desea volver a ingresar otra batalla[si/no]?: ');
   readln(opcion);
   IF (opcion <> 'si') AND (opcion <> 'no') THEN
    BEGIN
    textcolor(lightred);
    writeln();
    writeln('|////////////////////////////////////////|');
    writeln('|Ingrese una respuesta valida. Por favor.|');
    writeln('|////////////////////////////////////////|');
    writeln();
    END;
    UNTIL (opcion = 'si') OR (opcion = 'no');
   UNTIL (opcion = 'no');
  END;
 END;

PROCEDURE portada_ocultismo_nazi;
 BEGIN
 gotoxy(whereX,whereY + 12);
 writeln();
 gotoxy(whereX +25,whereY);
 writeln('MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM ');
 gotoxy(whereX +25,whereY);
 writeln('MMMMMMMMMMMMMMMNOolcl0MMMMMMMMMMKdlc:xWMMMMMMMMMMM ');
 gotoxy(whereX +25,whereY);
 writeln('MMMMMMMMMMMMMMWd.   cXMMMMMMMMMK,   .OMMMMMMMMMMMM ');
 gotoxy(whereX +25,whereY);
 writeln('MMMMMMMMMMMMMMO.   ,0MMMMMMMMMNc   .dWMMMMMMMMMMMM ');
 gotoxy(whereX +25,whereY);
 writeln('MMMMMMMMMMMMMX;   .xWMMMMMMMMWd.   cNMMMMMMMMMMMMM ');
 gotoxy(whereX +25,whereY);
 writeln('MMMMMMMMMMMMWl    lNWNNWMMMMMO.   ,0WNXWMMMMMMMMMM ');
 gotoxy(whereX +25,whereY);
 writeln('MMMMMMMMMMMWx.      |dWMMMMX|;      |cKMMMMMMMMMMM ');
 gotoxy(whereX +25,whereY);
 writeln('MMMMMMMMMMM0,        ,KMMMMNl        .xWMMMMMMMMMM ');
 gotoxy(whereX +25,whereY);
 writeln('MMMMMMMMMMX:        .kMMMMWx.        cNMMMMMMMMMMM ');
 gotoxy(whereX +25,whereY);
 writeln('MMMMMMMMMMXxdxx,    oWMMMMWOoxkc    ,KMMMMMMMMMMMM ');
 gotoxy(whereX +25,whereY);
 writeln('MMMMMMMMMMMMMWd.   :XMMMMMMMMM0,   .kMMMMMMMMMMMMM ');
 gotoxy(whereX +25,whereY);
 writeln('MMMMMMMMMMMMMO.    0MMMMMMMMMNc    oWMMMMMMMMMMMMM ');
 gotoxy(whereX +25,whereY);
 writeln('MMMMMMMMMMMMK;   .xWMMMMMMMMWd.   :XMMMMMMMMMMMMMM ');
 gotoxy(whereX +25,whereY);
 writeln('MMMMMMMMMMMNl... dNMMMMMMMMMO ..:0MMMMMMMMMMMMMMMM ');
 gotoxy(whereX +25,whereY);
 writeln('MMMMMMMMMMMNkdk0XWMMMMMMMMMW0dxOKNMMMMMMMMMMMMMMMM ');
 gotoxy(whereX +25,whereY);
 writeln('MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM ');
 writeln();
 gotoxy(whereX +13,whereY);
 writeln('||======================================================================||');
 gotoxy(whereX +13,whereY);
 writeln('||                 ,,   ,                                               ||');
 gotoxy(whereX +13,whereY);
 writeln('||                ||  ||   *                                           *||');
 gotoxy(whereX +13,whereY);
 writeln('|| /\\  _-_ \\ \\ || =||= \\  _-_, \\/\\/\\   /\\     \\/\\  < \, /\\ \\||');
 gotoxy(whereX +13,whereY);
 writeln('|||| || ||   || || ||  ||  || ||_.  || || || || ||    || ||  /-||  /  ||||');
 gotoxy(whereX +13,whereY);
 writeln('|||| || ||   || || ||  ||  ||  ~ || || || || || ||    || || (( || /\\ ||||');
 gotoxy(whereX +13,whereY);
 writeln('||\\,/  \\,/ \\/\\ \\  \\, \\ ,-_-  \\ \\ \\ \\,/     \\ \\  \/\\  || \\||');
 gotoxy(whereX +13,whereY);
 writeln('||                                                                /     ||');
 gotoxy(whereX +13,whereY);
 writeln('||                                                               (,     ||');
 gotoxy(whereX +13,whereY);
 writeln('||======================================================================||');
 END;

PROCEDURE pagina_2_ocultismo_nazi;
 BEGIN
  gotoxy(whereX + 20,whereY);
  writeln();
  writeln('======================================================================================================');
  writeln('|////////////////////////////////////////OCULTISMO NAZI//////////////////////////////////////////////|');
  writeln('|====================================================================================================|');
  writeln('|                                                                                                    |');
  writeln('| El ocultismo nazi es un termino que se refiere a las creencias esotericas y practicas misticas que |');
  writeln('|       influyeron en algunos miembros del Partido Nacionalsocialista Obrero Aleman (NSDAP)          |');
  writeln('|                                      y sus politicas.                                              |');
  writeln('|                                                                                                    |');
  writeln('|----------------------------------------------------------------------------------------------------|');
  writeln('| Detalles:                                                                                          |');
  writeln('|----------------------------------------------------------------------------------------------------|');
  writeln('| 1. Raices Esotericas y Misticas                                                                    |');
  writeln('|                                                                                                    |');
  writeln('|  * Ariosofia: Un movimiento esoterico que mezclaba ideas nacionalistas y racistas con creencias    |');
  writeln('|    ocultistas. Figura prominente fue Guido von List, cuyos escritos influyeron en el pensamiento   |');
  writeln('|    nazi sobre la raza aria.                                                                        |');
  writeln('|                                                                                                    |');
  writeln('|  * Sociedad Thule: Una sociedad secreta alemana fundada en 1918, que combinaba el                  |');
  writeln('|    nacionalismo con el misticismo germánico. Muchos de sus miembros, como Rudolf Hess,             |');
  writeln('|    eventualmente se unieron al NSDAP.                                                              |');
  writeln('|                                                                                                    |');
  writeln('|----------------------------------------------------------------------------------------------------|');
  writeln('| 2. Adolf Hitler y el Ocultismo                                                                     |');
  writeln('|                                                                                                    |');
  writeln('|  * Aunque Hitler no era conocido por ser un ocultista activo, estaba rodeado de individuos que     |');
  writeln('|    tenían fuertes inclinaciones esotéricas. Heinrich Himmler, jefe de las SS, es el ejemplo        |');
  writeln('|    más notable.                                                                                    |');
  writeln('|                                                                                                    |');
  writeln('|----------------------------------------------------------------------------------------------------|');
  writeln('======================================================================================================');
  writeln('|////////////////////////////////////////////////////////////////////////////////////////////////////|');
  writeln('======================================================================================================');
 END;

PROCEDURE ocultismo_nazi;
VAR
 atras_adelante:string;
 BEGIN
 REPEAT
 textcolor(lightred);
 clrscr;
 portada_ocultismo_nazi;
 writeln();
 writeln();
 gotoxy(whereX +  40,whereY);
 writeln('|---------------|');
 gotoxy(whereX +  40,whereY);
 writeln('| ===> ADELANTE |');
 gotoxy(whereX +  40,whereY);
 writeln('-----------------');
 gotoxy(whereX +  40,whereY);
 writeln('| ENTER - SALIR |');
 gotoxy(whereX +  40,whereY);
 writeln('-----------------');
 atras_adelante:= readkey;
 IF atras_adelante <> #13 THEN
 BEGIN
  REPEAT
  clrscr;
  pagina_2_ocultismo_nazi;
  writeln();
  writeln();
  gotoxy(whereX +  40,whereY);
  writeln('|---------------|');
  gotoxy(whereX +  40,whereY);
  writeln('|  <== ATRAS    |');
  gotoxy(whereX +  40,whereY);
  writeln('-----------------');
  gotoxy(whereX +  40,whereY);
  writeln('| ENTER - SALIR |');
  gotoxy(whereX +  40,whereY);
  writeln('-----------------');
  atras_adelante:= readkey;
  UNTIL (atras_adelante = #75)  OR (atras_adelante = #13);
 END;
 UNTIL (atras_adelante = #13);
 END;

PROCEDURE menu_principal;
VAR
   opcion: integer;
   BEGIN
   REPEAT
   clrscr;
   gotoxy(whereX,whereY + 10);
   textcolor(lightgreen);
   gotoxy(whereX + 30,whereY);
   writeln('==========================================');
   gotoxy(whereX + 30,whereY);
   writeln('||   __      __  __      __ .___ .___   ||');
   gotoxy(whereX + 30,whereY);
   writeln('||  /  \    /  \/  \    /  \|   ||   |  ||');
   gotoxy(whereX + 30,whereY);
   writeln('||  \   \/\/   /\   \/\/   /|   ||   |  ||');
   gotoxy(whereX + 30,whereY);
   writeln('||   \        /  \        / |   ||   |  ||');
   gotoxy(whereX + 30,whereY);
   writeln('||    \__/\  /    \__/\  /  |___||___|  ||');
   gotoxy(whereX + 30,whereY);
   writeln('||         \/          \/               ||');
   gotoxy(whereX + 30,whereY);
   writeln('||                                      ||');
   gotoxy(whereX + 30,whereY);
   writeln('||       ENCICLOPEDIA DIDACTICA         ||');
   gotoxy(whereX + 30,whereY);
   writeln('||                                      ||');
   gotoxy(whereX + 30,whereY);
   writeln('==========================================');
   writeln();
   textcolor(yellow);
   gotoxy(whereX + 41,whereY);
   writeln('------------------');
   gotoxy(whereX + 41,whereY);
   writeln('* MENU PRINCIPAL *');
   gotoxy(whereX + 41,whereY);
   writeln('------------------');
   writeln();
   gotoxy(whereX + 24,whereY);
   writeln('-----------------------------------------------------');
   gotoxy(whereX + 24,whereY);
   writeln('|0|          Opcion para el desarrollador         |0|');
   gotoxy(whereX + 24,whereY);
   writeln('-----------------------------------------------------');
   gotoxy(whereX + 24,whereY);
   writeln('|1| Ver enciclopedia de la Segunda Guerra Mundial |1|');
   gotoxy(whereX + 24,whereY);
   writeln('-----------------------------------------------------');
   gotoxy(whereX + 24,whereY);
   writeln('|2|              Batallas iconicas                |2|');
   gotoxy(whereX + 24,whereY);
   writeln('-----------------------------------------------------');
   gotoxy(whereX + 24,whereY);
   writeln('|3|                  Lideres                      |3|');
   gotoxy(whereX + 24,whereY);
   writeln('-----------------------------------------------------');
   gotoxy(whereX + 24,whereY);
   writeln('|4|                   Armas                       |4|');
   gotoxy(whereX + 24,whereY);
   writeln('-----------------------------------------------------');
   gotoxy(whereX + 24,whereY);
   writeln('|5|           Protector de pantalla               |5|');
   gotoxy(whereX + 24,whereY);
   writeln('-----------------------------------------------------');
   gotoxy(whereX + 24,whereY);
   writeln('|6|              Ocultismo Nazi                   |6|');
   gotoxy(whereX + 24,whereY);
   writeln('-----------------------------------------------------');
   gotoxy(whereX + 24,whereY);
   writeln('|7|     Tabla cronologica de la contienda         |7|');
   gotoxy(whereX + 24,whereY);
   writeln('-----------------------------------------------------');
   gotoxy(whereX + 24,whereY);
   writeln('|8|                 Holocausto                    |8|');
   gotoxy(whereX + 24,whereY);
   writeln('-----------------------------------------------------');
   gotoxy(whereX + 24,whereY);
   writeln('|9|                Wanderwaffe                    |9|');
   gotoxy(whereX + 24,whereY);
   writeln('-----------------------------------------------------');
   gotoxy(whereX + 24,whereY);
   writeln('|10|                 Trivia                      |10|');
   gotoxy(whereX + 24,whereY);
   writeln('-----------------------------------------------------');
   gotoxy(whereX + 24,whereY);
   writeln('|11|                  Salir                      |11|');
   gotoxy(whereX + 24,whereY);
   writeln('-----------------------------------------------------');
   writeln();
   textcolor(lightmagenta);
   writeln();
   gotoxy(whereX + 25,whereY);
   writeln('------------------------------------------------');
   gotoxy(whereX + 25,whereY);
   write('Seleccione una opcion(teclas 0 a 11): ');
   readln(opcion);
   CASE opcion OF
        0:BEGIN
          clrscr;
          menu_desarrollador;
          END;
        1:BEGIN
          clrscr;
          ver_enciclopedia_segunda_guerra_mundial;
          END;
        2:BEGIN
          clrscr;
          ver_batallas_iconicas;
          END;
        3:BEGIN
          clrscr;
          ver_lideres;
          END;
        4:BEGIN
          END;
        5:BEGIN
          END;
        6:BEGIN
          clrscr;
          ocultismo_nazi;
          END;
        7:BEGIN
          END;
        8:BEGIN
          END;
        9:BEGIN
          END;
        10:BEGIN
           END;
   END;
   UNTIL (opcion = 11);
   END;

BEGIN
assign(archivo_informacion,'C:\Users\JULIO\Desktop\world_war_II_project\archivo_informacion.dat');
assign(archivo_batallas,'C:\Users\JULIO\Desktop\world_war_II_project\archivo_batallas.dat');
assign(archivo_lideres,'C:\Users\JULIO\Desktop\world_war_II_project\archivo_lideres.dat');
assign(archivo_armas,'C:\Users\JULIO\Desktop\world_war_II_project\archivo_armas.dat');
crea_archivo_informacion;
crea_archivo_batallas;
crea_archivo_lideres;
crea_archivo_armas;
menu_principal;
readkey;
END.
