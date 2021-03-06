//
//  AddQuestionVC.swift
//  millionerGB
//
//  Created by Андрей Тихонов on 13/03/2019.
//  Copyright © 2019 Андрей Тихонов. All rights reserved.
//

import UIKit

class AddQuestionVC: UIViewController {

    @IBOutlet weak var questionTextField: UITextField!
    @IBOutlet weak var answerATextField: UITextField!
    @IBOutlet weak var answerBTextField: UITextField!
    @IBOutlet weak var answerCTextField: UITextField!
    @IBOutlet weak var answerDTextField: UITextField!
    @IBOutlet weak var rightAnswer: UITextField!
    
    private let questionCaretaker = QuestionCaretaker()
    private var question: Question?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.question = try? self.questionCaretaker.loadQuestion()
        
        self.questionTextField.text = self.question?.textQuestion
        self.answerATextField.text = self.question?.arrayAnswers[0]
        self.answerBTextField.text = self.question?.arrayAnswers[1]
        self.answerCTextField.text = self.question?.arrayAnswers[2]
        self.answerDTextField.text = self.question?.arrayAnswers[3]
        guard let answer = self.question?.answer else { return }
        self.rightAnswer.text = String(describing: answer)
    }

    @IBAction func addQuestionButtonPressent(_ sender: UIButton) {
        guard let answer = Int(self.rightAnswer?.text ?? "") else { return }
        question = Question(textQuestion: self.questionTextField.text ?? "", arrayAnswers: [self.answerATextField.text ?? "", self.answerBTextField.text ?? "", self.answerCTextField.text ?? "", self.answerDTextField.text ?? ""], answer: answer)

        if let question = self.question {
            try? self.questionCaretaker.saveQuestion(question)
        }
        self.dismiss(animated: true, completion: nil)
    }
}
