import Foundation

//Se puede asignar un tipo de dato a los enum. De esta manera, al acceder al property "rawValue" se accederia a ese valor. En este caso al ser de tipo String, el valor seria
//el mismo texto pero como un String, pudiendo aplicar las funciones y propiedades de un String. Tambien se puede asignar un valor especial a cada uno de los case del enum.
enum DebitCategories: String {
    case helth = "Salud"
    case food,services,entertainment
    case rent, transportation, luxury = "Cosas que no necesito"
}

//En este caso que el valor es de tipo Int, al acceder al property "rawValue", los cases son enumerados desde el 0. Tambien se le puede asignar un valor especial a cada case.
enum GainCategories: Int {
    case sale, salary, gift = 10
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
    var category: GainCategories

    init( value: Float, name: String, category: GainCategories){
        self.category = category
        super.init(value: value, name: name)
    }
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
    func debits() -> [Debit] {
        return transactions.filter({$0 is Debit}) as! [Debit]
    }

    //Funcion que regresa un listado de todas las transacciones que son Gain
    func gains() -> [Gain] {
        return transactions.filter({$0 is Gain}) as! [Gain]
    }

    func debitsFor(category: DebitCategories) -> [Transaction]{
        return transactions.filter({(transaction) -> Bool in
            guard let transaction = transaction as? Debit else {
                return false
            }
            return transaction.category == category
        })
    }

    func gainsFor(category: GainCategories) -> [Transaction]{
        return transactions.filter({(transaction) -> Bool in
            guard let transaction = transaction as? Gain else {
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
    transaction: Gain(value: 5000, name: "Quincena", category: .salary)
)

print("The total account is : \(me.account!.amount)")

for gain in me.account!.gains(){
    print(gain.name, gain.value, gain.category.rawValue)
}

for debit in me.account!.debits(){
    print(debit.name, debit.value, debit.category.rawValue.capitalized)
}

let debitTransactions = me.account?.debitsFor(category: .food) as? [Debit]
for transaction in debitTransactions ?? [] {
    print(transaction.name, transaction.value, transaction.category)
}

let gainTransactions = me.account?.gainsFor(category: .salary) as? [Gain]
for transaction in gainTransactions ?? []{
    print(transaction.name, transaction.value, transaction.category)
}

