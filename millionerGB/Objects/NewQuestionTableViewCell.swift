//
//  NewQuestionTableViewCell.swift
//  millionerGB
//
//  Created by Андрей Тихонов on 12/03/2019.
//  Copyright © 2019 Андрей Тихонов. All rights reserved.
//

import UIKit

class NewQuestionTableViewCell: UITableViewCell {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var questionTextField: UITextField!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var answerALabel: UILabel!
    @IBOutlet weak var answerATextField: UITextField!
    @IBOutlet weak var answerBLabel: UILabel!
    @IBOutlet weak var answerBTextField: UITextField!
    @IBOutlet weak var answerCLabel: UILabel!
    @IBOutlet weak var answerCTextField: UITextField!
    @IBOutlet weak var answerDLabel: UILabel!
    @IBOutlet weak var answerDTextField: UITextField!
    @IBOutlet weak var rightAnswer: UILabel!
    @IBOutlet weak var rightAnswerTextField: UITextField!
    
    var question: Question?
    var delegate: UITableView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        questionTextField.delegate = self
        answerATextField.delegate = self
        answerBTextField.delegate = self
        answerCTextField.delegate = self
        answerDTextField.delegate = self
        rightAnswerTextField.delegate = self
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        initCell(question)
    }
    
    func initCell(_ question: Question?) {
        guard let question = question else { return }
        self.questionTextField.text = question.textQuestion
        //FIXME: - out of range
        self.answerATextField.text = question.arrayAnswers[0]
        self.answerBTextField.text = question.arrayAnswers[1]
        self.answerCTextField.text = question.arrayAnswers[2]
        self.answerDTextField.text = question.arrayAnswers[3]
        self.rightAnswerTextField.text = "\(question.answer)"//.rawValue)"
    }
}

extension NewQuestionTableViewCell: UITextFieldDelegate {
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("I was her \(self.restorationIdentifier ?? "")")
        return true
    }
}
