//
//  ViewController.swift
//  segmentControl
//
//  Created by Javier Rodríguez Valentín on 24/09/2021.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tab1: UITextView!
    @IBOutlet weak var tab2: UITextView!
    @IBOutlet weak var tab3: UITextView!
    
    
    @IBOutlet weak var sc: UISegmentedControl!
    
    var arrayTabs = ["tab1", "tab2", "tab3"]
    var arrayTabsCont:[UITextView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrayTabsCont = [tab1, tab2, tab3]
        
        sc.removeAllSegments() // eliminar los segments predefinidos
        
        //hacemos un for each en el array y los pone en los segments
        for (index, value) in arrayTabs.enumerated(){
            sc.insertSegment(withTitle: value, at: index, animated: true)
        }
        
        sc.selectedSegmentIndex = 0 //selecciona el primer segmento al iniciarse
        hideTabs(sctab: sc.selectedSegmentIndex) //nos llama a la función para ocultar y mostrar los tabs
        
    }
    
    @IBAction func scAction(_ sender: Any) {
        
        print("El tab seleccionado es: \(sc.selectedSegmentIndex)")
        
        hideTabs(sctab: sc.selectedSegmentIndex)
        
    }
    
    func hideTabs(sctab:Int){
        
        //el método for es más ordenado. El valor del array se hace oculto o visible según se cumpla o no la condición entre paréntesis.
        for (index, value) in arrayTabsCont.enumerated(){
            value.isHidden = (sctab != index)
        }
        
        
        //es mejor hacerlo con un bucle for ya que con un if, etc tenemos que modificar el código. Además queda largo
        /*if sctab == 0{
            tab1.isHidden = false
            tab2.isHidden = true
            tab3.isHidden = true
        }else if sctab == 1{
            tab1.isHidden = true
            tab2.isHidden = false
            tab3.isHidden = true
        }else if sctab == 2{
            tab1.isHidden = true
            tab2.isHidden = true
            tab3.isHidden = false
        }else{
            tab1.isHidden = false
            tab2.isHidden = true
            tab3.isHidden = true
        }*/
       
        
    }
    
}

