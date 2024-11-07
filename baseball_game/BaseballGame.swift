//
//  Untitled.swift
//  baseball_game
//
//  Created by Hwangseokbeom on 11/5/24.
//
import Foundation

protocol BaseballGameDelegate {
    func start()
    var isRunning: Bool { get }
}

class BaseballGame {
    
    let record = saveRecord()
    
//    var cancelGameHandler: (() -> Void)?
    
    var delegate: BaseballGameDelegate?
    
    func start(){
        
        let answer = makeAnswer()
        print(answer)
        let userName: String = getUserName()!.joined(separator: "")
        print("\(String(describing: userName))님 게임을 시작합니다.", terminator: "\n")
        var count = 0
        
        while delegate!.isRunning {
            
            guard let numbers = getNumber() else { continue}
            //let numbers = getNumber()!
            count += 1
            let result = checkAnswer(numbers: numbers, answer: answer)
            
            if result.strikes == 3 { // strikes 가 3이면 정답 !
                print("strike 3! you win!")
                print("게임이 기록됩니다.")
                record.save(userName: userName ,isWin: true, count: count)
                break
            }
            else if result.strikes == 0 && result.balls == 0 {
                print("out!")
            }
            else{
                print("strikes: \(result.strikes), balls: \(result.balls)") 
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
    

    func getNumber() -> [Int]? {
        print("'000'을 입력하면 게임을 포기합니다!", terminator: "\n")
        print("------- 각 숫자는 0-9 사이, 중복 없이, 0은 맨 앞에 사용 불가 ------- ", terminator: "\n")
        print("세 자리 숫자를 입력하세요:", terminator: "")
        if let input = readLine()?.compactMap({Int(String($0))}) , input.count == 3 {
            if Set(input).count == 3 && input[0] != 0{
                return input
            }
            else if input == [0,0,0]{
                //cancelGameHandler?()
                delegate?.start()
            }
        }
        print("잘못된 입력입니다. 다시 입력하세요.")
        return nil
    }
    
    
    func makeAnswer() -> [Int] {
        var answers = Set<Int>()
        answers.insert(Int.random(in: 1...9))
        while answers.count < 3 {
            answers.insert(Int.random(in: 0...9))
        }
        return Array(answers)
    }
    
    
    func getUserName() -> [String]? {
        print("당신의 이름은?: ", terminator: "")
        if let input = readLine()?.compactMap({String($0)}) {
            return input
        }
        print("잘못된 입력입니다. 다시 입력하세요.")
        return nil
    }
}
