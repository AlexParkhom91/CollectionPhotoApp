//
//  PhotoViewController.swift
//  CollectoinPhotoApp
//
//  Created by Александр Пархамович on 25.08.22.
//

import UIKit

class PhotoViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    private var imageArray: [UIImage] = []
    private let imageView = UIImageView()
    private let newPhotoButton = UIButton()
    private let OpenPhotoButton = UIButton()
    

      override func viewDidLoad() {
        super.viewDidLoad()
          
        view.backgroundColor = .systemBlue
          imageField()
          
//MARK: - Buttons
          
          let newPhotoButton = createNewButton(buttonTitle: "Add photo")
          newPhotoButton.addTarget(self, action: #selector(onAddButton), for: .touchUpInside)
          view.addSubview(newPhotoButton)
          
          NSLayoutConstraint.activate([
            newPhotoButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30 ),
            newPhotoButton.bottomAnchor.constraint(equalTo: view.bottomAnchor , constant: -30),
            newPhotoButton.widthAnchor.constraint(equalToConstant: 120),
            newPhotoButton.heightAnchor.constraint(equalToConstant: 40)
          ])
          
          let OpenPhotoButton = createNewButton(buttonTitle: "Open photo")
          OpenPhotoButton.addTarget(self, action: #selector(openPhotoCollection), for: .touchUpInside)
          view.addSubview(OpenPhotoButton)
          
          NSLayoutConstraint.activate([
            OpenPhotoButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30 ),
            OpenPhotoButton.bottomAnchor.constraint(equalTo: view.bottomAnchor , constant: -30),
            OpenPhotoButton.widthAnchor.constraint(equalToConstant: 120),
            OpenPhotoButton.heightAnchor.constraint(equalToConstant: 40)
          ])
    }
    @objc func onAddButton(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
    
   @objc func openPhotoCollection() {
             let storyboard = UIStoryboard(name: "PhotoCollection", bundle: .main)
             let vc = storyboard.instantiateInitialViewController() as! PhotoCollection
             vc.imageArrayPC = imageArray
             present(vc, animated: true)
         }
    
    //MARK: - image appearance fild
    
    func imageField(){
    view.addSubview(imageView)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
    imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -60).isActive = true
    imageView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: 60).isActive = true
    imageView.heightAnchor.constraint(equalTo: view.heightAnchor, constant: -300).isActive = true
        
    
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.originalImage] as! UIImage
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
        imageArray.append(image)
        picker.dismiss(animated: true, completion: nil)

    }
    


}


