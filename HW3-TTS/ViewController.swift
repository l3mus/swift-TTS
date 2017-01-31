//
//  ViewController.swift
//  HW3-TTS
//
//  Created by Carlos Lemus on 1/31/17.
//  Copyright © 2017 Carlos Lemus. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    @IBOutlet weak var translationPicker: UIPickerView!
    
    let synthesizer = AVSpeechSynthesizer()
    
    @IBOutlet weak var lbl_correct: UILabel!
    let translations = [["zero","one", "two", "three", "four", "five","six","seven","eight", "nine"], ["cero","uno","dos","tres","cuatro","cinco","seis","siete","ocho","nueve"], ["0","1","2","3","4","5","6","7","8","9"]]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        translationPicker.delegate = self
        translationPicker.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return translations.count
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return translations[component].count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return translations[component][row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        getTranslation()
    }
    func getTranslation() {
        let english = translations[0][translationPicker.selectedRow(inComponent: 0)]
        let spanish = translations[1][translationPicker.selectedRow(inComponent: 1)]
        let number = translations[2][translationPicker.selectedRow(inComponent: 2)]
        
        lbl_correct.text = english + ", " + spanish + ", " + number
        
        if(english == "zero" && spanish == "cero" && number == "0"){
            translate(str_english: "zero",str_spanish: "cero",str_number: "0")
        }
        if(english == "one" && spanish == "uno" && number == "1"){
            translate(str_english: "one",str_spanish: "uno",str_number: "1")
        }
        if(english == "two" && spanish == "dos" && number == "2"){
            translate(str_english: "two",str_spanish: "dos",str_number: "2")
        }
        if(english == "three" && spanish == "tres" && number == "3"){
            translate(str_english: "three",str_spanish: "tres",str_number: "3")
        }
        if(english == "four" && spanish == "cuatro" && number == "4"){
            translate(str_english: "four",str_spanish: "cuatro",str_number: "4")
        }
        if(english == "five" && spanish == "cinco" && number == "5"){
            translate(str_english: "five",str_spanish: "cinco",str_number: "5")
        }
        if(english == "six" && spanish == "seis" && number == "6"){
            translate(str_english: "six",str_spanish: "seis",str_number: "6")
        }
        if(english == "seven" && spanish == "siete" && number == "7"){
            translate(str_english: "seven",str_spanish: "siete",str_number: "7")
        }
        if(english == "eight" && spanish == "ocho" && number == "8"){
            translate(str_english: "eight",str_spanish: "ocho",str_number: "8")
        }
        if(english == "nine" && spanish == "nueve" && number == "9"){
            translate(str_english: "nine",str_spanish: "nueve",str_number: "9")
        }
        
        
        
    }
    func translate(str_english: String , str_spanish: String, str_number: String){
        
        let english_speaker = AVSpeechUtterance(string: str_english)
        let spanish_speaker = AVSpeechUtterance(string: str_spanish)
        let number_speaker = AVSpeechUtterance(string: str_number)
        
        english_speaker.voice = AVSpeechSynthesisVoice(language: "en-GB")
        english_speaker.rate = 0.3
        
        number_speaker.voice = AVSpeechSynthesisVoice(language: "en-US")
        number_speaker.rate = 0.3
        
        spanish_speaker.voice = AVSpeechSynthesisVoice(language: "es-MX")
        spanish_speaker.rate = 0.3
        
        
        
        synthesizer.speak(english_speaker)
        synthesizer.speak(spanish_speaker)
        synthesizer.speak(number_speaker)
        
    }
    
}

