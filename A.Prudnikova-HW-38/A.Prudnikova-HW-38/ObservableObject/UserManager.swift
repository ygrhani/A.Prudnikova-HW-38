//
//  UserManager.swift
//  A.Prudnikova-HW-38
//
//  Created by Ann Prudnikova on 21.02.23.
//

import Combine
import SwiftUI


final class UserManager: ObservableObject {
    @AppStorage("isRegister") var isRegister = false
    // A type that publishes a property marked with an attribute.
    // Тип, который публикует свойство, помеченное атрибутом.
    // Публикация свойства с атрибутом @Published создает издателя этого типа.
    // Вы получаете доступ к издателю с помощью оператора $
    @AppStorage("name") var name = ""
}
