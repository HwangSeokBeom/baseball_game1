//
//  ViewGameHistory.swift
//  baseball_game
//
//  Created by Hwangseokbeom on 11/6/24.
//

import Foundation


struct GameRecord: Codable{
    let userName: String
    let isWin: Bool
    let count: Int
}

class ViewGameRecord{

    var records: [GameRecord] = []
    
    func save(userName: String, isWin: Bool, count: Int) {
        let record = GameRecord(userName: userName, isWin: isWin, count: count)
        records.append(record)
        print(records)
        print("\n--------------- 게임 기록 저장 ---------------")
        for (i, record) in records.enumerated() {
            print("\(i+1). \(record.userName)님은 \(record.count)번만에 맞추셨습니다.")
        }
    }
    
    func view() {
        print("\n--------------- 게임 기록 보기 ---------------")
        if records.isEmpty {
            print("아직 기록이 없습니다.")
        }
        for (i, record) in records.enumerated() {
            print("\(i+1). \(record.userName)님은 \(record.count)번만에 맞추셨습니다.")
        }
    }
}
