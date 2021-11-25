//
//  HomeScreen.swift
//  RUGunarathna-COBSCComp201-019
//
//  Created by Ravindee on 2021-11-22.
//

import SwiftUI

struct HomeScreen: View {
    @State var index = 0
    @StateObject var homeViewModel = HomeViewModel()

    var body: some View {
        NavigationView{
            VStack{
                //Tab View
                HStack(spacing: 0){
                    
                    Text("Available")
                        .foregroundColor(self.index == 0 ? .white : Color(.blue).opacity(0.7))
                        .fontWeight(.bold)
                        .padding(.vertical,10)
                        .padding(.horizontal,35)
                        .background(Color(.blue).opacity(self.index == 0 ? 1 : 0))
                        .clipShape(Capsule())
                        .onTapGesture{
                            withAnimation(.default){
                                self.index = 0
                            }
                        }
                    
                    Spacer(minLength: 0)
                    
                    Text("Reserved")
                        .foregroundColor(self.index == 1 ? .white : Color(.blue).opacity(0.7))
                        .fontWeight(.bold)
                        .padding(.vertical,10)
                        .padding(.horizontal,35)
                        .background(Color(.blue).opacity(self.index == 1 ? 1 : 0))
                        .clipShape(Capsule())
                        .onTapGesture{
                            withAnimation(.default){
                                self.index = 1
                            }
                        }
                }
                .background(Color.black.opacity(0.06))
                .clipShape(Capsule())
                .padding(.horizontal)
                .padding(.top,25)
                
                //Dashboard Data
                TabView(selection: self.$index){
                    ParkingLotsGridView(Data: homeViewModel.avaliable , tabIndex: 0)
                        .tag(0)
                    ParkingLotsGridView(Data: homeViewModel.reserved, tabIndex: 1)
                        .tag(1)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                
                Spacer(minLength: 0)
            }
            .padding(.top)
            .navigationTitle("Welcome Back!")
            .onAppear(){
                self.homeViewModel.GetAvaliable()
                self.homeViewModel.GetReserved()
            }
        }
    }
}

struct ParkingLotsGridView : View {
    var Data : [ParkingSlot]
    var tabIndex : Int
    var columns = Array(repeating: GridItem(.flexible(), spacing:20), count: 2)
    @State private var timeRemaing = 100;
    @State private var isActive = true;
    @State var countDownTimer1 = 10
    @State var timerRunning1 = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    func ConvertToTimeFormat(timeRemaing : Int) -> String{
        let minutes = timeRemaing / 60
        let seconds = timeRemaing % 60
        return String(format: "%02i:%02i", minutes,seconds)
    }
    
    var body: some View{
        ScrollView{
            LazyVGrid(columns: columns, spacing: 30){
                Spacer()
                
                Text("Timer \(countDownTimer1)")
                    .onReceive(timer)
                { _ in
                    if countDownTimer1 > 0 && timerRunning1{
                        countDownTimer1 -= 1
                    }
                    else{
                        timerRunning1 = false
                        countDownTimer1 = 10
                    }
                }
                .font(.custom("Georgia",
                              size: 20))
                .foregroundColor(.black)
                .background(Color.white.opacity(0.5))
                .cornerRadius(20)
                Spacer()
                
                
                
                ForEach(Data){ParkingSlot in
                    ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)){
                        VStack(alignment: .leading, spacing: 20){
                            Text(ParkingSlot.parkingSlot)
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .font(.title)
                            Text(ParkingSlot.parkingType)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.top,10)
                            if(self.tabIndex == 1){
                                Text(ParkingSlot.vehicleN)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding(.top,10)
                                Text(ConvertToTimeFormat(timeRemaing: timeRemaing))
                                    .foregroundColor(.white)
                                    .padding(.top,10)
                            }
                        }
                        .onReceive(timer){time in
                            if self.timeRemaing > 0 {
                                self.timeRemaing -= 1
                            }
                        }
                        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)){
                            _ in self.isActive = false
                        }
                        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)){
                            _ in self.isActive = true
                        }
                        .padding()
                        .background(Color(.lightGray))
                        .cornerRadius(20)
                        .shadow(color: Color.black.opacity(0.2), radius:5, x: 0, y: 5)
                    }
                    
                }
            }
            .padding(.horizontal)
            .padding(.top,25)
        }
        
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
