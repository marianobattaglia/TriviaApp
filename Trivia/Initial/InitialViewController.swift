//
//  InitialViewController.swift
//  Trivia
//
//  Created by Mariano Martin Battaglia on 28/05/2022.
//

import UIKit

class InitialViewController: UIViewController {

    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var userTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Evita que se creen constraints de forma automatica
        logo.translatesAutoresizingMaskIntoConstraints = false
        
        // Distancia del logo al borde superior de la vista
        // (se quito para que se desplace el scrollview)
        //logo.topAnchor.constraint(equalTo: view.topAnchor,constant: 100).isActive = true
        
        // Ancho del logo fijo
        logo.widthAnchor.constraint(equalToConstant: 150).isActive = true
        // Centrar el logo horizontalmente respecto de la vista
        let centerHorizontal = logo.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        NSLayoutConstraint.activate([centerHorizontal])
        // imagen circular
        logo.layer.cornerRadius = logo.frame.size.width / 2
        logo.clipsToBounds = true
        
    }

    
    @IBAction func infoTapped(_ sender: Any) {
        let vc = InformationViewController(nibName: "InformationViewController", bundle: nil)
        self.present(vc, animated: true)
    }
    
    @IBAction func startTriviaTapped(_ sender: Any) {
        
        if userTextField.hasText {
            let nombre = userTextField.text!
            print("Boton Empezar presionado. Nombre del usuario: \(nombre)")
            
            // Navegacion a QuestionViewController:
//            let vc = QuestionViewController(nibName: "QuestionViewController", bundle: nil)
//            let navigationController = UINavigationController(rootViewController: vc)
//            self.present(navigationController, animated: true)
            
            
            // Tab Bar presentation
            presentTabBarController()
            
        } else {
            print("Por favor ingrese un nombre de usuario primero")
        }
    }
    
    //Presentar Tab Bar
    private func presentTabBarController() {
        let tabBarController = TabBarController()
        tabBarController.modalPresentationStyle = .overFullScreen
        self.present(tabBarController, animated: true)
    }

}
