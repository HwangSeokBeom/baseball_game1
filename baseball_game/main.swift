//
//  main.swift
//  baseball_game
//
//  Created by Hwangseokbeom on 11/4/24.
//

import Foundation

// BaseballGame 클래스 구현
class MainApp{
    
    var isRunning = true
    let baseballGame = BaseballGame()
    
    func start() {
        
        while isRunning {
            print("------------------------------------------------------------")
            print("             환영합니다 ! 원하시는 번호를 입력해주세요.")
            print("         1. 게임 시작하기   2. 게임 기록보기   3. 게임 종료")
            print("------------------------------------------------------------")
            
            if let input = readLine() {
                
                switch input {
                case "1":
                    baseballGame.start()
                case "2":
                    print("미구현")
                case "3":
                    print("게임을 종료합니다.")
                    isRunning = false
                default :
                    print("잘못 입력하셨습니다. 다시 입력해주세요.")
                }
            }
        }
    }
}

let app = MainApp()
app.start()


