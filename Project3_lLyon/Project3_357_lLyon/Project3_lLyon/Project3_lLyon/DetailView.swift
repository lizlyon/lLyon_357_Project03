//
//  DetailView.swift
//  Project3_lLyon
//
//  Created by Elizabeth Lyon on 3/15/21.
//

import Foundation
import SwiftUI

//where we see the decoded passwords
struct DetailView: View {
  
    
//    Encrypt.translate(
//    i: encryptedString, trans:
//    Encrypt.getReverseTranslate(encryptedString.count)
//    )
    var body: some View {
        Text("Password Information")
        .padding()
        .font(.custom("callout", size: 25))
        .frame(maxHeight: .infinity, alignment: .top)
        
     }
    
}

struct DetailView_Previews : PreviewProvider{
    static var previews: some View{
        DetailView()
    }
}
