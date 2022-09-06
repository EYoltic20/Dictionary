//
//  ContentView.swift
//  Dictionary_game
//
//  Created by Emilio Y Martinez on 31/08/22.
//

import SwiftUI

struct ListView: View {
    // we declare the language that we are going to use
    @State var languages = [
        Language(language: "Español"),
        Language(language: "Ingles"),
        Language(language: "Aleman")]
    var l : Language
    @State var newLanguage = ""
    var body: some View {
        NavigationView{
            List{
                
                ForEach($languages.indices , id: \.self){index in
                    ZStack(alignment:.leading){
                        NavigationLink(destination:Palabras()){
                            EmptyView()
                        }.opacity(0)
                        LanguagesView(language:$languages[index])


                    
                    }
                    .padding()
                    
                }
                
                .onDelete(perform: {i in
                    languages.remove(atOffsets: i)
                })
                .animation(.linear)
                .listRowSeparator(.hidden)
            }.listStyle(.inset)
                .navigationTitle("Dictionary")

        }
        
    }
    
}
// MARK : -Making Buttos
struct LanguagesView: View{
    @Binding var language : Language
    @State var goToTheDic = false
    @State var mostrarMenu = false
    var body: some View{
        ZStack{
            Rectangle()
                .cornerRadius(30)
                .frame(minWidth:0,maxWidth: .infinity)
                .foregroundColor(.blue).opacity(0.3)
                .shadow(color: .black, radius: 20, x: 10 , y: 5).opacity(0.8)
            VStack{
                Text("\(language.language)")
                    .foregroundColor(.black)
                    .font(.system(size: 30))
                    .font(.system(.body,design: .rounded))
            }
        }
        .frame(height:100)
        .contextMenu{
            Button(action:{self.mostrarMenu.toggle()}){
                HStack{
                    Image(systemName: "play")
                    Text("Play a game")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(l:Language(language: ""))
    }
}
