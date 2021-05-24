//
//  ContentView.swift
//  H4X0R News
//
//  Created by Camilo Moreno on 23/05/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView{
            List(networkManager.posts){ post in
                NavigationLink(
                    destination: DetailView(url: post.url),
                    label: {
                        HStack{
                            Text(String(post.points))
                            Text(post.title)
                        }
                    })
                
                
            }
            .navigationTitle("H4X0R NEWS")
        }.onAppear{
            self.networkManager.fetchData()
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}





