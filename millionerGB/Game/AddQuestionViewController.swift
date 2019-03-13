//
//  AddQuestionViewController.swift
//  millionerGB
//
//  Created by Андрей Тихонов on 12/03/2019.
//  Copyright © 2019 Андрей Тихонов. All rights reserved.
//

import UIKit

class AddQuestionViewController: UIViewController {

    @IBOutlet weak var addQuestionsButton: UIButton!
    @IBOutlet weak var addTableCell: UIButton!
    @IBOutlet weak var questionsTableView: UITableView!
    
    private let questionCaretaker = QuestionCaretaker()
    private var questionList: [Question]?
    
    var textFieldText: String?
    var textFieldID: String?
    
    func clearQuestions() {
        self.questionList = []
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.questionList = try? self.questionCaretaker.loadQuestion()
        let question = Question()

//        clearQuestions()
        self.questionList?.append(question)

        self.questionsTableView.dataSource = self
    }

    @IBAction func addQuestionsButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true) { [weak self] in
            guard let self = self, let questionList = self.questionList else { return }
            try? self.questionCaretaker.saveQuestions(questionList)
        }
    }
    
    @IBAction func addTableCellPressed(_ sender: UIButton) {
        let question = Question()
        self.questionList?.append(question)
        self.questionsTableView.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension AddQuestionViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.questionList?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewQuestionTableViewCell", for: indexPath) as? NewQuestionTableViewCell else {
            assertionFailure("Error")
            return UITableViewCell()
        }
        
        if let question = self.questionList?[indexPath.row] {
            cell.initCell(question)
            cell.delegate = self.questionsTableView
        }
        return cell
    }
}
