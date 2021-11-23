////
////  HomeView.swift
////  RUGunarathna-COBSCComp201-019
////
////  Created by Ravindee on 2021-11-16.
////
//
//import SwiftUI
//
//struct HomeView: View {
//    
//    
//    @State var countDownTimer1 = 10
//    @State var timerRunning1 = false
//    @State var countDownTimer2 = 10
//    @State var timerRunning2 = false
//    @State var countDownTimer3 = 10
//    @State var timerRunning3 = false
//    @State var countDownTimer4 = 10
//    @State var timerRunning4 = false
//    @State var countDownTimer5 = 10
//    @State var timerRunning5 = false
//    
//    @ObservedObject private var modelhome = ViewModels()
//    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
//    
//    var body: some View{
//        
//        NavigationView{
//        
//       
//        ZStack{
//            
//            //black ground
//            Rectangle()
//                .foregroundColor(Color(red: 200/255,
//                                       green: 143/255, blue: 32/255))
//                .edgesIgnoringSafeArea(.all)
////            Rectangle()
////                .foregroundColor(Color(red: 200/255,
////                                       green: 143/255, blue: 32/255))
////                .rotationEffect(Angle(degrees: 45))
////                .edgesIgnoringSafeArea(.all)
//           
//
//            
//            
//            
//            
//            
//            
//            
//            
//            VStack{
//                HStack{
//                    
//                    Text("Home page")
//                        .bold()
//                        .foregroundColor(.black)
//                    
//                }.scaleEffect(2)
//                    .padding()
//                
//                
//              
//                
//                
//                //Slot background
//                Text("Normal Slot")
//                ZStack{
//                    
//                    HStack{
//                        ZStack{
//                        Rectangle().fill(Color.orange).frame(width: 150, height: 150)
//                            
//                            VStack{
//                                Text("1")
//                                    .font(.custom("Georgia", size: 30))
//                                
//                                ZStack{
//                                    List(modelhome.cparking){
//                                        item in
//                                        Text("car Number")
//                                        Text(item.carNumber1)
////                                        List(modelhome.caparking){
////                                            Text("carNumber1")
////                                                                                Text(item.carNumber1)
////                                                                                Text("slot1A")
////                                                                                Text(item.slot1A)
////                                        }
//                                        
////                                        List (modelSetting.list){
////                                            item in
////                                            Text("Name")
////                                            Text(item.name)
////                                            Text("NIC")
////                                            Text(item.nic)
////                                            Text("Registration Number")
////                                            Text(item.registrationN)
////                                            Text("Vehicle Number")
////                                            Text(item.vehicleN)
////
////                                    }
////
//                                        
//                                        
//                                        
//                                        
//                                    }
//                                    .frame(width: 120, height: 50)
//                                }
//                                
////                                
////                                List(modelhome.cparking){
////                                    item in
////                                    Text("carNumber1")
////                                    Text(item.carNumber1)
////                                    Text("slot1A")
////                                    Text(item.slot1A)
////                                    
////        //                        }
////                            }
//                               
//                                
//                                Text("Timer \(countDownTimer1)")
//                                    .onReceive(timer)
//                                { _ in
//                                    if countDownTimer1 > 0 && timerRunning1{
//                                        countDownTimer1 -= 1
//                                    }
//                                    else{
//                                        timerRunning1 = false
//                                        countDownTimer1 = 10
//                                    }
//                                }
//                                .font(.custom("Georgia",
//                                              size: 20))
//                                .foregroundColor(.black)
////                                .padding(.all, 10)
//                                .background(Color.white.opacity(0.5))
//                                .cornerRadius(20)
//                                
//                                HStack(spacing: 30){
//                                    Button("Get"){
//                                        timerRunning1 = true
//
//                                    }.foregroundColor(.black)
//                                }
//                                      
//                                
//                            }
//                                                
//                        }
//                        ZStack{
//                        Rectangle().fill(Color.orange).frame(width: 100, height: 100)
//                    
//
//                            VStack{
//                                Text("2")
//                                    .font(.custom("Georgia", size: 40))
//                                //                        List(modelhome.user){ user in VStack{
//                                //                            //                        Text(user.name)
//                                //                        }
//                                
//                                //Timer
//                                
//                                Text("Timer \(countDownTimer2)")
//                                    .onReceive(timer)
//                                { _ in
//                                    if countDownTimer2 > 0 && timerRunning2{
//                                        countDownTimer2 -= 1
//                                    }
//                                    else{
//                                        timerRunning2 = false
//                                        countDownTimer2 = 10
//                                    }
//                                }
//                                .font(.custom("Georgia",
//                                              size: 20))
//                                .foregroundColor(.black)
//                                .background(Color.white.opacity(0.5))
//                                .cornerRadius(20)
//                                
//                                HStack(spacing: 30){
//                                    Button("Get"){
//                                        timerRunning2 = true
//
//                                    }.foregroundColor(.black)
//                                }
//                                      
//                                
//                            }
//                  
//                    }
//                    }
//                   
//                }
//                
//                
//                ZStack{
//                    
//                   
//                   
//                    HStack{
//                        ZStack{
//                        Rectangle().fill(Color.orange).frame(width: 100, height: 100)
//                        
//                     
//                            VStack{
//                                Text("3")
//                                    .font(.custom("Georgia", size: 40))
//                                //                        List(modelhome.user){ user in VStack{
//                                //                            //                        Text(user.name)
//                                //                        }
//                                
//                                //Timer
//                                
//                                
//                                
//                                
//                                
//                                
//                                Text("Timer \(countDownTimer3)")
//                                    .onReceive(timer)
//                                { _ in
//                                    if countDownTimer3 > 0 && timerRunning3{
//                                        countDownTimer3 -= 1
//                                    }
//                                    else{
//                                        timerRunning3 = false
//                                        countDownTimer3 = 10
//                                    }
//                                }
//                                .font(.custom("Georgia",
//                                              size: 20))
//                                .foregroundColor(.black)
//                                .background(Color.white.opacity(0.5))
//                                .cornerRadius(20)
//                                
//                                HStack(spacing: 30){
//                                    Button("Get"){
//                                        timerRunning3 = true
//
//                                    }.foregroundColor(.black)
//                                }
//                                      
//                                
//                            }
//                        }
//                        ZStack{
//                        Rectangle().fill(Color.orange).frame(width: 100, height: 100)
//                    
//
//                            VStack{
//                                Text("4")
//                                    .font(.custom("Georgia", size: 40))
//                                //                        List(modelhome.user){ user in VStack{
//                                //                            //                        Text(user.name)
//                                //                        }
//                                
//                                //Timer
//                                
//                                Text("Timer \(countDownTimer4)")
//                                    .onReceive(timer)
//                                { _ in
//                                    if countDownTimer4 > 0 && timerRunning4{
//                                        countDownTimer4 -= 1
//                                    }
//                                    else{
//                                        timerRunning4 = false
//                                        countDownTimer4 = 10
//                                    }
//                                }
//                                .font(.custom("Georgia",
//                                              size: 20))
//                                .foregroundColor(.black)
//                                .background(Color.white.opacity(0.5))
//                                .cornerRadius(20)
//                                
//                                HStack(spacing: 30){
//                                    Button("Get"){
//                                        timerRunning4 = true
//
//                                    }.foregroundColor(.black)
//                                }
//                                      
//                                
//                            }
//                    }
//                    }
//                }
//                Text("VIP Parking Slot")
//                ZStack{
//                    
//                   
//                   
//                    Rectangle().fill(Color.orange).frame(width: 100, height: 100)
//                    
//                        
//                    VStack{
//                        
//
//                        VStack{
//                            Text("5")
//                                .font(.custom("Georgia", size: 40))
//                            //                        List(modelhome.user){ user in VStack{
//                            //                            //                        Text(user.name)
//                            //                        }
//                            
//                            //Timer
//                            
//                            Text("Timer \(countDownTimer5)")
//                                .onReceive(timer)
//                            { _ in
//                                if countDownTimer5 > 0 && timerRunning5{
//                                    countDownTimer5 -= 1
//                                }
//                                else{
//                                    timerRunning5 = false
//                                    countDownTimer5 = 10
//                                }
//                            }
//                            .font(.custom("Georgia",
//                                          size: 20))
//                            .foregroundColor(.black)
//                            .background(Color.white.opacity(0.5))
//                            .cornerRadius(20)
//                            
//                            HStack(spacing: 30){
//                                Button("Get"){
//                                    timerRunning5 = true
//
//                                }.foregroundColor(.black)
//                            }
//                                  
//                            
//                        }
//                        
//                    }
//                }
//                
//                   
//            }
//            
//        }
//        
//    
//            
//            
//            
//            
//            
////            VStack{
////                NavigationLink(destination: BookingView()){
////                    Text("Booking")
////                }
////                .navigationTitle("Home page")
////            }
//       
//    }
//}
//}
//
//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
//}
