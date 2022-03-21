import Foundation

class Prefs {
    static func isAutoSave() -> Bool {
        let defaults = UserDefaults.standard
        return !defaults.bool(forKey: "autosave")
    }
}
