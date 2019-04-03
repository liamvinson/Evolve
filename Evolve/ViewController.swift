//
//  ViewController.swift
//  Evolve
//
//  Created by Liam Vinson on 29/03/2019.
//  Copyright © 2019 Liam Vinson. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    

    @IBOutlet weak var imageOutput: UIImageView!
    @IBOutlet weak var shapeTypeInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Adds shadow to imageOutput
        imageOutput.layer.masksToBounds = false;
        imageOutput.layer.shadowColor = UIColor.lightGray.cgColor
        imageOutput.layer.shadowRadius = 5
        imageOutput.layer.shadowOpacity = 0.2
        imageOutput.layer.shadowOffset = CGSize(width: 0, height: 3)
        
        let thePicker = UIPickerView()
        shapeTypeInput.inputView = thePicker
        thePicker.delegate = self
    }
    
    
    
    // Shape Type Picker
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    let myPickerData = [String](arrayLiteral: "Polygons", "Rectangles", "Circles")
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView( _ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return myPickerData.count
    }
    
    func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return myPickerData[row]
    }

    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        shapeTypeInput.text = myPickerData[row]
    }
    
    
    
    
    
    
    
    

    // Image Picker
    @IBAction func chooseImage(_ sender: Any) {
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        
        let actionSheet = UIAlertController(title: "Photo Source", message:"Choose a source", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action:UIAlertAction) in
            imagePickerController.sourceType = .camera
            self.present(imagePickerController, animated: true, completion: nil)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action:UIAlertAction) in
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: nil)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.editedImage] as! UIImage
        
        imageOutput.image = image
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
}
