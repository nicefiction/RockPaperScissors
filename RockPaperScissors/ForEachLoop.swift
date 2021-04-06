// MARK: ForEachLoop.swift

import SwiftUI



 // //////////////////////////////////
//  MARK: struct ForEachLoop: View { }

struct ForEachLoop: View {
    
     // /////////////////
    //  MARK: PROPERTIES
    
    let humans: [String] = [
        
        "Dorothy" , "Glinda" , "Ozma" , "Dahlia" , "Olivia"
    ]
    
    
    
     // //////////////////////////
    //  MARK: COMPUTED PROPERTIES
    
    var body: some View {
        
        VStack {
            ForEach(0..<humans.count) { (index: Int) in
                Text(humans[index])
                    .font(.title)
                    .foregroundColor(.yellow)
                    .bold()
            }
            
            ForEach(humans.reversed() ,
                    id: \.self) { (human: String) in
                Text(human)
                    .font(.title)
                    .foregroundColor(.green)
                    .bold()
            }
        }
    }
}





 // ///////////////
//  MARK: PREVIEWS

struct ForEachLoop_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ForEachLoop().previewDevice("iPhone 12 Pro")
    }
}
