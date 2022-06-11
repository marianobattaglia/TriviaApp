//
//  QuestionViewController.swift
//  Trivia
//
//  Created by Mariano Martin Battaglia on 29/05/2022.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    
    private let questions = Contenido.shared.obtenerPreguntas()
    private var currentQuestionIndex = 0
    
    private let questionsService = QuestionsService()
    private var currentQuestion: Question?
    
    public var categoryID = 0
    let userDefaults = UserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //setCurrentQuestion(for: currentQuestionIndex)
        getQuestion()
        
        categoryLabel.text = currentQuestion?.category
        
        
    }

    // MARK: Buttons:
    @IBAction func rightAnswerTapped(_ sender: Any) {
        let result = validateCurrentQuestion(answer: "True")
        sendResultMessage(for: result)
        //updateQuestion()
    }
    
    @IBAction func wrongAnswerTapped(_ sender: Any) {
        let result = validateCurrentQuestion(answer: "False")
        sendResultMessage(for: result)
        //updateQuestion()
    }
    
    // MARK: - Methods:
    
    func getQuestionService(for categoryID: Int, completion: @escaping () -> Void) {
        questionsService.getQuestions(for: categoryID) { [weak self] receivedQuestion in
            guard let strongSelf = self else { return }
            strongSelf.currentQuestion = receivedQuestion
            completion()
        }
    }
    
    func getQuestion() {
        getQuestionService(for: categoryID) { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.setCurrentQuestion() //asdasd
        }
    }
        
    
    func setCurrentQuestion() {
        questionLabel.text = getCurrentQuestion()
        //questionLabel
        guard let cuestionOK = currentQuestion else {
            print("Error cargando categoria")
            return
        }
        categoryLabel.text = String(describing: cuestionOK.category)
    }
    
    func getCurrentQuestion() -> String {
        if let question = self.currentQuestion {
            return question.question.htmlDecoded
        }
        return "Error getting question"
    }
    
    func validateCurrentQuestion(answer: String) -> Bool {
        if let rightAnswer = currentQuestion?.correct_answer {
            return rightAnswer == answer
        }
        return false
    }
    
    //
    
//    private func updateQuestion() {
//        currentQuestionIndex += 1
//        setCurrentQuestion(for: currentQuestionIndex)
//    }
//
//    private func setCurrentQuestion(for index: Int) {
//        if index < questions.count {
//            questionLabel.text = questions[index].question
//        } else {
//            currentQuestionIndex = 0
//            questionLabel.text = questions[currentQuestionIndex].question
//        }
//    }
//
//    private func validateCurrentQuestion(answer: Bool) -> Bool {
//        questions[currentQuestionIndex].answer == answer
//    }
    
    private func sendResultMessage(for result: Bool) {
//        let message = result ? "La respuesta es correcta 🥳" : "La respuesta es incorrecta 😔"
//        //print(message)
//        let alert = UIAlertController(title: "Respuesta", message: message, preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
//            self.updateQuestion()
//        }))
//        self.present(alert, animated: true, completion: nil)
        
        result ? rightAnswerSelected() : wrongAnswerSelected()
    }
    
    private func rightAnswerSelected() {
        let alertYES = UIAlertController(title: "Excellent!", message: "Good Job! 😁", preferredStyle: .alert)
        alertYES.addAction(UIAlertAction(title: "Thanks! 😎", style: .cancel, handler: { [self] _ in
            getQuestion()
        }))
        self.present(alertYES, animated: true)
    }
    
    private func wrongAnswerSelected() {
        let alertNO = UIAlertController(title: "Wrong!", message: "Better luck next time 😔", preferredStyle: .alert)
        alertNO.addAction(UIAlertAction(title: "Ups! 😅", style: .cancel, handler: { [self] _ in
            getQuestion()
        }))
        self.present(alertNO, animated: true)
    }
        

}


// MARK: - Extensions
// Decode special characters from JSON (for example, '&quot;'
extension String {
    var htmlDecoded: String {
        let decoded = try? NSAttributedString(data: Data(utf8), options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil).string
        return decoded ?? self
    }
}
