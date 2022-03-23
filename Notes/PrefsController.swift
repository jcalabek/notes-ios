import Foundation

class PrefsController {
    static func isAutoSave() -> Bool {
        let defaults = UserDefaults.standard
        return !defaults.bool(forKey: "autosave")
    }
    
    static func isExpermentalFeatures() -> Bool {
        let defaults = UserDefaults.standard
        return !defaults.bool(forKey: "experimental")
    }
}
