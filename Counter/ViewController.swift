//
//  ViewController.swift
//  Counter
//
//  Created by Macbook on 15.06.2023.
//

import UIKit

class ViewController: UIViewController {

    private var counter: Int = 0
    
    @IBOutlet weak var counterValueLabel: UILabel!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var databaseOfChangesTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setToCounterValueLabel(value: counter)
        
        plusButton.tintColor = .red
        minusButton.tintColor = .blue
        zeroButton.tintColor = .green
        databaseOfChangesTextView.text = "История изменений:"
    }
    
    
    @IBAction func plusButtonPressed() {
        counter += 1
        setToCounterValueLabel(value: counter)
        databaseOfChangesTextView.text += "\n\(getData()): значение изменено на +1"
    }
    
    @IBAction func minusButtonPressed() {
        if counter == 0 {
            databaseOfChangesTextView.text += "\n\(getData()): попытка уменьшить значение счётчика ниже 0"
        } else {
            counter -= 1
            setToCounterValueLabel(value: counter)
            databaseOfChangesTextView.text += "\n\(getData()): значение изменено на -1"
        }
    }
    
    @IBAction func zeroButtonPressed() {
        counter = 0
        setToCounterValueLabel(value: counter)
        databaseOfChangesTextView.text += "\n\(getData()): значение сброшено"
    }
    
    func setToCounterValueLabel(value: Int) {
        counterValueLabel.text = "Значение счётчика: \(value)"
    }
    
    func getData() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.YY HH:mm:ss"
        return dateFormatter.string(from: Date())
    }
}

