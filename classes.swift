import Foundation

class Account {
    var amount: Float = 0{
        willSet (nextValuue){ //La variable nextValue contiene el nuevo valor que tendra la variable amount una vez realizado el set. Esta variable puede no declararse y por defecto se llamara newValue.
            print("The current amount is: \(amount). The new amount will be \(nextValuue)")
        }

        didSet{
            print("The new amount is: \(amount)")
        }
    }
    var name: String  = ""
    var transactions: [Float] = []

    init(amount: Float, name: String){
        self.amount = amount
        self.name = name
    }

    @discardableResult
    func addTransaction(value: Float) -> Float{
        if amount - value < 0{
            return 0
        }
        amount -= value
        transactions.append(value)
        return amount
    }
}

class Person {
    var name: String
    var lastName: String
    var account: Account?
    var fullName: String {
        get{
            return "\(name) \(lastName)"
        }
    }

    init(name: String, lastName: String){
        self.name = name
        self.lastName = lastName
    }
    init(fullName: String){
        self.fullName = fullName
    }
}

var account = Account(amount:100_000, name:"X bank")

var me = Person(name:"Daniel",lastName: "Contreras")
print(me.fullName)

me.account = account

account.addTransaction(value:20)
me.account?.addTransaction(value: 30)


print(account.amount)
print(me.account!.amount)