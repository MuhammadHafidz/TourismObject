//
//  Tourism.swift
//  LastSubmissionIOSSederhana
//
//  Created by Enygma System on 05/04/22.
//

import Foundation

struct Tourism: Decodable{
    var id : Int
    var name : String
    var description : String
    var address : String
    var latitude : Double
    var longitude : Double
    var like : Int
    var image : String
}


func loadData(success: @escaping ([Tourism])-> Void, error : @escaping(String) -> Void){
    let url = URL(string: "https://tourism-api.dicoding.dev/list")!
    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = "GET"
    let task = URLSession.shared.dataTask(with: urlRequest){
        data, res, err in
        if(err != nil){
            print("Error \(err.debugDescription)")
            error(err.debugDescription)
        }else{
            do {
                if let data = data{
                    let result = try JSONDecoder().decode(ResponseTourism.self, from: data)
                    success(result.places)
                }
            }catch let jsonError{
                print("JSON ERROR = \(jsonError.localizedDescription)")
                error(jsonError.localizedDescription)
            }
        }
        
    }
    
    task.resume()
}


func testData () -> [Tourism]{
    var data = [Tourism]()
    
    for i in 1...10{
        data.append(
            Tourism(
                id: i,
                name: "TN Kelimutu",
                description: "Taman Nasional Kelimutu terletak di Flores, Indonesia. Taman nasional ini terdiri dari bukit-bukit dan gunung-gunung dengan Gunung Kelibara (1.731 m) sebagai puncak tertinggi. Gunung Kelimutu, terdapat danau Danau tiga warna yang juga merupakan tempat dari Taman Nasional Kelimutu.\n\nDi dalam Taman Nasional Kelimutu, terdapat arboretum, hutan kecil seluas 4,5 hektare yang mewakili koleksi keanekaragaman flora di daerah tersebut. Di sana terdapat 78 jenis pohon yang dikelompokkan ke dalam 36 suku. Beberapa koleksi flora yang merupakan endemik Kelimutu adalah uta onga (Begonia kelimutuensis), turuwara (Rhododendron renschianum), dan arngoni (Vaccinium varingiaefolium).",
                address: "Detusoko, Kabupaten Ende, NTT",
                latitude:  121.791432,
                longitude: -8.7415482,
                like: 57,
                image: "https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Kelimutu_2008-08-08.jpg/800px-Kelimutu_2008-08-08.jpg"
            )
        )
    }
    
    return data
}
