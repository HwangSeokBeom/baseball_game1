//
//  ViewGameHistory.swift
//  baseball_game
//
//  Created by Hwangseokbeom on 11/6/24.
//

import Foundation
import CoreData

struct GameRecord: Codable{
    let userName: String
    let isWin: Bool
    let count: Int
}

class saveRecord{
        
    var records: [GameRecord] = []
    
    func save(userName: String, isWin: Bool, count: Int) {
        let record = GameRecord(userName: userName, isWin: isWin, count: count)
        records.append(record)
        //print(records)
        if let data = try? JSONEncoder().encode(records) {
            UserDefaults.standard.set(data, forKey: "records")
        }
        print("\n--------------- 게임 기록 저장 ---------------")
        for (i, record) in records.enumerated() {
            print("\(i+1). \(record.userName)님은 \(record.count)번만에 맞추셨습니다.")
        }
    }
    
    func view() {
        if let data = UserDefaults.standard.data(forKey: "records") {
            if var records = try? JSONDecoder().decode([GameRecord].self, from: data) {
                records.sort{$0.count < $1.count}
                print("\n--------------- 게임 기록 보기 ---------------")
                for (i, record) in records.enumerated() {
                    print("\(i+1)등. \(record.userName)님은 \(record.count)번만에 맞추셨습니다.")
                }
            }
            else{
                print("기록된 게임이 없습니다.")
            }
        }
        else{
            print("기록된 게임이 없습니다.")
        }
    }
    
    func removeRecord() {
        UserDefaults.standard.removeObject(forKey: "records")
        print("************ 모든 기록 삭제 ************")
    }
    
    
  
}

