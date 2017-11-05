//
//  ConverterViewController.swift
//  Calculator Conversion UI
//
//  Created by David Auger on 11/5/17.
//  Copyright © 2017 David Auger. All rights reserved.
//

import UIKit

class ConverterViewController: UIViewController
{
    @IBOutlet weak var outputDisplay: UITextField!
    @IBOutlet weak var inputDisplay: UITextField!
    
    var converters: [ Converter ] = [ Converter ]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        converters = [
            Converter( label: "Fahrenheit to Celcius", inUnit: "°F", outUnit: "°C" ),
            Converter( label: "Celcius to Fahrenheit", inUnit: "°C", outUnit: "°F" ),
            Converter( label:   "Miles to Kilometers", inUnit: "mi", outUnit: "km" ),
            Converter( label:   "Kilometers to Miles", inUnit: "km", outUnit: "mi" )
        ]
        
        outputDisplay.text = converters[ 0 ].outUnit
        inputDisplay.text  = converters[ 0 ].inUnit
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func selectConverter( _ sender: UIButton )
    {
        let alert = UIAlertController( title: "Choose Converter", message: nil, preferredStyle: UIAlertControllerStyle.actionSheet )
        
        for converter in converters
        {
            alert.addAction( UIAlertAction( title: converter.label, style: UIAlertActionStyle.default, handler: {
                ( alertAction ) -> Void in
                self.outputDisplay.text = converter.outUnit
                self.inputDisplay.text  = converter.inUnit
            }))
        }
        
        alert.addAction( UIAlertAction( title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil ) )
        
        self.present( alert, animated: true, completion: nil )
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
