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
    @State private var shouldSendNewsLetter:Bool = false
    @State private var numberOfLikes = 1
    
    var body: some View {
        NavigationView{
            Form{
                Section(header:Text("Personal Information")){
                  TextField("First Name", text: $firstName)
                    TextField("Last Name", text: $lastName)
                    DatePicker("BirthDate", selection: $birthdate)
                }
                Section(header:Text("Actions")){
                    Toggle("Send News Letter", isOn: $shouldSendNewsLetter)
                        .toggleStyle(SwitchToggleStyle(tint: .red))
                    Stepper("Number of Likes", value: $numberOfLikes, in: 1...100 )
                    Text("This video has \(numberOfLikes) likes")
                    Link("Terms of service" , destination: URL(string: "https://www.youtube.com/watch?v=m0QQ-hWs8fc")!)
                }
            }
            .accentColor(.red)
            .navigationTitle("Account")
            .toolbar{
                ToolbarItemGroup(placement: .navigationBarTrailing){
                    Button {
                        hideKeyboard()
                    } label: {
                        Image(systemName: "keyboard.chevron.compact.down")
                    }
                    Button("save",action: saveuser)
                }
            }
        }
    }
    func saveuser(){
        print("save user")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#if canImport(UIKit)
extension View{
    func hideKeyboard(){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
