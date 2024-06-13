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
    let outfits = [
        ("fit1","1"),
        ("fit2","2"),
        ("fit3","3"),
        ("fit4","4")
    ]

    var body: some View {
        NavigationView {
            VStack {
                Text("Styles")
                   .font(.title)
                Text("Wetter: 23Grad & Sonnig")
                   .font(.headline)

                HStack {
                    Image(outfits[0].0)
                       .resizable()
                       .frame(width: 150, height: 200)
                    Image(outfits[1].0)
                       .resizable()
                       .frame(width: 150, height: 200)
                }

                HStack {
                    Image(outfits[2].0)
                       .resizable()
                       .frame(width: 150, height: 200)
                    Image(outfits[3].0)
                       .resizable()
                       .frame(width: 150, height: 200)
                }

            }
        }
    }
}
struct Trend: Identifiable {
    let id = UUID()
    var name: String
    var description: String
    var image: String
}

struct SearchBar: View {
    @Binding var text: String

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
               .foregroundColor(.secondary)

            TextField("Search", text: $text)
               .foregroundColor(.primary)

            Button(action: {
                self.text = ""
            }) {
                Image(systemName: "xmark.circle.fill")
                   .foregroundColor(.secondary)
            }
        }
       .padding(.vertical, 8)
       .padding(.horizontal, 16)
       .background(Color(.systemGray6))
       .cornerRadius(10.0)
    }
}

struct TrendsView: View {
    @State private var searchText = ""

    let trends: [Trend] = [
        Trend(name: "Sustainable Fashion", description: "Mode, die umweltfreundlich ist", image: "image1"),
        Trend(name: "90s Revival", description: "Die 90er Jahre sind zurück", image: "image2"),
        Trend(name: "Streetwear", description: "Mode, die auf der Straße entsteht", image: "image1"),
        // ...
    ]

    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText)
                   .padding(.horizontal)

                List(trends.filter { $0.name.contains(searchText) || $0.description.contains(searchText) }) { trend in
                    NavigationLink(destination: Image(trend.image)) {
                        VStack(alignment:.leading) {
                            Text(trend.name)
                               .font(.headline)
                            Text(trend.description)
                               .foregroundColor(.secondary)
                        }
                    }
                }
            }
           .navigationBarTitle("Trends", displayMode:.inline)
        }
    }
}

struct WardrobeView: View {
    let clothes = [
        ("shirt", "Hemd"),
        ("pants", "Hose"),
        ("jacket", "Jacke"),
        ("shoes", "Schuhe")
    ]

    @State private var showSettings = false
    @State private var showProfile = false

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
            
            .navigationBarItems(trailing: Button(action: {
                self.showProfile = true
            }) {
                Image(systemName: "person.crop.circle")
                    .imageScale(.large)
                    .padding()
            })
            .sheet(isPresented: $showProfile) {
                ProfileView()
            }
            
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
    @State private var button1 = false
    @State private var button2 = false
    @State private var button3 = false

    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            Form {
                Section {
                    Toggle("Mitteilungen", isOn: $button1)
                        .toggleStyle(SwitchToggleStyle(tint: .blue))
                    Toggle("Standort verwenden", isOn: $button2)
                        .toggleStyle(SwitchToggleStyle(tint: .blue))
                    Toggle("Nutzerdaten teilen", isOn: $button3)
                        .toggleStyle(SwitchToggleStyle(tint: .blue))
                    
                }
            }
           .navigationBarTitle("Einstellungen", displayMode:.inline)
           .navigationBarItems(trailing: Button(action: {
                // Speichere die Einstellungen
               self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("Speichern")
            })
        }
    }
}
struct ProfileView: View {
    @State private var name = "Max Mustermann"
    @State private var age = "22"
    @State private var shoesize = "44"
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text("Name:")
                    TextField("Name", text: $name)
                    Text("Alter:")
                    TextField("Alter", text: $age)
                    Text("Schuhgröße:")
                    TextField("Größe", text: $shoesize)
                }
            }
           .navigationBarTitle("Profil", displayMode:.inline)
           .navigationBarItems(trailing: Button(action: {
                // Speichere die Einstellungen
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
