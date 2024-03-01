import SwiftUI

enum Choices: String, CaseIterable {
    case Scissors = "✂️", Paper = "📄", Stone = "🪨"
}

struct RockPaperScissors: View {
    @State private var computerChoice = Choices.allCases.first!
    @State private var gameOutcome = ""
    
    @State private var wins = 0
    @State private var rounds = 0
    
    @State private var showAlert = false
    @State private var showComputerChoice = false
    @State private var currentQuote = ""
    
    let quotes = [
        "\"Life is like a game of Rock, Paper, Scissors.\n Sometimes you win, sometimes you lose.\"",
        "\"In the game of life, be the Rock that \n stands strong in the face of challenges.\"",
        "\"Paper represents creativity. Let your \n imagination unfold like a piece of paper.\"",
        "\"Sometimes you need to cut through the \n difficulties in life, just like Scissors.\"",
        "\"In the grand scheme of things, we're all \n just stones in the river of time.\""
    ]
    
    var body: some View {
        ZStack {
            Image("BG1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            GeometryReader { geo in
                VStack {
                    // Computer
                    VStack {
                        
                        if !showComputerChoice {
                            Text("ROCK, PAPER, SCISSORS")
                                .font(.system(size: 30))
                                .fontWeight(.bold)
                                .underline()
                                .foregroundColor(randomColor())
                            Text("🤖")
                                .font(.system(size: 180))
                            Text(currentQuote)
                                .foregroundColor(.white)
                            
                        } else {
                            Text(computerChoice.rawValue)
                                .font(.system(size: 180))
                        }
                    }
                    .frame(width: geo.size.width, height: geo.size.height / 2)
                    
                    // Player
                    VStack {
                        Text("Make your move:")
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                            .padding()
                        HStack(spacing: 0) {
                            ForEach(Choices.allCases, id: \.self) { option in
                                Button(action: {
                                    // Start round
                                    rounds += 1
                                    
                                    // Generate comp choice
                                    let index = Int.random(in: 0...Choices.allCases.count-1)
                                    computerChoice = Choices.allCases[index]
                                    showComputerChoice = true
                                    // If Win
                                    checkWin(playerChoice: option)
                                    // Update currentQuote with a random quote
                                    currentQuote = quotes.randomElement() ?? ""
                                }) {
                                    Text(option.rawValue)
                                        .font(.system(size: 370 / CGFloat(Choices.allCases.count)))
                                }
                            }
                        }
                        HStack {
                            Spacer()
                            Text("Wins: \(wins)")
                                .foregroundColor(.green)
                            Spacer()
                            Text("Round: \(rounds)")
                                .foregroundColor(.white)
                            Spacer()
                            Button(action: {
                                wins = 0
                                rounds = 0
                                computerChoice = Choices.allCases.first!
                                showComputerChoice = false
                            }) {
                                Text("Reset")
                            }
                            Spacer()
                        }
                    }
                    .frame(width: geo.size.width, height: geo.size.height / 2)
                }
            }
            .alert("You \(gameOutcome)!", isPresented: $showAlert) {
                Button("Play Again!", role: .cancel) {
                    showComputerChoice = false
                }
            }
        }
    }
    func checkWin(playerChoice: Choices) {
        switch playerChoice {
        case .Scissors:
            if computerChoice == .Scissors {
                gameOutcome = "Draw"
            } else if computerChoice == .Paper {
                gameOutcome = "Win"
                wins += 1
            } else {
                gameOutcome = "Lose"
            }
        case .Paper:
            if computerChoice == .Scissors {
                gameOutcome = "Lose"
            } else if computerChoice == .Paper {
                gameOutcome = "Draw"
            } else {
                gameOutcome = "Win"
                wins += 1
            }
        case .Stone:
            if computerChoice == .Scissors {
                gameOutcome = "Win"
                wins += 1
            } else if computerChoice == .Paper {
                gameOutcome = "Lose"
            } else {
                gameOutcome = "Draw"
            }
        }
        
        showAlert = true
    }
    func randomColor() -> Color {
            let red = Double.random(in: 0...1)
            let green = Double.random(in: 0...1)
            let blue = Double.random(in: 0...1)
            return Color(red: red, green: green, blue: blue)
        }
}

struct RockPaperScissors_Previews: PreviewProvider {
    static var previews: some View {
        RockPaperScissors()
    }
}
