//
//  CreditCardView.swift
//  CardReader
//
//  Created by Khalid Asad on 2021-05-12.
//

import SwiftUI

public struct CreditCardView: View {
    
    var backgroundColors: [Color]
    var textColor: Color
    
    @Binding var cardNumber: String
    @Binding var cardExpiryDate: String
    @Binding var cardName: String
    
    private var formattedCardNumber: String {
        cardNumber == "" ? "4111 2222 3333 4444" : cardNumber
    }
    private var formattedCardName: String {
        cardName == "" ? "John Doe" : cardName
    }
    private var formattedCardExpiryDate: String {
        cardExpiryDate == "" ? "05/2021" : cardExpiryDate
    }
    private var cardType: CardType {
        .init(number: formattedCardNumber.replacingOccurrences(of: " ", with: ""))
    }
    
    public init(backgroundColors: [Color] = [.red, .orange], textColor: Color = .white, cardNumber: Binding<String>, cardExpiryDate: Binding<String>, cardName: Binding<String>) {
        self.backgroundColors = backgroundColors
        self.textColor = textColor
        self._cardNumber = cardNumber
        self._cardExpiryDate = cardExpiryDate
        self._cardName = cardName
    }
    
    public var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            Spacer()
            
            Image("chip")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60)
            
            Text(formattedCardNumber)
                .font(.system(size: 26))
                .bold()
            
            Spacer()
            
            HStack(alignment: .center) {
                VStack(alignment: .leading) {
                    Text("Name")
                        .font(.system(size: 14))
                    
                    Text(formattedCardName)
                        .bold()
                }
                
                Spacer(minLength: 10)
                
                VStack(alignment: .trailing) {
                    Text("Exp. Date")
                        .font(.system(size: 14))
                    
                    Text(formattedCardExpiryDate)
                        .bold()
                }
                
                Spacer(minLength: 10)
                
                cardType.image?
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60, height: 60)
                    .padding(.top)
            }
        }
        .padding()
        .foregroundColor(textColor)
        .background(LinearGradient(gradient: Gradient(colors: backgroundColors), startPoint: .leading, endPoint: .trailing))
        .cornerRadius(7)
        .frame(width: 340, height: 200, alignment: .center)
    }
}

//struct CreditCardView_Previews: PreviewProvider {
//    
//    static var previews: some View {
//        CreditCardView()
//    }
//}