import Foundation 

var transactionsDict: [String: [Float]] = [
    "1nov": [20,10,100],
    "2nov": [],
    "3nov": [1000],
    "4nov": [],
    "5nov": [10]
]

var total: Float = 0
for key in transactionsDict.keys {
    for transaction in transactionsDict[key] ?? []{ //El doble ?? se maneja para indicar que en caso den no encontra un el diccionario un valor para esa key, se regrese un array vacio '[]'
        total += transaction
    }
}

print(total)

