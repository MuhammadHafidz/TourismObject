//
//  ContentView.swift
//  LastSubmissionIOSSederhana
//
//  Created by Enygma System on 05/04/22.
//

import SwiftUI

struct ContentView: View {
    @State var isHideLoader : Bool = true
    @State var showErrorAlert = false
    @State var errorMessage = ""
    @State var tourismData = [Tourism]()
    
    var body: some View {
        ZStack{
            NavigationView{
                List(tourismData, id: \.id){ tourism in
                    ZStack{
                        ListRow(tourism: tourism)
                        NavigationLink(destination : DetailView(tourism: tourism)){
                            EmptyView()
                        }
                    }
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.black.opacity(0))
                }
                .navigationBarTitle("Tourism Object", displayMode: .inline)
                .navigationBarItems(trailing:
                                        Button(action: {
                    print("Open Profile")
                }) {
                    NavigationLink(destination: ProfileView()) {
                        Image(systemName: "person.circle.fill").imageScale(.large)
                            .tint(.black)
                    }
                }
                )
                .onAppear(){
                    isHideLoader = false
                    loadData { res in
                        isHideLoader = true
                        tourismData = res
                    } error: { err in
                        isHideLoader = true
                        errorMessage = err
                        self.showErrorAlert.toggle()
                    }
                }
                .alert(isPresented: self.$showErrorAlert) {
                    Alert(title: Text("Error"), message: Text(errorMessage) ,dismissButton: .cancel())
                }
                
            }
            .accentColor(.white)
            
            IndicatorView(tintColor: .black, scaleSize: 2.0)
                .padding(.bottom).hidden(isHideLoader)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11")
    }
}


