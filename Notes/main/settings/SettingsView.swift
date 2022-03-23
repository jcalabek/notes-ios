import SwiftUI

struct SettingsView: View {
    @State private var isAutoSave: Bool
    @State private var isExperimentalFeatures: Bool
    
    init() {
        isAutoSave = PrefsController.isAutoSave()
        isExperimentalFeatures = PrefsController.isExpermentalFeatures()
    }
    
    var body: some View {
        Form {
            Section(content: {
                Toggle("Autosave", isOn: $isAutoSave)
                    .onTapGesture {
                        let defaults = UserDefaults.standard
                        defaults.set(isAutoSave, forKey: "autosave")
                    }
                Toggle("Experimental Features", isOn: $isExperimentalFeatures)
                    .onTapGesture {
                        let defaults = UserDefaults.standard
                        defaults.set(isExperimentalFeatures, forKey: "experimental")
                    }
                if isExperimentalFeatures {
                    Button(action: {
                        fatalError("Crash")
                    }, label: { Text("Crash") })
                }
            }, header: { Text("Base") })
            
            Section(content: {
                Link("Github", destination: URL(string: "https://github.com/kotleni")!)
                Link("Telegram", destination: URL(string: "https://t.me/kotleni")!)
            }, header: { Text("Developer") })
        }
    }
}
