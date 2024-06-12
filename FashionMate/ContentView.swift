import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            StyleSuggestionsView()
                .tabItem {
                    Image(systemName: "wand.and.stars")
                    Text("Style Vorschläge")
                }
            
            TrendsView()
                .tabItem {
                    Image(systemName: "flame")
                    Text("Trends")
                }
            
            WardrobeView()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Kleiderschrank")
                }
        }
    }
}

struct StyleSuggestionsView: View {
    var body: some View {
        Text("Hier werden Style Vorschläge angezeigt")
            .font(.title)
            .navigationBarTitle("Style Vorschläge", displayMode: .inline)
    }
}

struct TrendsView: View {
    var body: some View {
        Text("Hier werden die neuesten Trends angezeigt")
            .font(.title)
            .navigationBarTitle("Trends", displayMode: .inline)
    }
}

struct WardrobeView: View {
    let clothes = [
        ("shirt", "Hemd"),
        ("pants", "Hose"),
        ("dress", "Kleid"),
        ("shoes", "Schuhe")
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Mein Kleiderschrank")
                    .font(.largeTitle)
                    .padding(.top)

                List(clothes, id: \.0) { item in
                    HStack {
                        Image(item.0)
                            .resizable()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                        Text(item.1)
                            .font(.title2)
                            .padding(.leading, 10)
                    }
                }
            }
            .navigationBarTitle("Kleiderschrank", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

