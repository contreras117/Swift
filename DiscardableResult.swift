import Foundation

var transactions: [Float] = [
    100,
    96,
    41,
    12
]
var accountTotal: Float = 10000

//@discardableResult es usado para decirle al compilador que el valor que returna la funcion
//no es necesesario y no debe ocupar espacio en memoria. Tambien se evita que el retorno de la
//funcion genere conflictos.
@discardableResult
func addTransaction(transactionValue value: Float? = nil) -> (efected: Bool, newTotalAccount: Float) {
    //Esta es otra manera de asegurarse que un valor opcional tenga valor. El bloque 
    //de codigo se ejecuta si el valor de value es nil. El cual es el valor por defecto, 
    //en caso de que no se le pase el parametro a la funcion.
    guard let value = value else {
        print("No value")
        return (false, accountTotal)
    }
    
    if(accountTotal - value < 0){
        return (false,accountTotal)
    }
    transactions.append(value)
    accountTotal -= value
    print("Value added")
    return (true, accountTotal)
}

let transactionAdded = addTransaction(transactionValue: 51)
let transactionAdded2 = addTransaction()

print(transactionAdded.newTotalAccount)
print(transactionAdded2.newTotalAccount)

