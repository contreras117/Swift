import Foundation

class Transaction {
    var value: Float
    var name: String

    init (value: Float, name: String){
        self.value = value
        self.name = name
    }
}

class Debit : Transaction {

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
    //func debits() -> [Transaction] {
    //    return transactions.filter({$0 is Debit})
    //}

    //Funcion que regresa un listado de todas las transacciones que son Gain
    //func gains() -> [Transaction] {
    //    return transactions.filter({$0 is Gain})
    //}
}

class Person {
    var name: String
    var lastName: String
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
me.account = Account(amount:100_000, name:"X bank")

me.account?.addTransaction(
    transaction: Debit(value: 200, name: "Cena")
)
me.account?.addTransaction(
    transaction: Debit(value: 3000, name: "SSD M.2")
)
me.account?.addTransaction(
    transaction: Debit(value: 1000, name: "Chamarra de Mezclilla")
)
me.account?.addTransaction(
    transaction: Gain(value: 5000, name: "Salario")
)

print(me.account!.amount)
//print(me.account!.gains())
//print(me.account!.debits())