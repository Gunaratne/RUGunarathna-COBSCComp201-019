//
//  BookScreen.swift
//  RUGunarathna-COBSCComp201-019
//
//  Created by Ravindee on 2021-11-20.
//

import SwiftUI

struct BookScreen: View {
    var body: some View {
        NavigationView{
            VStack{
                Form{
//                    if let user = bookingViewModel.member.first{
                        Section(
                           // header: Text("Booking Information")
                        ){
                            VStack(alignment: .leading){
                                Text("Registration Number") .fontWeight(.regular)
                                    .foregroundColor(.black)
                                Spacer(minLength: 10)
//                                Text(user.id)
//                                    .foregroundColor(.gray)
//                                    .fontWeight(.semibold)
                            }
                            VStack(alignment: .leading){
                                Text("Vehicle Number") .fontWeight(.regular)
                                    .foregroundColor(.black)
                                Spacer(minLength: 10)
//                                Text(user.vehicleNo)
//                                    .foregroundColor(.gray)
//                                    .fontWeight(.semibold)
                            }
                        }
                        Section(){
//                            VStack(alignment: .leading){
//                                Picker("Select A Parking Lot", selection: $bookingModel.selectedParkingLot){
//                                    ForEach(bookingViewModel.avaliableParkingLots){ParkingLotsForPicker in
//                                        Text(ParkingLotsForPicker.parkingLotCode + " (" + ParkingLotsForPicker.parkingLotType + ")")
//                                    }
//                                }
//                            }
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
//                            Button(action: { bookingViewModel.Reservation(bookingInfo: bookingModel, memberID: $bookingViewModel.member.first?.id ?? ""
//                            )},
//                                   label: {
//                                Text("Reserved")
//                                    .foregroundColor(Color.blue)
//                                    .fontWeight(.semibold)
//                            })
                            Spacer()
                        }
                    }
                   // Section{
                        HStack{
                            Spacer()
                            Button(action:{
                                
                               
                            },label:{
                                Text("Scan QR code")
                                    .foregroundColor(Color.white)
                                                                .frame(width: 200, height: 50)
                                                                .cornerRadius(8)
                                                                .background(Color.blue)
                            })
//                            Button(action: {self.isPerentingScanner = true}, label: {
//                                Text("Scan QR Code")
//                                    .foregroundColor(Color.green)
//                                    .fontWeight(.semibold)
//                            })
                            
//                                .sheet(isPresented: $isPerentingScanner){
//                                    self.scannerSheet
//                                }
                            Spacer()
                        }
                    //}
                }
            }
            .navigationTitle("Booking")
//            .onAppear(){
//                self.bookingViewModel.GetUserDeatils()
//                self.bookingViewModel.GetAvailableParkingLots()
//            }
        }
    }
}

struct BookScreen_Previews: PreviewProvider {
    static var previews: some View {
        BookScreen()
    }
}
