//
//  LoginView.swift
//  week10
//
//  Created by Van Tai on 3/9/26.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    
    @State var isSuccess = false
    @State var feedback = ""
    
    @State var isShowingSignUpSheet = false
    
    @Binding var user: User?
    
    var body: some View {
        VStack{
            Spacer()
            
            Group{
                TextField("Email", text: $email)
                    .padding()
                    .background(
                        .thinMaterial,
                        in: .rect(cornerRadius: 10)
                    )
                    .textInputAutocapitalization(.never)
                
                SecureField("Password", text: $password)
                    .padding()
                    .background(
                        .thinMaterial,
                        in: .rect(cornerRadius: 10)
                    )
            }
            
            Button {
                login()
            } label: {
                Text("Login")
                    .font(.headline)
                    .bold()
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .background(
                        .thinMaterial,
                        in: .rect(cornerRadius: 10)
                    )
                
            }
            .buttonStyle(.plain)
            
            if !feedback.isEmpty{
                Text(feedback)
                    .foregroundStyle(isSuccess ? .green : .red)
            }
            
            Spacer()
            
            Button {
                isShowingSignUpSheet.toggle()
            } label: {
                Text("Sign Up")
                    .bold()
            }
            .buttonStyle(.plain)
        }
        .padding(.horizontal)
        .sheet(isPresented: $isShowingSignUpSheet){
            SignUpView()
        }
    }
    
    
    // MARK: Login Func
    func login(){
        Auth.auth().signIn(withEmail: email, password: password){ (result, error) in
            if let error = error{
                print(error.localizedDescription)
                feedback = error.localizedDescription
                isSuccess = false
                
                return
            }
            
            guard let firebaseUser = result?.user else {
                return
            }
            
            isSuccess = true
            feedback = "Sign In Successfully"
            
            user = User(userID: firebaseUser.uid)
        }
    }
}

#Preview {
    @Previewable @State var user:User? = nil
    
    LoginView(user: $user)
}
