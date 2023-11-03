//
//  ContentView.swift
//  NasaAPI
//
//  Created by Christopher Woods on 11/2/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedDate = Date()
    @ObservedObject var Nasa = NasaViewModel()
    
    var body: some View {
        ZStack{
            Color(.black)
                .ignoresSafeArea(.all)
            
            VStack {
                AsyncImage(url: URL(string: Nasa.picture))
                { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 400, maxHeight: 400)
                    case .failure:
                        Image(systemName: "photo")
                    @unknown default:
                        
                        EmptyView()
                    }
                }
                Spacer()
                DatePicker(
                    "Select a Date",
                    selection: $selectedDate,
                    in: ...Date(),
                    displayedComponents: .date
                )
                .datePickerStyle(GraphicalDatePickerStyle())
                .labelsHidden()
                .preferredColorScheme(.dark)
                
                Button("Update Picture") {
                    
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy-MM-dd"
                    let formattedDate = dateFormatter.string(from: selectedDate)
                    
                    Nasa.setCurrent(current: formattedDate)
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
