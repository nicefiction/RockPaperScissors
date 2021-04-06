//  GameFeedbackView.swift

import SwiftUI



 // ////////////////////////////////////////
//  MARK: struct GameFeedbackView: View { }

struct GameFeedbackView: View {
    
     // /////////////////
    //  MARK: PROPERTIES
    
    var gameScore: Int
    var gameRound: Int
    
    
    
     // //////////////////////////
    //  MARK: COMPUTED PROPERTIES
    
    var body: some View {
        
        VStack(spacing : 12) {
            Text("Your score : \(gameScore)")
            Text("Round \(gameRound) of 10")
        }
        .font(.subheadline)
    }
}





 // ///////////////
//  MARK: PREVIEWS

struct GameFeedbackView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        GameFeedbackView(gameScore : 5 ,
                         gameRound : 8)
            .previewLayout(.sizeThatFits)
    }
}
