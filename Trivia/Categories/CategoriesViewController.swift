//
//  CategoriesViewController.swift
//  Trivia
//
//  Created by Mariano Martin Battaglia on 30/05/2022.
//

import UIKit

class CategoriesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
      
    //Placeholder API charge
    var categories: [Category] = [Category(id: 0, name: "Loading categories...")]
    
    let service = CategoriesService()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        getCategories()
    }

//    func getCategoriesService(completion: @escaping () -> Void) {
//        service.getCategories { [weak self] categories in
//            self?.categories = categories
//            completion()
//        }
//    }
    
    func getCategories() {
        service.getCategories(completion: { [weak self] response in
            self?.categories = response
            self?.tableView.reloadData()
        })
    }
    
    func getCategory(at index: Int) -> Category {
        categories[index]
    }

    func showQuestions(for category: Category) {
        let questionsViewController = QuestionViewController(nibName: "QuestionsViewController", bundle: nil)
        questionsViewController.title = category.name
        questionsViewController.categoryID = category.id
        
        navigationController?.pushViewController(questionsViewController, animated: true)
    }
    
}


// MARK: - Extensions
extension CategoriesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let categoriesName = categories[indexPath.row].name

        cell.textLabel?.text = categoriesName

        return cell
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.categories.count
    }
}


extension CategoriesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Accion cuando toco una
        tableView.deselectRow(at: indexPath, animated: true)
        
        let categorySelected = categories[indexPath.row]
        
        //asd
        print("Celda seleccionada: \(categorySelected.name). id: \(categorySelected.id)")
        
        QuestionViewController().categoryID = categorySelected.id
        
//        QuestionsService().getQuestions(for: categorySelected.id) { <#Question#> in
//            <#code#>
//        }
    }
}
