//
//  GifViewController.swift
//  Connecto
//
//  Created by Jerry Ren on 6/11/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit

class GifViewController: UIViewController & UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    @IBOutlet weak var pickFromLibraryImgView: UIImageView!
    
    @IBOutlet weak var profilerImageV: UIImageView!
    
    override func viewDidLoad() {
        profilerImageV.layer.cornerRadius = profilerImageV.frame.size.height / 2
        pikachuLoadsGIF()
        
 //       pickFromLibraryImgView.layer.cornerRadius = pickFromLibraryImgView.frame.size.height / 2
    }         
      
    private func pikachuLoadsGIF() {
        let pikachuGIF = UIImage.gifImageWithName(GloballyUsed.pikachuImageName)
        profilerImageV.image = pikachuGIF
    }
    
    @IBAction func uploadImgFro(_ sender: UIButton) {
        
        helperForImagePicking(cameraOrLibrary: .photoLibrary)
    }
    
    func helperForImagePicking(cameraOrLibrary sourceType: UIImagePickerController.SourceType) {
        
        let imgPickerCommander = UIImagePickerController.init()
        imgPickerCommander.delegate = self
        imgPickerCommander.allowsEditing = true
        imgPickerCommander.sourceType = sourceType
        present(imgPickerCommander, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let editableImage = info[.editedImage] as? UIImage {
            self.pickFromLibraryImgView.image = editableImage
        } else if let uneditableImage = info[.originalImage] as? UIImage {
            self.pickFromLibraryImgView.image = uneditableImage
        }
        
        dismiss(animated: true, completion: nil)
    }
              
    
    
    
}

