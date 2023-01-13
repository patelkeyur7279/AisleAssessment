//
//  ContentView.swift
//  AisleAssessment
//
//  Created by Keyur Patel on 11/01/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = AuthViewModel.shared
    
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
                    .font(.inter(.bold, size: 18))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .frame(width: 64)
                
                TextField("9999999999", text: $viewModel.phoneNumber)
                    .textFieldStyle(.roundedBorder)
                    .font(.inter(.bold, size: 18))
                    .foregroundColor(.black)
                    .frame(width: 150)
                
                Spacer()
            }
            .padding(.top, 8)
            
            Button {
                viewModel.phoneNumberLogin()
            } label: {
                Text("Continue")
                    .font(.inter(.semiBold, size: 14))
                    .foregroundColor(.black)
                    .padding()
                    .background(viewModel.isAPICalling ? Color.lightGray : Color.lightYellow)
                    .clipShape(Capsule())
            }
            .disabled(viewModel.isAPICalling)
            .padding(.top, 8)
            
            Spacer()
            
            NavigationLink(destination: VerifyOTPView(),
                           isActive: $viewModel.loginSuccess) {
                EmptyView()
            }
            
        }
        .padding(.top, 50)
        .padding()
        .navigationBarHidden(true)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
