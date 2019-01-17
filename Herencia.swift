import Foundation


enum DebitCategories {
    case helth
    case food,services,entertainment
    case rent, transportation, luxury
}

class Transaction {
    var value: Float
    var name: String

    init (value: Float, name: String){
        self.value = value
        self.name = name
    }
}

class Debit : Transaction {
    var category: DebitCategories

    init (value: Float, name: String, category: DebitCategories){
        self.category = category
        super.init(value: value, name: name)
    }
}

class Gain : Transaction {

}

class Account {
    var amount: Float = 0
    var name: String  = ""
    var transactions: [Transaction] = []

    init(amount: Float, name: String){
        self.amount = amount
        self.name = name
    }

    @discardableResult
    func addTransaction(transaction: Transaction) -> Float{

        if transaction is Debit {
            if amount - transaction.value < 0{
                return 0
            }
            amount -= transaction.value
        }else if transaction is Gain {
            amount -= transaction.value
        }
        transactions.append(transaction)
        return amount
    }

    //Funcion que regresa un listado de todas las transacciones que son Debit
    func debits() -> [Transaction] {
        return transactions.filter({$0 is Debit})
    }

    //Funcion que regresa un listado de todas las transacciones que son Gain
    func gains() -> [Transaction] {
        return transactions.filter({$0 is Gain})
    }

    func transactionsFor(category: DebitCategories) -> [Transaction]{
        return transactions.filter({(transaction) -> Bool in
            guard let transaction = transaction as? Debit else {
                return false
            }
            return transaction.category == category
        })
    }
}

class Person {
    let name: String
    let lastName: String
    var account: Account?
    var fullName: String {
            return "\(name) \(lastName)"
    }

    init(name: String, lastName: String){
        self.name = name
        self.lastName = lastName
    }
}


var me = Person(name:"Daniel",lastName: "Contreras")
let account = Account(amount:100_000, name:"X bank")
me.account = account

me.account?.addTransaction(
    transaction: Debit(value: 200, name: "Cena", category: DebitCategories.food)
)
me.account?.addTransaction(
    transaction: Debit(value: 300, name: "Gas", category: .transportation)
)
me.account?.addTransaction(
    transaction: Debit(value: 1000, name: "Chamarra de Mezclilla", category: .luxury)
)
me.account?.addTransaction(
    transaction: Gain(value: 5000, name: "Salario")
)

print("The total account is : \(me.account!.amount)")

for gain in me.account!.gains(){
    print("There was a gain of \(gain.value) for \(gain.name)")
}

for debit in me.account!.debits(){
    print("There was a debit  of \(debit.value) for \(debit.name)")
}
