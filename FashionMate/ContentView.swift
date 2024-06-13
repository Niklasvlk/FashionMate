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
    ("fit1"),
    ("fit2"),
    ("fit3"),
    ("fit4")
    ]
    var body: some View {
        NavigationView {
            VStack{
                Text("Styles")
                    .position(CGPoint(x: 196.0, y: 10.0))
                    .font(.title)
                Text("Wetter: 23Grad & Sonnig")
                    .position(CGPoint(x: 130.0, y: -250.0)
                    )
                    .font(.headline)
            }


        }
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
