//
//  RoundViewModel.swift
//  Teal Coding Challenge
//
//  Created by Kyle Stewart on 12/19/17.
//  Copyright © 2017 Kyle Stewart. All rights reserved.
//

import Foundation

protocol RoundViewModelDelegate: class {
    func newQuestionAvailable()
    func completedRound()
    func postedScore(_ error: NetworkError?)
}

class RoundViewModel {
    
    weak var delegate: RoundViewModelDelegate?
    fileprivate var currentQuestion: Question!
    
    fileprivate var roundTime: Double = 0.0
    fileprivate var questionTime: Double = 0.0
    
    fileprivate var answeredQuestions: [AnsweredQuestion] = []
    
    func setup(delegate: RoundViewModelDelegate) {
        self.delegate = delegate
        getNewQuestion()
        startRoundTimer()
    }
    
    fileprivate func startRoundTimer() {
        Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateRoundTime), userInfo: nil, repeats: true)
    }
    
    @objc func updateRoundTime() {
        roundTime = roundTime + 0.01
        questionTime = questionTime + 0.01
    }
    
    func getNewQuestion() {
        currentQuestion = QuestionGenerator.getQuestion()
        delegate?.newQuestionAvailable()
        questionTime = 0.0
    }
    
    func getQuestion() -> String {
        return "\(currentQuestion.firstOperand) X \(currentQuestion.secondOperand)"
    }
    
    func getSelection(at row: Int) -> Int {
        return currentQuestion.selections[row]
    }
    
    func selectionSelected(selection: Int) {
        let answeredQuestion = AnsweredQuestion(timeToAnswer: questionTime, isCorrect: currentQuestion.answer == currentQuestion.selections[selection - 1])
        answeredQuestions.append(answeredQuestion)
        if answeredQuestions.count < 20 {
            getNewQuestion()
        } else {
            delegate?.completedRound()
            submitScore()
        }
    }
    
    fileprivate func submitScore() {
        guard let gameHandle = UserSession.shared.gameHandle else { return }
        var roundSummary = RoundSummary(answeredQuestions: answeredQuestions, totalTime: roundTime, ranking: nil)
        let score = Score(userid: gameHandle, score: roundSummary.score, mtime: roundSummary.totalTime, qtime: Double(roundSummary.averageTimePerQuestion))
        DataManager.postScore(score, callback: { [ weak self ] (ranking, error) in
            DispatchQueue.main.async {
                guard let me = self else { return }
                roundSummary.ranking = ranking
                me.delegate?.postedScore(error)
                if error == nil {
                    MainNavigationController.shared.push(.summary(data: roundSummary), animated: true)
                }
            }
        })
    }
    
}
