//
//  RegisterView.swift
//  A.Prudnikova-HW-38
//
//  Created by Ann Prudnikova on 21.02.23.
//

import SwiftUI

struct RegisterView: View {
    
    @EnvironmentObject var user: UserManager
    @State private var name = ""
//
    var body: some View {
        

        VStack(spacing: 25) {
            HStack {
                TextField("Enter your name", text: $name)
                    .multilineTextAlignment(.center)
                Text("\(name.count)")
                    
            }
            Button(action: registerUser) {
                Image(systemName: "checkmark.circle")
                Text("Ok")
            }
        } .padding()
    }
    
    
    private func registerUser() {
        if name.count > 4 {
            user.name = name
            user.isRegister.toggle()
        }
    }
}


struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
