//
//  main.swift
//  baseball_game
//
//  Created by Hwangseokbeom on 11/4/24.
//

import Foundation

class Main: BaseballGameDelegate{
    
    var isRunning = true
    let baseballGame = BaseballGame()
    let viewGameRecord = saveRecord()
    
    init() {
           baseballGame.delegate = self
       }
    
//    init(){
//        baseballGame.cancelGameHandler = { [weak self] in
//            self?.start()
//        }
//    }
    
    func start() {
        
        while isRunning {
            print("--------------------------------------------------------------------------")
            print("                  환영합니다 ! 원하시는 번호를 입력해주세요.")
            print("         1. 게임 시작하기   2. 게임 기록보기   3. 모든 기록 삭제  4. 게임 종료")
            print("--------------------------------------------------------------------------")
            
            if let input = readLine() {
                
                switch input {
                case "1":
                    baseballGame.start()
                case "2":
                    viewGameRecord.view()
                case "3":
                    viewGameRecord.removeRecord()
                case "4":
                    print("게임을 종료합니다.")
                    isRunning = false
                default :
                    print("잘못 입력하셨습니다. 다시 입력해주세요.")
                }
            }
        }
    }
}

let app = Main()
app.start()


