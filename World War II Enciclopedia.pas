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

VAR
   archivo_informacion: FILE OF informacion;
   registro_informacion: informacion;
   archivo_batallas: FILE OF batallas;
   registro_batallas: batallas;
   archivo_lideres: FILE OF lideres;
   registro_lideres: lideres;

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

PROCEDURE carga_de_informacion;
VAR
  opcion: integer;
  BEGIN
  REPEAT
   clrscr;
   textcolor(brown);
   writeln('1. Cargar y crear enciclopedia de la Segunda Guerra Mundial');
   writeln('2. Cargar sobre las batallas iconicas');
   writeln('3. Cargar sobre los lideres');
   writeln('4. Cargar sobre las armas');
   writeln('5. Cargar sobre el ocultismo Nazi');
   writeln('6. Cargar tabla cronologica de la contienda');
   writeln('7. Cargar archivo del Holocausto');
   writeln('8. Cargar archivo de las Wanderwaffe');
   writeln('9. Cargar archivo trivia');
   writeln('10. Regresar al menu del desarollador.');
   writeln();
   writeln('-----------------------------------------------------------');
   write('Seleccione una opcion: ');
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
          END;
        5:BEGIN
          END;
        6:BEGIN
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
  UNTIL (opcion = 10);
  END;

PROCEDURE baja_informacion;
VAR
  opcion: integer;
  BEGIN
  REPEAT
   clrscr;
   writeln('1. Baja sobre las batallas iconicas');
   writeln('2. Baja sobre los lideres');
   writeln('3. Baja sobre las armas');
   writeln('4. Baja sobre el ocultismo Nazi');
   writeln('5. Baja tabla cronologica de la contienda');
   writeln('6. Baja archivo del Holocausto');
   writeln('7. Baja archivo de las Wanderwaffe');
   writeln('8. Baja archivo trivia');
   writeln('9. Regresar al menu del desarollador.');
   writeln();
   writeln('-----------------------------------------------------------');
   write('Seleccione una opcion: ');
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
        8:BEGIN
          END;
   END;
  UNTIL (opcion = 9);
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
   writeln('5. Modificar sobre el ocultismo Nazi');
   writeln('6. Modificar tabla cronologica de la contienda');
   writeln('7. Modificar archivo del Holocausto');
   writeln('8. Modificar archivo de las Wanderwaffe');
   writeln('9. Modificar archivo trivia');
   writeln('10. Regresar al menu del desarollador.');
   writeln();
   writeln('-----------------------------------------------------------');
   write('Seleccione una opcion: ');
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
        8:BEGIN
          END;
        9:BEGIN
          END;
        10:BEGIN
           END;
   END;
  UNTIL (opcion = 10);
  END;

PROCEDURE menu_desarrollador;
VAR
   opcion: integer;
   BEGIN
   REPEAT
   clrscr;
   writeln('1. Alta de informacion');
   writeln('2. Baja de informacion');
   writeln('3. Modificaciones de informacion');
   writeln('4. Regresar al menu principal');
   writeln();
   writeln('--------------------------------');
   writeln('Seleccione una opcion: ');
   readln(opcion);
   CASE opcion OF
        1:BEGIN
          clrscr;
          carga_de_informacion;
          END;
        2:BEGIN
          clrscr;
          baja_informacion;
          END;
        3:BEGIN
          clrscr;
          Modifica_informacion;
          END;
   END;
   UNTIL (opcion = 4);
   END;

PROCEDURE menu_principal;
VAR
   opcion: integer;
   BEGIN
   REPEAT
   clrscr;
   writeln('0. Opcion para el desarrollador');
   writeln('1. Ver enciclopedia de la Segunda Guerra Mundial');
   writeln('2. Batallas iconicas');
   writeln('3. Lideres');
   writeln('4. Armas');
   writeln('5. Protector de pantalla');
   writeln('6. Ocultismo Nazi');
   writeln('7. Tabla cronologica de la contienda');
   writeln('8. Holocausto');
   writeln('9. Wanderwaffe');
   writeln('10. Trivia');
   writeln('11. Salir');
   writeln();
   writeln('------------------------------------------------');
   write('Seleccione una opcion: ');
   readln(opcion);
   CASE opcion OF
        0:BEGIN
          clrscr;
          menu_desarrollador;
          END;
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
assign(archivo_informacion,'C:\Users\JULIO\Desktop\SOFTWARE PROJECTS\Proyectos Personales\3. World War II Enciclopedia\archivo_informacion.dat');
assign(archivo_batallas,'C:\Users\JULIO\Desktop\SOFTWARE PROJECTS\Proyectos Personales\3. World War II Enciclopedia\archivo_batallas.dat');
assign(archivo_lideres,'C:\Users\JULIO\Desktop\SOFTWARE PROJECTS\Proyectos Personales\3. World War II Enciclopedia\archivo_lideres.dat');
crea_archivo_informacion;
crea_archivo_batallas;
crea_archivo_lideres;
menu_principal;
readkey;
END.
