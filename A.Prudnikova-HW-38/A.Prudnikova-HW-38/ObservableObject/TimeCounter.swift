//
//  TimeCounter.swift
//  A.Prudnikova-HW-38
//
//  Created by Ann Prudnikova on 21.02.23.
//

import Foundation
import Combine // помогает реализовать архитектуру MVVM

class TimeCounter: ObservableObject {
    
    // Cоздаем objectWillChange - паблишер или издатель
    var objectWillChange = PassthroughSubject<TimeCounter, Never>()
    // Благодаря этому свойству, TimeCounter сможет уведомлять своих подписчиков
    // (экземпляры класса с оберткой @StateObject)
    // об изменении своего состояния
    // Never - ошибок не будет
    
    var counter = 3
    var timer: Timer?
    var buttonTitle = "Start"
    
    func startTimer() {
        if counter > 0, timer == nil {
            timer = Timer.scheduledTimer(
                timeInterval: 1,
                target: self,
                selector: #selector(updateCounter),
                userInfo: nil,
                repeats: true
            )
        }
        
        buttonUIStateUpdate()
    }
    
    @objc private func updateCounter() {
        if counter > 0 {
            counter -= 1
        } else {
            killTimer()
            buttonTitle = "Reset"
        }
        
        objectWillChange.send(self) // отправим подписчикам обновление своего состояния
    }
    
    private func killTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    private func buttonUIStateUpdate() {
        if buttonTitle == "Reset" {
            counter = 3
            buttonTitle = "Start"
        } else {
            buttonTitle = "Wait..."
        }
        objectWillChange.send(self)
    }
}
