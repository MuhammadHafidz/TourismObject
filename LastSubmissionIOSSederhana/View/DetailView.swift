//
//  DetailView.swift
//  LastSubmissionIOSSederhana
//
//  Created by Enygma System on 06/04/22.
//

import SwiftUI

struct DetailView: View {
    var tourism : Tourism
    var body: some View {
        ZStack(alignment :.topTrailing){
            Color.black.opacity(0.60).ignoresSafeArea()
            VStack(alignment : .leading){
                
                Text(tourism.name)
                    .font(.title)
                    .foregroundColor(Color.white)
                
                Text(tourism.address)
                    .font(.subheadline)
                    .foregroundColor(Color.white)
                
                Spacer()
                
                Text(tourism.description)
                    .font(.body)
                    .foregroundColor(Color.white)
                
                Button(action: {
                    let url = URL(string: "maps://?saddr=&daddr=\(tourism.latitude),\(tourism.longitude)")
                    if UIApplication.shared.canOpenURL(url!) {
                        UIApplication.shared.open(url!, options: [:], completionHandler: nil)
                    }
                }) {
                    Text("Open in Maps")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(hexStringToUIColor(hex: "#3EB489")).cornerRadius(10))
                        .cornerRadius(10)
                }.padding(.top)
            }.padding(.all, 20)
            
            HStack{
                Image(systemName: "hand.thumbsup.fill")
                    .foregroundColor(.white)
                
                Text("\(tourism.like)")
                    .font(.caption)
                    .foregroundColor(.white)
            }
            .padding(.top, 40)
            .padding(.trailing, 20)
            
        }
        .background(
            AsyncImage(url: URL(string: tourism.image)){ image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                    .shadow(color: .gray, radius: 5, x: 2, y: 2)
                
            } placeholder: {
                Color.gray.opacity(0.1)
                    .cornerRadius(25)
                    .shadow(color: .gray, radius: 5, x: 2, y: 2)
            }
            
        )
        .enableLightStatusBar()
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(tourism: testData()[0])
    }
}


