//
//  LuggageViewController.swift
//  LuggageOrganizer
//
//  Created by Brandon Cornel on 9/23/17.
//  Copyright © 2017 Brandon Cornel. All rights reserved.
//

import os.log
import UIKit

class LuggageViewController: UIViewController, UITextFieldDelegate,UITextViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    //MARK: Properties
    @IBOutlet weak var luggageNameTextField: UITextField!
    @IBOutlet weak var luggageDescriptionTextField: UITextView!
    @IBOutlet weak var luggageImage: UIImageView!
    @IBOutlet weak var luggageSaveButton: UIBarButtonItem!
    
    
    //MARK:Navigation
    
    override func viewDidLoad() {
        super.viewDidLoad()
        luggageNameTextField.delegate = self
        luggageDescriptionTextField.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        luggageNameTextField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(textField.text!)
    }
    
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        luggageDescriptionTextField.resignFirstResponder()
        return true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        print(textView.text!)
    }

    @IBAction func luggageImageSelection(_ sender: UITapGestureRecognizer) {
        luggageNameTextField.resignFirstResponder()
        luggageDescriptionTextField.resignFirstResponder()
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)

    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated:true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        luggageImage.image = selectedImage
        dismiss(animated:true, completion: nil)
            
    }
    
    
    /*
     This value is either passed by `LuggageTableViewController` in `prepare(for:sender:)`
     or constructed as part of adding a new meal.
     */
    var luggage: Luggage?
}
