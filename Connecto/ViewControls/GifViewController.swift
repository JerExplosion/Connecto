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
        pickFromLibraryImgView.contentMode = .scaleAspectFill
        
  //      helperForImagePicking(cameraOrLibrary: .photoLibrary)
        
        self.uploadButtonActionSheet()
    }
    
    func uploadButtonActionSheet() {
        
        let cameraOrPhotoLibraryAlertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let action1 = UIAlertAction(title: "Choose From Library", style: .default) { cameraAction in
            self.helperForImagePicking(cameraOrLibrary: .photoLibrary)
        }
        let action2 = UIAlertAction(title: "Take Photo", style: .default) { (photolibraryAction) in
            self.helperForImagePicking(cameraOrLibrary: .camera)
        }
        let deletion = UIAlertAction(title: "Delete Photo", style: .default) {
            deleteAction in
            self.pickFromLibraryImgView.backgroundColor = .black
        }
        
        let cancellation = UIAlertAction(title: "Cancel", style: .cancel) {
            (cancelAction) in
            print(cancelAction)
        }
        
        [action1, action2, deletion, cancellation].map({ cameraOrPhotoLibraryAlertController.addAction($0) })

        present(cameraOrPhotoLibraryAlertController, animated: true)
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

