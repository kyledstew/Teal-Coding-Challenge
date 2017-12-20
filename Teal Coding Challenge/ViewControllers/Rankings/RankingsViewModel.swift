//
//  RankingsViewModel.swift
//  Teal Coding Challenge
//
//  Created by Kyle Stewart on 12/19/17.
//  Copyright © 2017 Kyle Stewart. All rights reserved.
//

import Foundation

protocol RankingsViewModelDelegate: class {
    func dataLoaded(error: NetworkError?)
    func promptForGameHandle()
    func checkedGameHandle(error: GameHandleCheckError)
}

class RankingsViewModel {
    
    weak var delegate: RankingsViewModelDelegate?
    fileprivate var data: [Score] = []
    
    func getData() {
        DataManager.getRankings { [ weak self ] (scores, error) in
            guard let me = self else { return }
            DispatchQueue.main.async {
                me.data = scores.sorted(by: { $0.score > $1.score })
                me.delegate?.dataLoaded(error: error)
            }
        }
    }
    
    func didSelectStartARound() {
        if UserSession.shared.gameHandle == nil {
            delegate?.promptForGameHandle()
        } else {
            MainNavigationController.shared.push(.round, animated: true)
        }
    }
    
    var numberOfScores: Int {
        return data.count
    }
    
    func score(at row: Int) -> Score {
        return data[row]
    }
    
    func checkGameHandle(_ gameHandle: String?) {
        guard let gameHandle = gameHandle, gameHandle != "" else {
            delegate?.checkedGameHandle(error: .notUnique)
            return
        }
        
        DataManager.checkIfUnique(gameHandle: gameHandle) { [ weak self ] (isUnique, error) in
            guard let me = self else { return }
            DispatchQueue.main.async {
                if let error = error {
                    me.delegate?.dataLoaded(error: error)
                    return
                }
                
                if isUnique {
                    UserSession.shared.gameHandle = gameHandle
                    MainNavigationController.shared.push(.round, animated: true)
                } else {
                    me.delegate?.checkedGameHandle(error: .notUnique)
                }
            }
        }
    }
    
}
