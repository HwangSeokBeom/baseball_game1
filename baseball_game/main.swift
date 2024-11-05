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
        var temp = 0
        let answer = makeAnswer()
        print("baseball game start")
        
        while true {
            guard let numbers = getNumber() else { continue} // 옵셔널 바인딩으로 값이 있을 경우에만 while문 밑으로 아니면 다시 위로
            //let numbers = getNumber()!
            let result = checkAnswer(numbers: numbers, answer: answer)
            
            temp += 1 // 시도한 횟수를 ++
            if result.strikes == 3 { // strikes 가 3이면 정답 !
                print("strike 3! you win!(\(temp))번 만에 맞추셨습니다.")
                break
            }
            else if result.strikes == 0 && result.balls == 0 { // 0 strike, 0 ball 이면 out !
                print("out!")
            }
            else{
                print("strikes: \(result.strikes), balls: \(result.balls)") // 둘 다 아니면 strikes 와 balls 의 값을 출력
            }
        }
    }
    
    // strikes와 balls를 판별하는 함수
    func checkAnswer(numbers: [Int], answer: [Int])-> (strikes: Int, balls: Int){
        var s = 0
        var b = 0
        
        for i in 0..<3{
            if numbers[i] == answer[i] {
                s += 1
            } else if answer.contains(numbers[i]) {
                b += 1
            }
        }
        return (strikes: s, balls: b)
    }
    
    // 게임할 유저에게 숫자3개 입력받기
    func getNumber() -> [Int]? {
        print("세 자리 숫자를 입력하세요 (각 숫자는 1-9 사이, 중복 없이): ", terminator: "")
        if let input = readLine()?.compactMap({Int(String($0))}) , input.count == 3 {
            //print(input)
            return input
        }
        print("잘못된 입력입니다. 다시 입력하세요.")
        return nil
    }
    
    // BaseballGame 정답 만들기 -> 중복이 없어야함으로 크기가 3인 Set 데이터타입에 1~9까지 랜덤 수 배치
    func makeAnswer() -> [Int] {
        var answers = Set<Int>()
        while answers.count < 3 {
            answers.insert(Int.random(in: 1...9))
        }
        print("정답:\(answers)")
        return Array(answers)
    }
}


