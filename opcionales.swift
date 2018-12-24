// Los opcionales son variables que pueden existir o no durante algun momento de la ejecucion.

import Foundation

var name: String? //Manera de declarar un opcional. Por defecto su valor es nil (null en swift). Esto no es mas que la manera de declarar una variable sin inicializar su valor.
print (name ?? "No tenemos nombre") // El ?? es para imprimir imprimir algo por defecto en caso de que name sea igual a nil.

name = "Daniel"

//Esta es una manera de asegurarse que la variable name ya fue inicializada.
//Si en este momento no tiene ningun valor, la asignacion falla y el if no se cumple y no se entra a su codigo interior.

if let name = name{
    print(name) //Este "name" es la constante let declarada en el if
}

var lastName: String?
lastName = "Contreras"
print(lastName!) //Esta es una maera de decirle al codigo y forzarlo a tomar la variable como ya inicializada. Esto puede generar errores en tiempo de ejecucion.