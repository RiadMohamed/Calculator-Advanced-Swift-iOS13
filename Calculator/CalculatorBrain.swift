import Foundation

struct CalculatorBrain {
    
    private var number: Double?
    private var intermediateCalculation: (n1: Double, operation: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    
    mutating func calculate(symbol: String) -> Double? {
        
        if let n = number {
            if symbol == "+/-" {
                return n * -1
            } else if symbol == "AC" {
                return 0
            } else if symbol == "%" {
                return n / 100
            } else if symbol == "=" {
                return perfromCalculation(n)
            }  else {
                intermediateCalculation = (n1: n, operation: symbol)
            }
        }
        return nil
    }
    
    private func perfromCalculation(_ n2: Double) -> Double? {
        if let n1 = intermediateCalculation?.n1, let op = intermediateCalculation?.operation {
            switch op {
                case "+":
                    return n1+n2
                case "-":
                return n1-n2
                case "*":
                return n1*n2
                case "/":
                return n1/n2
                default:
                fatalError("Operation is not supported")
            }
        }
        return nil
    }
    
    
}
