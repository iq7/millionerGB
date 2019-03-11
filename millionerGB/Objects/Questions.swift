//
//  Questions.swift
//  millionerGB
//
//  Created by Андрей Тихонов on 06/03/2019.
//  Copyright © 2019 Андрей Тихонов. All rights reserved.
//

import Foundation

final class Questions {
    
    var listQuestion: [Question] = []
    
    init() {
        questionsInit()
    }
    
    private func questionsInit() {
        listQuestion.append(Question(textQuestion: "Как правильно закончить пословицу: «Не откладывай на завтра то, что можно…»?",
                                     arrayAnswers: ["сделать сегодня", "сделать послезавтра", "сделать через месяц", "никогда не делать"],
                                     answer: .answerA))
        listQuestion.append(Question(textQuestion: "Что говорит человек, когда замечает нечто необычное?",
                                     arrayAnswers: ["попало в лоб", "залетело в рот", "накапало в уши", "бросилось в глаза"],
                                     answer: .answerD))
        listQuestion.append(Question(textQuestion: "Что помогает туристу ориентироваться в незнакомом городе?",
                                     arrayAnswers: ["путепровод", "путеукладчик", "путеводитель", "путеводная звезда"],
                                     answer: .answerC))
        listQuestion.append(Question(textQuestion: "Какой наряд прославил баснописец Крылов?",
                                     arrayAnswers: ["тришкин кафтан", "ивашкин армяк", "прошкин зипун", "машкин сарафан"],
                                     answer: .answerA))
        listQuestion.append(Question(textQuestion: "Как звали старшую сестру императора Петра Первого?",
                                     arrayAnswers: ["Вера", "Надежда", "Любовь", "Софья"],
                                     answer: .answerD))
        /*
         listQuestion.append(Question(textQuestion: "Что не бывает морским?",
         arrayAnswers: ["рельс", "огурец", "гребешок", "узел"],
         answer: .answerA))
         listQuestion.append(Question(textQuestion: "Кого с большим основанием можно назвать островитянами?",
         arrayAnswers: ["алеутов", "эвенков", "чукчей", "якутов"],
         answer: .answerA))
         listQuestion.append(Question(textQuestion: "В какой стране появилась мандолина?",
         arrayAnswers: ["Испания", "Италия", "Венгрия", "Греция"],
         answer: .answerB))
         listQuestion.append(Question(textQuestion: "Как жители Лондона прозвали небоскреб Мэри-Экс, спроектированный Норманом Фостером?",
         arrayAnswers: ["«корнишон»", "«баклажан»", "«кабачок»", "«патиссон»"],
         answer: .answerA))
         listQuestionappend(Question(textQuestion: "Какой врач первым в истории русской медицины применил гипсовую повязку?",
         arrayAnswers: ["Субботин", "Пирогов", "Боткин", "Склифосовский"],
         answer: .answerB))
         listQuestion.append(Question(textQuestion: "Где в Древней Греции можно было увидеть надпись: «Здесь живут мертвые и говорят немые»?",
         arrayAnswers: ["на кладбищах", "в больницах", "в библиотеках", "в тюрьмах"],
         answer: .answerC))
         listQuestion.append(Question(textQuestion: "Кто был одним из авторов сценария фильма «Музыкальная история» с Сергеем Лемешевым в главной роли?",
         arrayAnswers: ["Илья Ильф", "Евгений Петров", "Михаил Зощенко", "Аркадий Аверченко"],
         answer: .answerB))
         listQuestion.append(Question(textQuestion: "С чем часто охотятся на рыбу протоптера между сезонами дождей?",
         arrayAnswers: ["с сетями", "с сачками", "с ружьями", "с лопатами"],
         answer: .answerD))
         listQuestion.append(Question(textQuestion: "Каким видом спорта серьезно увлекался французский летчик Ролан Гаррос?",
         arrayAnswers: ["пинг-понгом", "поло", "гольфом", "регби"],
         answer: .answerD))
         listQuestion.append(Question(textQuestion: "Что такое лобогрейка?",
         arrayAnswers: ["жнейка", "шапка", "болезнь", "печка"],
         answer: .answerA))
         */
    }
}
