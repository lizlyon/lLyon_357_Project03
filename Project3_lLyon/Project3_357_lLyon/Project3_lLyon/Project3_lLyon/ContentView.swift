//
//  ContentView.swift
//  Project3_lLyon
//
//  Created by Elizabeth Lyon on 3/15/21.
//

//how the prject is built by binding the views and functionalities

import SwiftUI

struct ContentView: View {
    //State only for view handler
    //store the collection of strings in var words
    //@State var word = StorageHandler.getStorage()
    //store the passwords
    @State var passwords = StorageHandler.getStorage()
    //@State var words2 = StorageHandler.getStorage()
    //@State private var passwords: Dictionary = [:]
    //the top text box for name
    @State private var key: String = ""
    //the bottom text box for passowrd
    @State private var value: String = ""
    @State private var showingDetail = false
    
    var body: some View {
        VStack {
            //this text will be stored in the var word
            Text("Password Manager:")
                .padding()
                .font(.custom("callout", size: 25))
            //text field 1
            TextField("Name...", text: $key)
                .frame(width: 100, height: 50, alignment: .center)
                .padding()
                .font(.callout)
            //text field 2
            TextField("Password...", text: $value)
                .frame(width: 100, height: 50, alignment: .center)
                .padding()
                .font(.callout)
            //button take in action and label
            Button(
                action: {
                //if it's an empty string for the password value input box
                if value != "" {
                    let tempWord = self.value
                    var tempNewWord = ""
                    for c in tempWord{
                    tempNewWord +=
                        String(Encrypt.translate(l: c, intToTranslate: tempWord.count))
                }
                    passwords.append(tempNewWord)
                    StorageHandler.setStorage(input: passwords)
                    self.value = ""
                }
            },
            label: {
                Text("Add password")
                    .foregroundColor(.white)
                    .frame(width: 200, height: 40)
                    .background(Color.blue)
                    .cornerRadius(15)
                    .padding()
            }) .frame(maxHeight: .infinity, alignment:.bottom)
            NavigationView{
              List {
                ForEach(passwords, id: \.self){
                    item in
                    NavigationLink(
                        destination: Text(item),
                        label: {
                            Text(item)
                        })
                    Button(
                        action:{
                            showingDetail.toggle()
                        },
                        label: {
                        Text(key)
                            .frame(maxWidth: .infinity,
                                   alignment: .leading)
                    })
                    .sheet(isPresented: $showingDetail){
                        DetailView() //pass in the word that was clicked on
                    }
                } //as (String.Type.Element) -> ContentView()
                .onDelete(perform: delete)
            }
          }
       }
    }

    func delete(at offset: IndexSet){
        //remove from passwords collection at the index
        passwords.remove(atOffsets: offset)
        //resave the updated words list
        StorageHandler.setStorage(input: passwords)
        //value.remove(atOffsets: offsets)
        //resave the updated words list
        //StorageHandler.setStorage(dictionary: value)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
