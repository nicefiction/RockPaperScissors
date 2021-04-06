// MARK: ContentView.swift

import SwiftUI



 // //////////////////////////////////
//  MARK: struct ContentView: View { }

struct ContentView: View {
    
     // ////////////////////////
    //  MARK: PROPERTY WRAPPERS
    
    @State private var isShowingGameRoundOutcomeAlert: Bool = false
    @State private var rockPaperScissors: [String] = [ "⛰" , "📄" , "✂️" ]
    @State private var playerASelectionIndex: Int = Int.random(in : 0...2)
    @State private var playerBSelectionIndex: Int = 0
    @State private var gameScore: Int = 0
    @State private var gameRound: Int = 1
 
    
    
     // //////////////////////////
    //  MARK: COMPUTED PROPERTIES
    
    var roundScore: Int {
        
        switch (rockPaperScissors[playerASelectionIndex] ,
                rockPaperScissors[playerBSelectionIndex]) {
        
        case ("⛰" , "📄") : return 1
        case ("⛰" , "✂️") : return -1
        case ("📄" , "✂️") : return 1
        case ("📄" , "⛰") : return -1
        case ("✂️" , "⛰") : return 1
        case ("✂️" , "📄") : return -1
        default            : return 0
        }
    }
    
    
    var roundFeedback: String {
        
        switch roundScore {
        
        case 1  : return "You win ."
        case 0  : return "It is a Draw ."
        default : return "You lose ."
        }
    }
    
    
    var body: some View {
        
        VStack(spacing : 15) {
            // Text("Player A has chosen \(rockPaperScissors[playerASelectionIndex]) .")
            Text("Player A has chosen . Your turn :")
            Spacer()
            ForEach(0..<rockPaperScissors.count) { (index: Int) in
                
                Button(action : {
                    tapButtonWith(index : index)
                } , label : {
                    ZStack {
                        Circle()
                            .foregroundColor(Color.orange)
                        Text(rockPaperScissors[index])
                            .font(.system(size: 80.0))
                    }
                })
                .alert(isPresented : $isShowingGameRoundOutcomeAlert) {
                    Alert(title : Text(roundFeedback) ,
                          message : Text("Your new game score : \(gameScore)") ,
                          dismissButton : .default(Text("Continue")) {
                            
                            startNewRound()
                          })
                }
            }
           
            VStack(spacing : 12) {
                Text("Your score : \(gameScore)")
                Text("Round \(gameRound) of 10")
            }
            .font(.subheadline)
        }
    }
    
    
    
     // /////////////////////
    //  MARK: HELPER METHODS
    
    func startNewRound() {
        
        gameRound < 10 ? gameRound += 1 : startNewGame()
        playerASelectionIndex = Int.random(in: 0...2)
    }
    
    
    func startNewGame() {
        
        gameRound = 0
        gameScore = 0
        playerASelectionIndex = Int.random(in: 0...2)
    }
    
    
    func updateGameScore(with score: Int) {
        
        gameScore += score
    }
    
    
    func tapButtonWith(index: Int) {
        
        print("\(rockPaperScissors[index]) has been tapped .")
        
        playerBSelectionIndex = index
        updateGameScore(with : roundScore)
        
        isShowingGameRoundOutcomeAlert.toggle()
    }
}





 // ///////////////
//  MARK: PREVIEWS

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ContentView().previewDevice("iPhone 12 Pro")
    }
}
