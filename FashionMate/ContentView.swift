import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Fashion AI App")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()

                Text("Willkommen bei Trendify!")
                    .font(.title2)
                    .padding(.bottom, 40)

                NavigationLink(destination: StyleSuggestionsView()) {
                    Text("Style Vorschläge")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 200, height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding(.bottom, 20)

                NavigationLink(destination: TrendsView()) {
                    Text("Trends")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 200, height: 50)
                        .background(Color.green)
                        .cornerRadius(10)
                }
                .padding(.bottom, 20)
                
                NavigationLink(destination: WardrobeView()) {
                    Text("Kleiderschrank")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 200, height: 50)
                        .background(Color.orange)
                        .cornerRadius(10)
                }
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

