import Foundation 

var transactions: [Float] = [10,20,100,40,100,10]

//------------------------------------------------------------------------
var total = transactions.reduce(0.0) { (result,element) -> Float in
    return result + element
}
print(total)

print(transactions.reduce(0.0, {return $0 + $1}))

print(transactions.reduce(0.0, {$0 + $1}))

print(transactions.reduce(0.0, +))

//------------------------------------------------------------------------

print(transactions.sorted(by: { (element1, element2) -> Bool in
    return element1 > element2
}))
print(transactions.sorted(by: <))


//------------------------------------------------------------------------

print(transactions.filter { (element) -> Bool in
    return element > 10
})

//------------------------------------------------------------------------

var newTransactions = transactions.map {(element) -> Float in
    return element * 100
}
print(newTransactions)

transactions.removeAll(where: {
    $0 > 10
})
print(transactions)


var transactionsDict: [String: [Float]] = [
    "1nov": [20,10,100],
    "2nov": [140,24],
    "3nov": [1000],
    "4nov": [87,53,91],
    "5nov": [10]
]

print(transactionsDict.reduce(0.0, {$0 + $1.value.reduce(0.0, +)}))

