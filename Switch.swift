import Foundation

var age = 26
var tax =1.0

switch age {
case 1...17: //De esta manera se puede trabajar con rangos de valores.
    print("No podemos dar una tarjeta de credito")
case 18...22:
    tax = 2
    print("La tasa de interes es del 2%")
case 23...25:
    tax = 1.5
    print("La tasa de interes es del 1.5%")
default:
    print("La tasa de interes es del 1%")
    
}

