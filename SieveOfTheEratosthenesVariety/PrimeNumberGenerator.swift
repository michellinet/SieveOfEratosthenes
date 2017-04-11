//
//  PrimeNumberGenerator.swift
//  SieveOfTheEratosthenesVariety
//
//  Created by Michelline Tran on 4/4/17.
//  Copyright © 2017 MichellineTran. All rights reserved.
//

import Foundation

class PrimeNumberGenerator {
    func findPrimesThrough(value: Int) -> Array<Int> {
        var primes = [Int]()
        for number in 2...value {
            if number == 2 {
                primes.append(number)
                continue
            }
            if number == 3 {
                primes.append(number)
                continue
            }

            var isPrime: Bool = true

            for prime in primes {
                if number % prime == 0 {
                    isPrime = false
                    break
                }
            }

            if isPrime {
                primes.append(number)
            }

        }
        return primes
    }


    func findPrimesTheEratosthenesWayThrough(value: Int) -> [Int] {
        var A = Array(repeating: true, count: value+1)

        let u = floor(sqrt(Double(value)))
        for i in 2...Int(u) {
            if A[i] {
                for j in stride(from: i*i, to: value, by: i) {
                    A[j] = false
                }
            }
        }

        let possibleValues = 2...(value - 1)
        var primes = [Int]()
        for p in possibleValues {
            if A[p] {
                primes.append(p)
            }
        }

        return primes
    }
}




