//
//  ProfileView.swift
//  LastSubmissionIOSSederhana
//
//  Created by Enygma System on 06/04/22.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack{
            Color.black.opacity(0.60).ignoresSafeArea()
            VStack{
                Text("Developed By :")
                    .font(.title)
                    .foregroundColor(.white)
                    .fontWeight(.medium)
                Image("my-photo")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .aspectRatio(contentMode: .fill)
                    .clipShape(Circle())
                    .shadow(color: .white, radius: 10)
                    .padding()
                
                Text("M Hafidz Amarul M")
                    .font(.title)
                    .foregroundColor(.white)
                    .fontWeight(.medium)
                
                Text("h_vdz@live.com")
                    .font(.footnote)
                
                Text("Follow Me :")
                    .font(.headline)
                    .fontWeight(.bold)
                    .padding(.top)
                    .foregroundColor(.white)
                
                VStack(alignment : .leading){
                    Button(action: {
                        UIApplication.shared.open(URL(string:"https://www.instagram.com/mhafidzam/")!)
                    }) {
                        HStack {
                            Image("instagram").foregroundColor(Color.white)
                            Text("@mhafidzam").foregroundColor(.white)
                        }
                    }.buttonStyle(PlainButtonStyle())
                        .padding(.top, 12)
                    
                    Button(action: {
                        UIApplication.shared.open(URL(string: "https://github.com/MuhammadHafidz")!)
                    }) {
                        HStack {
                            Image("github").foregroundColor(Color.white)
                            Text("MuhammadHafidz").foregroundColor(Color.white)
                        }
                    }.buttonStyle(PlainButtonStyle())
                        .padding(.top, 12)
                    
                    Button(action: {
                        UIApplication.shared.open(URL(string: "https://www.linkedin.com/in/mhaff/")!)
                    }) {
                        HStack {
                            Image("linkedin").foregroundColor(Color.white)
                            Text("M Hafidz AM").foregroundColor(Color.white)
                        }
                    }.buttonStyle(PlainButtonStyle())
                        .padding(.top, 12)
                }
                
                
                
            }
        }
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
