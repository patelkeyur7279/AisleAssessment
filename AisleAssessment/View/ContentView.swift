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

            Text("Enter Your Phone Number")
            
            HStack {
                TextField("+91", text: $viewModel.countryCode)
                TextField("9999999999", text: $viewModel.phoneNumber)
            }
            
            Button {
                viewModel.phoneNumberLogin()
            } label: {
                Text("Continue")
                    .padding()
            }
            
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
