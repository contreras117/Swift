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
    for transaction in transactionsDict[key]! where transaction > 10 { 
        total += transaction
    }
}

print(total)