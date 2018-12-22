import Foundation 

//Las constantes  se declaran con las palabra reservada let
let name: String = "Daniel"
let lastName = "Contreras"
//Las variables se declaran con la palabra reservada var
//El tipo de dato puede ser especificado o puede dejarse implicito al asignarle un valor, y por defecto Swift determinara el tipo
//de la variable o constante.
var age: Int8 = 26
var accountTotal: Float = 1_000_000  //Esta es una manera especial de swift para escribir numeros grandes.
//var account = 1e6    Esta es otra manera de escribr un millon. El numero despues de la 'e' determina cuantos ceros son.


var fullName = "\(name) \(lastName)".capitalized

var flag = fullName.isEmpty

//Asi se especifica el tipo de datos del array. No se pueden guardar datos de diferente tipo en un mismo array. Si es dice explicitamente
//el tipo de los datos, swift determinara el tipo por default.
var transactions: [Float] = [20,10,100.0]
transactions.first
transactions.count
transactions.last
transactions.isEmpty
transactions.apppend(40)
transactions.min()
transactions.max()
transactions.removeLast()



//Ejemplo de diccionario. Array al que se accede al valor por una kay de cualquier tipo especificado.
var transactionsDict: [String: [Float]] = [
    "1nov": [20,10,100],
    "2nov": [],
    "3nov": [1000],
    "4nov": [],
    "5nov": [10]
]

print(fullName)
print(flag)
print(transactionsDict["1nov"])

print(transactionsDict["1nov"]?[1])
