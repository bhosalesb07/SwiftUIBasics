//
//  ContentView.swift
//  SwiftUIBasics
//
//  Created by Mac on 15/08/25.
//

import SwiftUI


struct ContentView: View {
    @State private var firstName:String = ""
    @State private var lastName:String = ""
    @State private var birthdate = Date()
    var body: some View {
        NavigationView{
            Form{
                Section(header:Text("Personal Information")){
                  TextField("First Name", text: $firstName)
                    TextField("Last Name", text: $lastName)
                    DatePicker("BirthDate", selection: $birthdate)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
