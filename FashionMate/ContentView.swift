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
            
            ShoppingView()
                .tabItem {
                    Image(systemName: "bag")
                    Text("Shop")
                }
            
            WardrobeView()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Kleiderschrank")
                }
            
        }
    }
}

struct ShoppingView: View {
    var body: some View {
        Text("Hier ist der Shop")
            .font(.title)
            .navigationTitle("Shop")
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
        ("dress", "Jacke"),
        ("shoes", "Schuhe")
    ]

    @State private var showSettings = false

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
          .navigationBarTitle("Kleiderschrank", displayMode:.inline)
          .navigationBarItems(trailing: Button(action: {
                self.showSettings = true
            }) {
                Image(systemName: "gear")
                  .imageScale(.large)
                  .padding()
            })
          .sheet(isPresented: $showSettings) {
                SettingsView()
            }
        }
    }
}

struct SettingsView: View {
    @State private var name = ""
    @State private var age = ""
    @State private var size = ""
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name", text: $name)
                    TextField("Alter", text: $age)
                    TextField("Größe", text: $size)
                }
            }
           .navigationBarTitle("Einstellungen", displayMode:.inline)
           .navigationBarItems(trailing: Button(action: {
                // Speichere die Einstellungen
                print("Einstellungen gespeichert: \(name), \(age), \(size)")
               self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("Speichern")
            })
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

