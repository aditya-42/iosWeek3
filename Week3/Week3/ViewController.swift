//
//  ViewController.swift
//  Week3
//
//  Created by Aditya Sanjeev Purohit on 2024-09-20.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
    
    
    var numbers = ["1","2","3","4","5"]
    var letters = ["a","b","c","d","e"]
    
    
    @IBOutlet weak var numberPicker: UIPickerView!
    @IBOutlet weak var letterPicker: UIPickerView!
    
    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberPicker.dataSource = self;
        numberPicker.delegate=self;
        
        letterPicker.dataSource = self;
        letterPicker.delegate=self;
    }
    

    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
         // count number of columns
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 0{
            return numbers.count
        }
        else{
            return letters.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView.tag == 0{
            return numbers[row]
        }
        else{
            return letters[row]
        }
        
        
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //print("Component:\(component) Row : \(row)")
        if pickerView.tag == 0{
            myLabel.text = "Numbers Picker \(numbers[row])"
            letters.append(numbers[row])
            numbers.remove(at: row)
            numberPicker.reloadAllComponents()
            letterPicker.reloadAllComponents()
        }
        else if pickerView.tag == 1{
            myLabel.text = "Letters Picker \(letters[row])"
            numbers.append(letters[row])
            letters.remove(at: row)
            numberPicker.reloadAllComponents()
            letterPicker.reloadAllComponents()
        }
        
    }


}

