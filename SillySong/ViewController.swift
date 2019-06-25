//
//  ViewController.swift
//  SillySong
//
//  Created by Sherif on 7/12/18.
//  Copyright © 2018 Sherif-Eldeeb. All rights reserved.
//

import UIKit


let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joined(separator: "\n")

func shortName(_ name: String) -> String{
    var Lname = name.lowercased()
    Lname = Lname.folding(options: .diacriticInsensitive, locale: NSLocale.autoupdatingCurrent)
    let cons = CharacterSet(charactersIn : "aouei")
    let shortedRange = Lname.rangeOfCharacter(from: cons)
    if shortedRange != nil {
        Lname = Lname.substring(from: (shortedRange?.lowerBound)!)
    }
    return Lname
}


func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
    let shortedName = shortName(fullName)
    var Song: String = lyricsTemplate
    Song = Song.replacingOccurrences(of: "<FULL_NAME>", with: fullName)
    Song = Song.replacingOccurrences(of: "<SHORT_NAME>", with: shortedName)
    print (Song)
    return Song
}


class ViewController: UIViewController {
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var customizedLyrics: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func Reset(_ sender: AnyObject) {
        nameField.text = String()
        customizedLyrics.text = String()
    }

    @IBAction func LyricsDisplay(_ sender: AnyObject) {
        if nameField.text != String(){
            customizedLyrics.text = lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: nameField.text! )
        }else{
            
        }
        
    }
}
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}
