//
//  ViewController.swift
//  imagePicker
//
//  Created by Sidhartha Das on 05/10/19.
//  Copyright © 2019 codeWithSam. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UINavigationControllerDelegate, UIImagePickerControllerDelegate{

    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func imgChooseButton(_ sender: Any) {
        
        
        
        let imageController = UIImagePickerController()
        
        imageController.delegate = self
        
        
        let alert = UIAlertController(title: "Photo Source", message: "Please Select an Option", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (_) in
           
            imageController.sourceType = .camera
            self.present(imageController, animated: true, completion: nil)
            
        }))
        
        alert.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action :UIAlertAction) in
            
           permission()
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
        
        
        
        
        func permission() {
            
            let alert = UIAlertController(title: "ImagePicker", message: " Would Like to Access the Library", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Don't Allow", style: .cancel, handler: nil))
            alert.addAction(UIAlertAction(title: "Allow", style: .default, handler: {(action :UIAlertAction) in
                
                imageController.sourceType = .photoLibrary
                self.present(imageController, animated: true, completion: nil)
            }))
            
            self.present(alert, animated: true)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }


}

