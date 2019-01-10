import Foundation

//La principal diferencia entre un Struct y un Class, es que al iniciar una struct, este vive completamente en memoria, es decir, la variable donde oonde esta almacenada contiene todos los datos de ese estruct.
//Mientras que con un Class esa variable solo almacena la direccon en memoria donde esta guardado. Si asigna una instancia de una clase  a una nueva variable, ambas variables seguiran refiriendose a la misma instancia
//y si una modificada, ambas se veran afectadas. Esto ultimo no ocurre con los Struct, ya que cada variable guarda una instancia completamente diferene.

//Otra diferencia clave es que los Struct no soportan herancia.
struct Account {
    var amount: Float = 0
    var name: String  = ""
    var transactions: [Float] = []

    init(amount: Float, name: String){
        self.amount = amount
        self.name = name
    }

    @discardableResult
    mutating func addTransaction(value: Float) -> Float{
        if amount - value < 0{
            return 0
        }
        amount -= value
        transactions.append(value)
        return amount
    }
}

struct Person {
    var name: String
    var lastName: String
    var account: Account?
}

var account = Account(amount:100_000, name:"X bank")

var me = Person(name:"Daniel",lastName: "Contreras", account: nil)

me.account = account

account.addTransaction(value:20)
me.account?.addTransaction(value: 30)

print(account)
print(me.account!)