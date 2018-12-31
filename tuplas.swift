import Foundation


var transactionsDict: [String: [Float]] = [
    "1nov": [20,10,100],
    "2nov": [140,24],
    "3nov": [1000],
    "4nov": [87,53,91],
    "5nov": [10]
]

//Se pueden regresar multiples valores mediante tuplas. Al declarar la funcion
//se especifican los tipos de los datos de la tupla y se les puede asignar un nombre
//para llamar los valores.
func totalTransac(_ transactions: [String: [Float]]) -> (total: Float, numTrans: Int){
    var total: Float = 0
    for key in transactions.keys{
        let array = transactions[key]!
        total = array.reduce(total,+)
    }
    return(total, transactions.count)
}

let total = totalTransac(transactionsDict)
//Se puede acceder a los valores de las tuplas mediante indices
print(total.0, total.1)
//Tambien se puede acceder a los valores medinate los nombres que se les asigno.
print(total.total, total.numTrans)

//Manera de declarar una tupla como una constante y acceder a sus valores tanto con indices, como con nombres.
let name = (firstName: "Daniel", lastName: "Contreras")
print(name.firstName)
print(name.1)


//Manera de intercambiar valores de dos variables sin tener usa una tercera variable, usando tuplas.
var a = 21
var b = 65
print (a,b)
(a,b) = (b,a)
print(a,b)