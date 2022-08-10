import SwiftUI

struct ContentView: View {
    @State var text: String = ""
    var activity: NSUserActivity
    
    init() {
        self.activity = NSUserActivity(activityType: "tom")
        self.activity.isEligibleForHandoff = true
    }
        
    var body: some View {
        let binding = Binding<String>(
            get: {
                self.text
            },
            set: {
                self.text = $0
                self.activity.userInfo = ["text": self.text]
                self.activity.becomeCurrent()
            }
        )
        
        VStack {
            TextField("Tom", text: binding).padding()
            
            // TODO: Figure out how to allow this to have children - the TextField
            TomView(self.activity)
        }
    }
}

struct TomView: View {
    let activity: NSUserActivity
    init(_ activity: NSUserActivity) {
        self.activity = activity
    }
    
    var body: some View {
        TomViewControllerRepresentable(self.activity)
    }
}

struct TomViewControllerRepresentable: UIViewControllerRepresentable {
    let activity: NSUserActivity
    init(_ activity: NSUserActivity) {
        self.activity = activity
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let viewController = TomViewController()
        viewController.userActivity = self.activity
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        // Note that this has to be here but it unused
    }
}

class TomViewController: UIViewController {
    override func updateUserActivityState(_ activity: NSUserActivity) {
        print("updateUserActivityState?")
        activity.userInfo = ["text": "text from update!"]
        activity.becomeCurrent()
    }
}
