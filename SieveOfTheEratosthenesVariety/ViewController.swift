//
//  ViewController.swift
//  SieveOfTheEratosthenesVariety
//
//  Created by Michelline Tran on 4/4/17.
//  Copyright © 2017 MichellineTran. All rights reserved.
//


//if you put something in the textfield that doesn't make sense, present a message saying "(bla blah blha) does not appear to be a number, please hang up or try again", and clear out textfield.

// no 0 or 1

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    private let cellIdentifier = "PRIME_CELL"

    private var dataArray = [Int]()

    @IBOutlet weak var primeCollectionView: UICollectionView!

    @IBOutlet weak var valueTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "PrimeCollectionViewCell", bundle: nil)
        primeCollectionView.register(nib, forCellWithReuseIdentifier: cellIdentifier)

        primeCollectionView.dataSource = self
        primeCollectionView.delegate = self

    }

    var primes = [Int]()


    // MARK: UICollectionViewDataSource

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
        let number = dataArray[indexPath.row]


        if primes.contains(number) {
            cell.backgroundColor = .lightGray
        }


        if let primeCell = cell as? PrimeCollectionViewCell {
            primeCell.valueLabel.text = String(number)
        }

        return cell
    }

    // MARK: UICollectionViewDelegate

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var previousPrimes = Set(primes)

        let number = dataArray[indexPath.row]

        let primeNumberGenerator = PrimeNumberGenerator()
        primes = primeNumberGenerator.findPrimesTheEratosthenesWayThrough(value: number)

        previousPrimes.formUnion(Set(primes))

//        let indexPaths = previousPrimes.map { (prime) -> IndexPath in
//            if let row = dataArray.index(of: prime) {
//                let indexPath = IndexPath(row: row, section: 0)
//                return indexPath
//            }
//            return IndexPath()
//        }

        var indexPaths = [IndexPath]()
        for prime in previousPrimes {
            if let row = dataArray.index(of: prime) {
                let indexPath = IndexPath(row: row, section: 0)
                indexPaths.append(indexPath)
            }
        }

        collectionView.reloadItems(at: indexPaths)
    }

    @IBAction func generate(_ sender: UIButton) {
        guard let text = valueTextField.text else {
            return
        }

        guard let textToInt = Int(text) else {

    // MARK: Non-Integer Alert

            // create alert
            let alert = UIAlertController(title: "Try Again", message: "The value entered is not an integer. Please try again.", preferredStyle: UIAlertControllerStyle.alert)

            // add the buttons
            alert.addAction(UIAlertAction(title: "Retry", style: UIAlertActionStyle.default, handler: nil))
            alert.view.tintColor = UIColor(colorLiteralRed: 118.0/255.0, green: 50.0/255.0, blue: 168.0/255.0, alpha: 0.67)

            // show the alert
            self.present(alert, animated: true, completion: nil)

            valueTextField.text = ""

            return
        }

        dataArray = getNumbersUpToValue(value: textToInt)

        primeCollectionView.reloadData()
    }

    //MARK - helpers

    private func getNumbersUpToValue (value: Int) -> [Int] {
        var array = [Int]()
        for i in 2...value {
            array.append(i)
        }
        return array
    }
}


