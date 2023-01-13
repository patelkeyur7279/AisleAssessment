//
//  VerifyOTPView.swift
//  AisleAssessment
//
//  Created by Keyur Patel on 11/01/23.
//

import SwiftUI

struct VerifyOTPView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject var viewModel = AuthViewModel.shared
    @State private var timeRemaining = 60
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            HStack {
                
                Text(viewModel.getPhoneNumber)
                    .font(.inter(.regular, size: 18))
                    .foregroundColor(.black)
                
                Button {
                    self.presentationMode.wrappedValue.dismiss()
                    viewModel.otp = ""
                } label: {
                    Image(systemName: "pencil")
                        .tint(.black)
                }

            }
            .padding(.bottom)

            Text("Enter The\nOTP")
                .lineSpacing(8)
                .font(.inter(.extraBold, size: 30))
                .foregroundColor(.black)
            
            TextField("9999", text: $viewModel.otp)
                .textFieldStyle(.roundedBorder)
                .font(.inter(.bold, size: 18))
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
                .frame(width: 80)
                .padding(.top)
            
            HStack {
                
                Button {
                    viewModel.verifyOtp()
                } label: {
                    Text("Continue")
                        .font(.inter(.semiBold, size: 14))
                        .foregroundColor(.black)
                        .padding()
                        .background(viewModel.isAPICalling ? Color.lightGray : Color.lightYellow)
                        .clipShape(Capsule())
                }
                
                Text("00:\(timeRemaining)")
                    .font(.inter(.bold, size: 14))
                    .foregroundColor(.black)
                    .padding(.leading)
                
                Spacer()
                
            }
            .padding(.top)

            
            Spacer()
            
//            NavigationLink(destination: DashboardTabView(),
//                           isActive: $viewModel.otpVerifySccess) {
//                EmptyView()
//            }
            
        }
        .padding(.top, 50)
        .padding()
        .navigationBarHidden(true)
        .onReceive(timer) { time in
            if timeRemaining > 0 {
                timeRemaining -= 1
            }
        }
        
    }
}

struct VerifyOTPView_Previews: PreviewProvider {
    static var previews: some View {
        VerifyOTPView()
    }
}
