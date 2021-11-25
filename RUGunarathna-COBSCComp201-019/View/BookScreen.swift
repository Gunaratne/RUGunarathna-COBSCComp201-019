//
//  BookScreen.swift
//  RUGunarathna-COBSCComp201-019
//
//  Created by Ravindee on 2021-11-20.
//

import SwiftUI
import CodeScanner

struct BookScreen: View {
    @StateObject var bookingViewModel = BookingViewModel()
    @StateObject var bookingModel = BookingSlot()
    @State var isPerentingScanner = false
    @State private var isExpandaed = false
    
    
    var scannerSheet: some View{
        CodeScannerView(codeTypes: [.qr], completion: {
            result in
            if case let .success(code) = result{
                self.bookingModel.selectedSlot = code
                self.isPerentingScanner = false
                bookingViewModel.Reservation(bookingInfo: bookingModel, authID: $bookingViewModel.user.first?.id ?? "")
            }
        })
    }
    var body: some View {
        NavigationView{
            VStack{
                Form{
                    if let user = bookingViewModel.user.first{
                        Section(
                           // header: Text("Booking Information")
                        ){
                            VStack(alignment: .leading){
                                Text("Registration Number") .fontWeight(.regular)
                                    .foregroundColor(.black)
                                Spacer(minLength: 10)
                                Text(user.registrationN)
//                                    .foregroundColor(.gray)
//                                    .fontWeight(.semibold)
                            }
                            VStack(alignment: .leading){
                                Text("Vehicle Number") .fontWeight(.regular)
                                    .foregroundColor(.black)
                                Spacer(minLength: 10)
                                Text(user.vehicleN)
//                                    .foregroundColor(.gray)
//                                    .fontWeight(.semibold)
                            }
                        }
                        Section(){
                            VStack(alignment: .leading){
//                                DisclosureGroup("Title", isExpanded: $isExpandaed){
//                                    VStack{
//                                        ForEach(bookingViewModel.avaliableParkingLots){ParkingSlot in
//                                            Text(ParkingSlot.parkingSlot + " (" + ParkingSlot.parkingType + ")" )                                }
//                                    }
//                                }
//
                                
                                Picker("Select A Parking Lot", selection: $bookingModel.selectedSlot){
                                    ForEach(bookingViewModel.avaliableParkingLots){ParkingSlot in
                                        Text(
                                            ParkingSlot.vehicleN +
                                           

                                            ParkingSlot.parkingSlot
                                             + " (" + ParkingSlot.parkingType + ")"
//                                            +
//                                            "(" + ParkingSlot.status + ")"
                                        
                                        )
                                    }
                                    .pickerStyle(WheelPickerStyle())
                                }
                            }
                        }
                    
                   // }
                    Section{
                        HStack{
                            Spacer()
                            Button(action:{
                                
                               
                            },label:{
                                Text("Booked")
                                    .foregroundColor(Color.white)
                                                                .frame(width: 200, height: 50)
                                                                .cornerRadius(8)
                                                                .background(Color.blue)
                            })
                            Button(action: { bookingViewModel.Reservation(bookingInfo: bookingModel, authID: $bookingViewModel.user.first?.id ?? ""
                            )},
                                   label: {
//                                Text("Reserved")
//                                    .foregroundColor(Color.blue)
//                                    .fontWeight(.semibold)
                            })
                            Spacer()
                        }
                    }
                   // Section{
                        HStack{
                            Spacer()
//                            Button(action:{
//                                
//                               
//                            },label:{
//                                Text("Scan QR code")
//                                    .foregroundColor(Color.white)
//                                                                .frame(width: 200, height: 50)
//                                                                .cornerRadius(8)
//                                                                .background(Color.blue)
//                            })
                            Button(action: {self.isPerentingScanner = true}, label: {
                                Text("Scan QR Code")
                                    .foregroundColor(Color.green)
                                    .fontWeight(.semibold)
                            })
                            
                                .sheet(isPresented: $isPerentingScanner){
                                    self.scannerSheet
                                }
                            Spacer()
                        }
                    //}
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
}

struct BookScreen_Previews: PreviewProvider {
    static var previews: some View {
        BookScreen()
    }
}
