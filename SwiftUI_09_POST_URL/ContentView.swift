//
//  ContentView.swift
//  SwiftUI_09_POST_URL
//
//  Created by Everis on 31/08/2020.
//  Copyright © 2020 Alan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var email = ""
    @State private var password = ""
    
    @ObservedObject var manager = Login()
    
    var body: some View {
        VStack (alignment: .leading) {
            Text("Email")
            TextField("Escribe tu email", text: self.$email)
            Text("Password")
            SecureField("Escribe tu password", text: self.$password)
            HStack {
                Spacer()
                Button(action: {
                    self.manager.loginRequest(email: self.email, password: self.password)
                }) {
                    Text("Login")
                        .font(.system(.title, design: .rounded))
                }
                
                Spacer()
            }
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
