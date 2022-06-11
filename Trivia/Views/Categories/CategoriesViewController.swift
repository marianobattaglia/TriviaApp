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
        cell.accessoryType = .disclosureIndicator

        return cell
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.categories.count
    }
}

extension CategoriesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let categorySelected = categories[indexPath.row]
        
        print("Selected: \(categorySelected.name). id: \(categorySelected.id)")
        
        let vc = QuestionViewController()
        vc.categoryID = categorySelected.id
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
