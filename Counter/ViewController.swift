//
//  ViewController.swift
//  Counter
//
//  Created by Macbook on 15.06.2023.
//

import UIKit

class ViewController: UIViewController {

    private var counter: Int = 0
    
    @IBOutlet weak private var counterValueLabel: UILabel!
    @IBOutlet weak private var plusButton: UIButton!
    @IBOutlet weak private var minusButton: UIButton!
    @IBOutlet weak private var zeroButton: UIButton!
    @IBOutlet weak private var databaseOfChangesTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setToCounterValueLabel(value: counter)
        
        plusButton.tintColor = .red
        minusButton.tintColor = .blue
        zeroButton.tintColor = .green
        databaseOfChangesTextView.text = "История изменений:"
    }
    
    
    @IBAction private func plusButtonPressed() {
        counter += 1
        setToCounterValueLabel(value: counter)
        databaseOfChangesTextView.text += "\n\(getData()): значение изменено на +1"
    }
    
    @IBAction private func minusButtonPressed() {
        if counter == 0 {
            databaseOfChangesTextView.text += "\n\(getData()): попытка уменьшить значение счётчика ниже 0"
        } else {
            counter -= 1
            setToCounterValueLabel(value: counter)
            databaseOfChangesTextView.text += "\n\(getData()): значение изменено на -1"
        }
    }
    
    @IBAction private func zeroButtonPressed() {
        counter = 0
        setToCounterValueLabel(value: counter)
        databaseOfChangesTextView.text += "\n\(getData()): значение сброшено"
    }
    
    private func setToCounterValueLabel(value: Int) {
        counterValueLabel.text = "Значение счётчика: \(value)"
    }
    
    private func getData() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.YY HH:mm:ss"
        return dateFormatter.string(from: Date())
    }
}

