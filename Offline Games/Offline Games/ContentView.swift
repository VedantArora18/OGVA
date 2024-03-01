import SwiftUI

struct Item: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let colour: Color
}

struct ContentView: View {
    @State private var showingLoginScreen = false
    private let items = [
        Item(title: "Rock Paper Scissors", colour: Color.blue),
        Item(title: "Bullseye", colour: Color.blue),
        Item(title: "Snake", colour: Color.blue),
        Item(title: "Memory Game", colour: Color.blue)
    ]

    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        NavigationView{
            
            ZStack {
            
            Image("BG1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    
                    HStack{
                        Text("Games")
                            .font(.system(size: 40, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                        VStack {
                            Button(action: {
                                showingLoginScreen = true
                            }) {
                                Image(systemName: "gear")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.white)
                            }
                            .frame(width: 50, height: 50)
                            .background(Color.blue)
                            .cornerRadius(25)
                            .padding()
                            .shadow(radius: 4)
                            
                            NavigationLink(destination: SettingsView(), isActive: $showingLoginScreen) {
                                EmptyView()
                            }
                            .navigationBarBackButtonHidden(true)
                        }

                        
                       
                    }
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(items) { item in
                            NavigationLink(destination: destinationForItem(item: item)) {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 20)
                                        .foregroundColor(item.colour)
                                        .frame(height: 200)
                                    Text(item.title)
                                        .font(.system(size: 24, weight: .bold, design: .rounded))
                                        .foregroundColor(.white)
                                }
                            }
                        }
                    }
                    .padding(10)
                }
            }
            .navigationTitle("All Games")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.blue)
            .toolbarColorScheme(.dark)
        }
        .navigationBarBackButtonHidden(true)
    }

    func destinationForItem(item: Item) -> some View {
        switch item.title {
        case "Rock Paper Scissors":
            return AnyView(RockPaperScissors())
        case "Bullseye":
            return AnyView(Bullseye())
        case "Snake":
            return AnyView(Snake())
        case "Memory Game":
            return AnyView(MemoryGame())
        default:
            return AnyView(EmptyView())
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
