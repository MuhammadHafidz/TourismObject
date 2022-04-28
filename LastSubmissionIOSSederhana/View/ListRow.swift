//
//  ListRow.swift
//  LastSubmissionIOSSederhana
//
//  Created by Enygma System on 05/04/22.
//

import SwiftUI

struct ListRow: View {
    var tourism : Tourism
    
    var body: some View {
        ZStack(alignment : .topTrailing){
            HStack{
                VStack(alignment : .leading){
                    Spacer()
                    Text(tourism.name)
                        .font(.title2)
                        .foregroundColor(.white)
                    Text(tourism.address)
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .padding(.bottom, 20.0)
                }
                .padding(.leading, 20.0)
                Spacer()
            }
            HStack{
                Image(systemName: "hand.thumbsup.fill")
                    .foregroundColor(.white)
                
                Text("\(tourism.like)")
                    .font(.caption)
                    .foregroundColor(.white)
            }
            .padding([.top, .trailing], 20.0)
        }
        .frame(height: 200.0)
        .background(
            AsyncImage(url: URL(string: tourism.image)){ image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200)
                    .cornerRadius(25)
                    .overlay(TintOverlay().opacity(0.75))
                    .shadow(color: .gray, radius: 5, x: 2, y: 2)
                
            } placeholder: {
                Color.gray.opacity(0.1)
                    .cornerRadius(25)
                    .shadow(color: .gray, radius: 5, x: 2, y: 2)
            }
            
        )
        
    }
}

struct ListRow_Previews: PreviewProvider {
    static var previews: some View {
        ListRow(tourism: testData()[0])
    }
}

