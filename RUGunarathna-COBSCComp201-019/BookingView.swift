//
//  BookingView.swift
//  RUGunarathna-COBSCComp201-019
//
//  Created by Ravindee on 2021-11-17.
//

import SwiftUI
import CodeScanner

struct BookingView: View {
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
        VStack(spacing: 10){
            Text(scannerCode)
            
            Button("Scan QR code"){
                self.isPerentingScanner = true
        }
            .sheet(isPresented: $isPerentingScanner)
            {
                self.scannerSheet
            }
            
        }
    }
}

struct BookingView_Previews: PreviewProvider {
    static var previews: some View {
        BookingView()
    }
}
