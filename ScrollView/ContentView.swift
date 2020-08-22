//
//  ContentView.swift
//  ScrollView
//
//  Created by Udin Rajkarnikar on 8/10/20.
//  Copyright © 2020 np.com.udinrajkarnikar. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            Spacer()
            MainView(quotes: quoteData)
            Spacer()
        }.background(Image("motivation_bg")
            .resizable()
            .scaledToFill()
            .edgesIgnoringSafeArea(.all))
        
        
     }
}

struct MainView: View {
    var quotes: [Quotes]
    
    var body: some View {
        VStack {
            Image("1")
                .resizable()
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 2))
                .frame(width: 100, height: 100, alignment: .center)
            
            Text("\(quotes.count) quotes availble")
                .foregroundColor(.white)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(self.quotes, id: \.name) { data in
                        VStack {
                            HeartImage(heartImage: "like-red")
                            
                            Text(data.quote)
                            
                            VStack{
                                Text("By \(data.name)")
                            }.padding(.top)
                            
                        }.frame(width: 300, height: 300)
                        .cornerRadius(20)
                        .foregroundColor(.gray)
                        .background(LinearGradient(gradient: Gradient(colors: [.init(red: 159/255, green: 204/255, blue: 250/255), .white]), startPoint: .center, endPoint: .bottomTrailing))
                                
                    }.padding(.all, 7)
                }
                
            }
        }
    }
}
//.init(red: 159/255, green: 204/255, blue: 250/255), .init(red: 9/255, green: 116/255, blue: 241/255)

struct HeartImage: View {
    
    var heartImage: String
    
    var body: some View {
        
        Image(heartImage)
            .resizable()
            .frame(width: 100, height: 100, alignment: .center)
            .shadow(radius: 5)
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
