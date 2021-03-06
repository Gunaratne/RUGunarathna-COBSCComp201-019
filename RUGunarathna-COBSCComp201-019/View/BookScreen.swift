//
//  BookScreen.swift
//  RUGunarathna-COBSCComp201-019
//
//  Created by Ravindee on 2021-11-17.
//
import SwiftUI
import CodeScanner

struct BookingScreen: View {
    @StateObject var bookingViewModel = BookingViewModel()
    @StateObject var bookingModel = BookingSlot()
    @State var isPerentingScanner = false
    @State var scannerCode: String = "Scan a QR code to get started"
    
    
    var scannerSheet: some View{
          CodeScannerView(codeTypes: [.qr], completion: {
              result in
              if case let .success(code) = result{
                  self.scannerCode = code
                  self.isPerentingScanner = false
              }
          })
      }
  
    
    var body: some View {
        NavigationView{
            VStack{
                Form{
                    
                    if let user = bookingViewModel.user.first{
                        Section(header: Text("Booking Information")){
                            VStack(alignment: .leading){
                                Text("Registration Number") .fontWeight(.regular)
                                    .foregroundColor(.black)
                                Spacer(minLength: 10)
                                Text(user.id)
                                    .foregroundColor(.gray)
                                    .fontWeight(.semibold)
                            }
                            VStack(alignment: .leading){
                                Text("Vehicle Number") .fontWeight(.regular)
                                    .foregroundColor(.black)
                                Spacer(minLength: 10)
                                Text(user.vehicleN)
                                    .foregroundColor(.gray)
                                    .fontWeight(.semibold)
                            }
                        }
                        Section(){
                            VStack(alignment: .leading){
                                Picker("Select A Parking Lot", selection: $bookingModel.selectedSlot){
                                    ForEach(bookingViewModel.avaliableParkingLots){ParkingSlot in
                                        Text(ParkingSlot.parkingSlot)
                                    }
                                }
                            }
                        }
                    }
                    Section{
                        HStack{
                            Spacer()
//                            Button(action: { bookingViewModel.Reservation(bookingInfo: bookingModel, memberID: $bookingViewModel.member.first?.id ?? "")}, label: {
//                                Text("Reserved")
//                                    .foregroundColor(Color.blue)
//                                    .fontWeight(.semibold)
//                            })
//                                .alert(isPresented: $bookingViewModel.isAlertPresent) {
//                                    Alert(title: Text(bookingViewModel.alertTitle), message: Text(bookingViewModel.alert))
//                                }
                            Spacer()
                        }
                    }
                    
                 //   Section{
                        
                        VStack{
                            Text(scannerCode)
                            Button("Scan QR code"){
                                           self.isPerentingScanner = true
                                   }
                                       .sheet(isPresented: $isPerentingScanner)
                                       {
                                           self.scannerSheet
                                       }
                          
//                                .sheet(isPresented:$is isPerentingScanner)
//                                .alert(isPresented: $bookingViewModel.isAlertPresent) {
//                                    Alert(title: Text(bookingViewModel.alertTitle), message: Text(bookingViewModel.alert))
//                                }
                            Spacer()
                        }
                   // }
                }
                
                           
            }
            .navigationTitle("Booking")
            .onAppear(){
                self.bookingViewModel.GetUserDeatils()
                self.bookingViewModel.GetAvaliable()
            }
        }
    }
}

struct BookingScreen_Previews: PreviewProvider {
    static var previews: some View {
        BookingScreen()
    }
}
