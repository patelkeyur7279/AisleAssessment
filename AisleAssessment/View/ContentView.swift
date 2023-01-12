//
//  ContentView.swift
//  AisleAssessment
//
//  Created by Keyur Patel on 11/01/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = AuthViewModel()
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text("Get OTP")
                .font(.inter(.regular, size: 18))
                .foregroundColor(.black)

            Text("Enter Your\nPhone Number")
                .font(.inter(.extraBold, size: 30))
                .lineSpacing(8)
                .foregroundColor(.black)
                .padding(.top, 8)
            
            HStack {
                TextField("+91", text: $viewModel.countryCode)
                    .textFieldStyle(.roundedBorder)
                    .font(.inter(.regular, size: 18))
                    .foregroundColor(.black)
                    .frame(width: 64)
                
                TextField("9999999999", text: $viewModel.phoneNumber)
                    .textFieldStyle(.roundedBorder)
                    .font(.inter(.regular, size: 18))
                    .foregroundColor(.black)
                    .frame(width: 150)
                
                Spacer()
            }
            .padding(.top, 8)
            
            Button {
                viewModel.phoneNumberLogin()
            } label: {
                Text("Continue")
                    .font(.inter(.regular, size: 14))
                    .foregroundColor(.black)
                    .padding()
                    .background(Color.lightYellow)
                    .cornerRadius(20)
            }
            .padding(.top, 8)
            
            Spacer()
            
            NavigationLink(destination: VerifyOTPView(viewModel: viewModel),
                           isActive: $viewModel.loginSuccess) {
                EmptyView()
            }
            
        }
        .padding()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
