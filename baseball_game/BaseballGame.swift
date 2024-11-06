//
//  Untitled.swift
//  baseball_game
//
//  Created by Hwangseokbeom on 11/5/24.
//
import Foundation

protocol BaseballGameDelegate {
    func start()
}

class BaseballGame {
    
    var delegate: BaseballGameDelegate?
    
    func start(){
        
        let answer = makeAnswer()
        
        while true {
            
            guard let numbers = getNumber() else { continue} // 옵셔널 바인딩으로 값이 있을 경우에만 while문 밑으로 아니면 다시 위로
            //let numbers = getNumber()!
            let result = checkAnswer(numbers: numbers, answer: answer)
            
            if result.strikes == 3 { // strikes 가 3이면 정답 !
                print("strike 3! you win!")
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
        print("세 자리 숫자를 입력하세요 (각 숫자는 0-9 사이, 중복 없이, 0은 맨 앞에 사용 불가!): ", terminator: "")
        if let input = readLine()?.compactMap({Int(String($0))}) , input.count == 3 {
            if Set(input).count == 3 && input[0] != 0{
                return input
            }
            else if input[0] == 0 { //
                delegate?.start()
            }
        }
        print("잘못된 입력입니다. 다시 입력하세요.")
        return nil
    }
    
    // BaseballGame 정답 만들기 -> 중복이 없어야함으로 크기가 3인 Set 데이터타입에 1~9까지 랜덤 수 배치 -> Lv3 0추가 대신 맨앞에 , 중복 사용 역시 불가
    func makeAnswer() -> [Int] {
        var answers = Set<Int>()
        answers.insert(Int.random(in: 1...9))
        while answers.count < 3 {
            answers.insert(Int.random(in: 0...9))
        }
        return Array(answers)
    }
}
