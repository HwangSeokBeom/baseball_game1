//
//  main.swift
//  baseball_game
//
//  Created by Hwangseokbeom on 11/4/24.
//

import Foundation

let game = BaseballGame()
game.start() // BaseballGame 인스턴스를 만들고 start 함수를 구현하기

// BaseballGame 클래스 구현
class BaseballGame{
    func start(){
        let answer = makeAnswer()
        print("baseball game start")
        //print("answer: \(answer)")
    }
    
    
    // BaseballGame 정답 만들기 -> 중복이 없어야함으로 크기가 3인 Set 데이터타입에 1~9까지 랜덤 수 배치
    func makeAnswer() -> [Int] {
        var numbers = Set<Int>()
        while numbers.count < 3 {
            numbers.insert(Int.random(in: 1...9))
        }
        return Array(numbers)
    }
}


