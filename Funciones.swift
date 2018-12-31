import Foundation

var transactionsDict: [String: [Float]] = [
    "1nov": [20,10,100],
    "2nov": [140,24],
    "3nov": [1000],
    "4nov": [87,53,91],
    "5nov": [10]
]

var transactionsDict2: [String: [Float]] = [
    "1nov": [1000],
    "3nov": [1000],
    "4nov": [1000]
]


//Al declarar los parametros de una funcion se puede especificar un nombre externo para llamar al paremtro
//al momento de invocar la funcion, otro nombre interno para llamar al paramtro dentro de la funcion,
//o tambien se puede declarar con un _ para no especificar ningun nombre al momento de la invocacion.
//En esta funcion se usa "forTransactions" para llamar al parametro de manera externa al momento de invocar la funcion,
//y se usa "transactions" de manera interna dentro de la funcion.
func totalTransac(forTransactions transactions: [String: [Float]]) -> Float{
    var total: Float = 0
    for key in transactions.keys{
        let array = transactions[key]!
        total = array.reduce(total,+)
    }
    return(total)
}

print(totalTransac(forTransactions: transactionsDict))
print(totalTransac(forTransactions: transactionsDict2))


//De esta manera se declaran los parametro para no especificar un nombre al momento de la invocacion de la funcion.
func suma(_ num1: Int, _ num2: Int) -> Int{
    return(num1 + num2)
}

print(suma(123,263))