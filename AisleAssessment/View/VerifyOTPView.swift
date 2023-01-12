//
//  VerifyOTPView.swift
//  AisleAssessment
//
//  Created by Keyur Patel on 11/01/23.
//

import SwiftUI

struct VerifyOTPView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject var viewModel: AuthViewModel
    @State private var timeRemaining = 60
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            HStack {
                
                Text(viewModel.getPhoneNumber)
                
                Button {
                    self.presentationMode.wrappedValue.dismiss()
                    viewModel.otp = ""
                } label: {
                    Image(systemName: "pencil")
                }

            }

            Text("Enter The OTP")
            
            HStack {
                
                TextField("9999", text: $viewModel.otp)
                
                Text("00:\(timeRemaining)")
                
            }
            
            Button {
                viewModel.verifyOtp()
            } label: {
                Text("Continue")
                    .padding()
            }

            
            Spacer()
            
            NavigationLink(destination: DashboardTabView(),
                           isActive: $viewModel.otpVerifySccess) {
                EmptyView()
            }
            
        }
        .padding()
        .onReceive(timer) { time in
            if timeRemaining > 0 {
                timeRemaining -= 1
            }
        }
        
    }
}

struct VerifyOTPView_Previews: PreviewProvider {
    static var previews: some View {
        VerifyOTPView(viewModel: AuthViewModel())
    }
}
