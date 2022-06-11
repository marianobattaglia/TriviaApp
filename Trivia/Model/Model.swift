//
//  Model.swift
//  Trivia
//
//  Created by Mariano Martin Battaglia on 30/05/2022.
//

import Foundation

struct LocalQuestion {
    let question: String
    let answer: Bool
}

struct Question: Codable {
    var category: String
    var type: String
    var difficulty: String
    var question: String
    var correct_answer: String
    var incorrect_answers: [String]
}

final class Contenido {
    static let shared = Contenido()
    
    private init() {}
    
    func obtenerPreguntas() -> [LocalQuestion] {
        return [
            LocalQuestion(
                question: "¿Argentina tiene 3 copas del mundo en fútbol?",
                answer: false),
            LocalQuestion(
                question: "¿La capital de Chile es Santiago?",
                answer: true),
            LocalQuestion(
                question: "¿El día tiene 24 horas?",
                answer: true),
            LocalQuestion(
                question: "El mes de Junio, ¿tiene 31 días?",
                answer: false),
            LocalQuestion(
                question: "2 + 2 = 3",
                answer: false),
            LocalQuestion(
                question: "1024 Gigabytes es 1 Terabyte.",
                answer: true),
            LocalQuestion(
                question: "La glándula tiroides, ¿está en el cerebro?",
                answer: false),
            LocalQuestion(
                question: "El intestino delgado mide entre 5 y 8 metros.",
                answer: true),
            LocalQuestion(
                question: "El primer país en organizar un Mundial de Fútbol fue Uruguay.",
                answer: true),
            LocalQuestion(
                question: "La Gran Muralla China es visible desde la Luna.",
                answer: false),
            LocalQuestion(
                question: "Rusia cuenta con 11 zonas horarias.",
                answer: true)
        ]
    }
}
