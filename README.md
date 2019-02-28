# Escena tridimensional

Víctor Ceballos Espinosa

## Introducción
El objetivo de esta práctica consiste en construir una escena en tres dimensiones, haciendo uso de texturas, luces y movimientos de cámara.

La escena que he decidido montar consiste en un edificio, un caza militar e inicialmente iba a haber tres tanques de guerra. Los tres modelos los obtuve de  . Sin aplicar ninguna textura, el programa se comportaba bastante bien. No había retardos ni latencia. Sin embargo, cuando empecé a aplicar las texturas, comenzó a aparecer bastante latencia. La hipótesis es que el modelo de los tanques era bastante complejo como para aplicar la textura en un ordenador sin gráfica externa (sólo tengo la integrada en la CPU). Es por esto por lo que decidí eliminar los tanques de la escena y añadir un cubo que pretende imitar un bunker.

## Texturas
A la hora de aplicar las texturas, he tenido que usar tres mecanismos diferentes. Comenzaré por el edificio ya que fue el más fácil. En el fichero del modelo .obj del edificio, existe una línea en la que se indica la textura que se quiere aplicar. Al descargar el modelo del edificio, también me descargué las texturas del mismo y al añadirla en la carpeta data, cuando se muestra el edificio, se le aplica la textura automáticamente.

Por otro lado, tuve que aplicar texturas a objetos de tipo PShape cargados mediante el método loadShape. Este es el caso de del caza militar. En esta ocasión no pude descargarme las texturas del mismo, por lo que descargué una imagen que imita el chasis metálico de los aviones y la apliqué haciendo uso del método setTexture de la clase PShape.

Por último nos encontramos los casos de las dos cajas: el suelo y el búnker. Para empezar es importante nombrar que no encontré una manera de aplicarle a un objeto creado con el método box una textura. Para solventar esto, cree una función que haciendo uso de los métodos beginShape y endShape, construyen una caja con las dimensiones que se pasen por los parámetros a parte de aplicar la textura que de igual manera sea pasada por parámetro. Para conseguir esto último, usé el método texture.

## Luces y materiales
En cuanto a las luces, he decidido aplicar dos tipos. Por un lado se aplica una luz general usando el método lights. Por otro lado, se usa una luz direccional que pretende imitar el Sol. Esta luz direccional está situada de tal forma que el avión quede en la sombra que proyectaría el edificio.

Con esta combinación de luces, se conseguir apreciar la diferencia de color alrededor de los objetos. En la sección de la cámara, se describe cómo mover la misma para poder observar estos efectos de una mejor forma.

Con el objetivo de simular los materiales, se han aplicado las funciones shininess y specular, de tal manera que aquellos objetos que en teoría son de un material brillante como el metal o las paredes del edificio, muestren dicho brillo. En el caso del suelo, se entiende por la textura que se trata de tierra y la tierra no es brillante. Para evitar que lo sea, se ha aplicado la función shininess con un valor muy bajo tal y como se hizo en los ejercicios de prueba en la práctica.


## Cámara
Cómo el objetivo principal de esta práctica no era la implementación de la cámara como si lo era en la práctica anterior, se ha implementado una cámara sencilla que sirva para visualizar mejor la escena.

La cámara en cuestión permite rotar alrededor de la escena, así como mover el cursor para apuntar la cámara a diferentes puntos de la escena. 

Para mover la cámara se usan los siguientes controles:

 - Para girar hacia la derecha, se pulsa el botón d del teclado
 - Para girar hacia la izquierda, se pulsa el botón a del teclado
 - Para cambiar el punto al que apunta la cámara, bastará con mover el cursor por la escena.

## Referencias
[Para descargar los modelos 3D](https://www.turbosquid.com)
[Enunciado de la práctica](https://cv-aep.ulpgc.es/cv/ulpgctp19/pluginfile.php/182523/mod_resource/content/13/CIU_Pr_cticas.pdf)
[Repositorio de GitHub](https://github.com/victcebesp/3DSceneWithLights)
