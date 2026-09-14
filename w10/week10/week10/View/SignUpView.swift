//
//  FirebaseAuth.swift
//  week10
//
//  Created by Van Tai on 2/9/26.
//

import SwiftUI
import FirebaseAuth

struct SignUpView: View {
    @Environment(\.dismiss) var dismiss
    
    @State var email = ""
    @State var password = ""
    @State var confirmedPassword = ""
    
    @State var isSuccess = false
    @State var feedback = ""
    
    var body: some View {
        VStack{
            Spacer()
            
            Group{
                TextField("Email", text: $email)
                    .padding()
                    .background(.thinMaterial)
                    .clipShape(.rect(cornerRadius: 10))
                    .padding(.horizontal)
                    .textInputAutocapitalization(.never)
                
                SecureField("Password", text: $password)
                    .padding()
                    .background(
                        .thinMaterial,
                        in: .rect(cornerRadius: 8)
                    )
                    .padding(.horizontal)
                
                SecureField("Cofirm Password", text: $confirmedPassword)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.thinMaterial)
                    )
                    .padding(.horizontal)
                    .border(.red, width: confirmedPassword != password ? 1 : 0)
            }
            
            Button {
                signUp()
            } label: {
                Text("Sign Up")
                    .bold()
                    .frame(width: 360, height: 50)
                    .background(
                        .thinMaterial,
                        in: .rect(cornerRadius: 10)
                    )
            }
            
            if !feedback.isEmpty{
                Text(feedback)
                    .foregroundStyle(isSuccess ? .green : .red)
            }
            
            Button("Back to Sign In", systemImage: "chevron.left") {
                dismiss()
            }
            
            Spacer()
        }
    }
    
    // MARK: SIGN UP FUNC
    func signUp(){
        guard password == confirmedPassword else {
            feedback = "The password is not matched"
            isSuccess = false
            return
        }
        
        //  Asynchronous network call to Firebase.
        Auth.auth().createUser(withEmail: email, password: password){ authResult, error in
            if let error = error {
                print(error.localizedDescription)
                isSuccess = false
                feedback = error.localizedDescription
                
                return
            }
            
            print("User created successfully!")
            isSuccess = true
            feedback = "Account created successfully"
        }
    }
}

#Preview {
    SignUpView()
}
