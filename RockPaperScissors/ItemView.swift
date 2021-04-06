// MARK: ItemView.swift

import SwiftUI



 // ///////////////////////////////
//  MARK: struct ItemView: View { }

struct ItemView: View {
    
     // /////////////////
    //  MARK: PROPERTIES
    
    let index: Int
    let arrayOfItems: [String]
    
    
    
     // //////////////////////////
    //  MARK: COMPUTED PROPERTIES
    
    var body: some View {
        
        ZStack {
            Circle()
                .foregroundColor(Color.orange)
            Text(arrayOfItems[index])
                .font(.system(size: 80.0))
        }
    }
}





 // ///////////////
//  MARK: PREVIEWS

struct ItemView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ItemView(index : 0 ,
                 arrayOfItems : ["✂️"])
            .previewLayout(.sizeThatFits)
    }
}
