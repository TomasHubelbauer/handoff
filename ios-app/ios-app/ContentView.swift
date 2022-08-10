import SwiftUI

struct ContentView: View {
    @State var text: String = ""
    var activity: NSUserActivity
    
    init() {
        self.activity = NSUserActivity(activityType: "tom")
        self.activity.isEligibleForHandoff = true
        self.activity.userInfo = ["text": self.text]
        self.activity.becomeCurrent()
    }
        
    var body: some View {
        let binding = Binding<String>(
            get: {
                self.text
            },
            set: {
                self.text = $0
                // TODO: Update the activity?
            }
        )
        
        TextField("Tom", text: binding).padding()
    }
}
