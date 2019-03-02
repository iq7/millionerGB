//
//  GameViewController.swift
//  millionerGB
//
//  Created by Андрей Тихонов on 01/03/2019.
//  Copyright © 2019 Андрей Тихонов. All rights reserved.
//

import UIKit

protocol GameDelegate: AnyObject {

    func gameDidEnd(with result: Int, isWin: Bool)
}

protocol GameViewControllerDeligate: AnyObject {
    func update(with question: Question)
}

final class GameViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var answerAButton: UIButton!
    @IBOutlet weak var answerBButton: UIButton!
    @IBOutlet weak var answerCButton: UIButton!
    @IBOutlet weak var answerDButton: UIButton!
    
    @IBOutlet weak var fiftyFiftyButton: UIButton!
    @IBOutlet weak var callToFriendButton: UIButton!
    @IBOutlet weak var hallHelpButton: UIButton!
    @IBOutlet weak var marginForErrorButton: UIButton!
    
    private var questions: [Question] = []
    
    weak var delegate: GameDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionsInit()
        let gameSession = GameSession(with: questions, and: self)
        Game.shared.gameSession = gameSession
        Game.shared.gameSession?.askAQuestion()
    }
    
//    private func levelUp() {
//        numberQuestion += 1
//        if numberQuestion < questions.count {
//            askAQuestion(number: numberQuestion)
//        } else {
//            gameOver()
//        }
//    }
//
//    private func gameOver() {
//        if numberQuestion < questions.count - 1 {
//            self.delegate?.gameDidEnd(with: numberQuestion, isWin: false)
//        } else {
//            self.delegate?.gameDidEnd(with: numberQuestion, isWin: true)
//        }
//        self.dismiss(animated: true, completion: nil)
//    }
//
//    private func reply(answer: numberAnswer) {
//        if !isReadyQuestion { return }
//        isReadyQuestion = false
//        if questions[numberQuestion].answer == answer {
//            levelUp()
//        } else {
//            gameOver()
//        }
//    }

    private func questionsInit() {
        questions.append(Question(textQuestion: "Как правильно закончить пословицу: «Не откладывай на завтра то, что можно…»?",
                                  arrayAnswers: ["сделать сегодня", "сделать послезавтра", "сделать через месяц", "никогда не делать"],
                                  answer: .answerA))
        questions.append(Question(textQuestion: "Что говорит человек, когда замечает нечто необычное?",
                                  arrayAnswers: ["попало в лоб", "залетело в рот", "накапало в уши", "бросилось в глаза"],
                                  answer: .answerD))
        questions.append(Question(textQuestion: "Что помогает туристу ориентироваться в незнакомом городе?",
                                  arrayAnswers: ["путепровод", "путеукладчик", "путеводитель", "путеводная звезда"],
                                  answer: .answerC))
        questions.append(Question(textQuestion: "Какой наряд прославил баснописец Крылов?",
                                  arrayAnswers: ["тришкин кафтан", "ивашкин армяк", "прошкин зипун", "машкин сарафан"],
                                  answer: .answerA))
        questions.append(Question(textQuestion: "Как звали старшую сестру императора Петра Первого?",
                                  arrayAnswers: ["Вера", "Надежда", "Любовь", "Софья"],
                                  answer: .answerD))
/*
        questions.append(Question(textQuestion: "Что не бывает морским?",
                                  arrayAnswers: ["рельс", "огурец", "гребешок", "узел"],
                                  answer: .answerA))
        questions.append(Question(textQuestion: "Кого с большим основанием можно назвать островитянами?",
                                  arrayAnswers: ["алеутов", "эвенков", "чукчей", "якутов"],
                                  answer: .answerA))
        questions.append(Question(textQuestion: "В какой стране появилась мандолина?",
                                  arrayAnswers: ["Испания", "Италия", "Венгрия", "Греция"],
                                  answer: .answerB))
        questions.append(Question(textQuestion: "Как жители Лондона прозвали небоскреб Мэри-Экс, спроектированный Норманом Фостером?",
                                  arrayAnswers: ["«корнишон»", "«баклажан»", "«кабачок»", "«патиссон»"],
                                  answer: .answerA))
        questions.append(Question(textQuestion: "Какой врач первым в истории русской медицины применил гипсовую повязку?",
                                  arrayAnswers: ["Субботин", "Пирогов", "Боткин", "Склифосовский"],
                                  answer: .answerB))
        questions.append(Question(textQuestion: "Где в Древней Греции можно было увидеть надпись: «Здесь живут мертвые и говорят немые»?",
                                  arrayAnswers: ["на кладбищах", "в больницах", "в библиотеках", "в тюрьмах"],
                                  answer: .answerC))
        questions.append(Question(textQuestion: "Кто был одним из авторов сценария фильма «Музыкальная история» с Сергеем Лемешевым в главной роли?",
                                  arrayAnswers: ["Илья Ильф", "Евгений Петров", "Михаил Зощенко", "Аркадий Аверченко"],
                                  answer: .answerB))
        questions.append(Question(textQuestion: "С чем часто охотятся на рыбу протоптера между сезонами дождей?",
                                  arrayAnswers: ["с сетями", "с сачками", "с ружьями", "с лопатами"],
                                  answer: .answerD))
        questions.append(Question(textQuestion: "Каким видом спорта серьезно увлекался французский летчик Ролан Гаррос?",
                                  arrayAnswers: ["пинг-понгом", "поло", "гольфом", "регби"],
                                  answer: .answerD))
        questions.append(Question(textQuestion: "Что такое лобогрейка?",
                                  arrayAnswers: ["жнейка", "шапка", "болезнь", "печка"],
                                  answer: .answerA))
*/
        
    }

    @IBAction func answerAButtonPressed(_ sender: Any) {
//        reply(answer: .answerA)
    }
    
    @IBAction func answerBButtonPressed(_ sender: Any) {
//        reply(answer: .answerB)
    }
    
    @IBAction func answerCButtonPressed(_ sender: Any) {
//        reply(answer: .answerC)
    }
    
    @IBAction func answerDButtonPressed(_ sender: Any) {
//        reply(answer: .answerD)
    }
    
    @IBAction func fiftyFiftyButtonPressed(_ sender: Any) {
    }
    
    @IBAction func callToFriendButtonPressed(_ sender: Any) {
    }
    
    @IBAction func hallHelpButtonPressed(_ sender: Any) {
    }
    
    @IBAction func marginForErrorButtonPressed(_ sender: Any) {
    }
}

extension GameViewController: GameViewControllerDeligate {

    func update(with question: Question) {
        questionLabel.text = question.textQuestion
        answerAButton.setTitle("A: " + question.arrayAnswers[0], for: .normal)
        answerBButton.setTitle("B: " + question.arrayAnswers[1], for: .normal)
        answerCButton.setTitle("C: " + question.arrayAnswers[2], for: .normal)
        answerDButton.setTitle("D: " + question.arrayAnswers[3], for: .normal)
    }
}
