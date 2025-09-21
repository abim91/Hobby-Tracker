//
//  ContentView.swift
//  HobbyTracker
//
//  Created by Abim Shrestha on 9/19/25.
//

import SwiftUI
import CoreData

var HobbyList: [String:String] = [
    "Run": "🏃‍♂️",
    "Read": "📚",
    "Draw": "🎨",
    "Cook": "🍳",
    "Write": "✍️",
    "Swim": "🏊‍♀️",
    "Dance": "💃",
    "Sing": "🎤",
    "Travel": "✈️",
    "Garden": "🌱",
    "Play": "🎮"
]
struct ContentView: View {
   
   
    @Environment(\.managedObjectContext) private var viewContext
    @State private var showAddItemView = false
    
    //    @FetchRequest(
    //        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
    //        animation: .default)
    //        animation: .default)
    //    private var items: FetchedResults<Item>
    
    
    var body: some View {
        
        ScrollView {
            VStack{
                HStack{
                    Text("HOBBY TRACKER").bold()
                    Button(action: {
                            showAddItemView.toggle()}) {
                            Label(" ", systemImage: "plus")
                        
                        }.bold(true).padding(.leading, 150)
                    
                }
                Spacer()
                VStack{
                    ForEach(Array(HobbyList.keys), id: \.self) { item in
                        HStack{
                            Text(item).padding(20)
                            Text(HobbyList[item] ?? "")
                        }
                        Divider()

                    }
                    
                }
                
                
            }
        }.sheet(isPresented: $showAddItemView, content: {FormView() })
    }
}

struct FormView: View{
    @State  var emoji: String = "📖";
    @State var hobbyName:String = "" ;
    @State var hobbyAdded = false ;
    var body: some View {
        
        VStack{
            Form{
                TextField(
                    "Hobby",
                    text: $hobbyName
                )
                
                Picker(selection: $emoji, label: Text("Pick a Emoji"),
                       content: {
                    Text("📖").tag("📖")
                    Text("🎶").tag("🎶")
                    Text("🏃‍♂️").tag("🏃‍♂️")
                    Text("💰").tag("💰")
                    Text("🎨").tag("🎨")
                    Text("🍳").tag("🍳")
                    Text("✍️").tag("✍️")
                    Text("🏊‍♀️").tag("🏊‍♀️")
                    Text("💃").tag("💃")
                    Text("🎤").tag("🎤")
                    Text("✈️").tag("✈️")
                    Text("🌱").tag("🌱")
                    Text("🎮").tag("🎮")
                    Text("📷").tag("📷")
                    Text("📚").tag("📚")
                    Text("🚴‍♂️").tag("🚴‍♂️")
                    Text("🧘‍♂️").tag("🧘‍♂️")
                    Text("🎲").tag("🎲")
                    Text("🎬").tag("🎬")
                    Text("🎹").tag("🎹")
                    
                })
//                Text("Selected tag: \(emoji)")
//                Text("Selected tag: \(hobbyName)")
                
                Button(action: {
                    
                    if(hobbyName.count > 3 && hobbyName.count < 15){
                        if(!HobbyList.keys.contains(hobbyName)){
                            HobbyList[hobbyName] = emoji;
                            print("addeddfas")
                            print(HobbyList)
                            hobbyName = ""
                            hobbyAdded = true
                        }
                        
                    }
                }){
                    Label("Submit", systemImage: "")
                    Divider()
                    if(hobbyAdded){
                        Text("Hobby Added")
                    }
                    else{
                        Text("Hobby Already Exist")
                    }
                }
            }
            
        }
        
    }
}

struct Success: View{
    var body: some View {
        Text("Hobby was added")
    }
}

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
