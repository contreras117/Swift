import Foundation

class Account {
    var amount: Float = 0{
        //El disparador willSet se ejecuta antes de que el valor de la variable cambie.
        willSet (nextValuue){ //La variable nextValue contiene el nuevo valor que tendra la variable amount una vez realizado el set. Esta variable puede no declararse y por defecto se llamara newValue.
            print("The current amount is: \(amount). The new amount will be \(nextValuue)")
        }
        //El disparador didSet se ejecuta despues de que el valor de la variable cambio.
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
        //Manera de regresar un valor compuesto dentro de la propiedad fullName. Tambien es posible usar solo la sentencia return y el valor,
        // si no es necesario hacer ninguna operacion dentro del get.
        get{
            return "\(name) \(lastName)"
        }
        set{ //El metodo set se ejecuta antes de cambiar el valor de la propiedad, por lo tanto la variable aun tiene su viejo valor. Al igual que en willSet se puede acceder al nuevo valor por default llamado newValue o se puede declarar con otro nombre.
            name = String(newValue.split(separator: " ").first ?? "")
            lastName = "\(newValue.split(separator: " ").last ?? "")"
        }
    }


    //A diferencia de las structs, las clases obligatoriamente deben tener un init declarado (Lo que en otros lenguajes serian constructores).
    init(name: String, lastName: String){
        self.name = name
        self.lastName = lastName
    }
}

var account = Account(amount:100_000, name:"X bank")

var me = Person(name:"Daniel",lastName: "Contreras")
print(me.fullName)

me.account = account

account.addTransaction(value:20)
me.account?.addTransaction(value: 30)

var anotherMe = Person(name:"",lastName:"")
anotherMe.fullName = "Alejandro Suarez"
print(anotherMe.name)
print(anotherMe.lastName)


print(account.amount)
print(me.account!.amount)