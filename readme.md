# Handoff

I am developing an application for iOS and macOS and I would like to implement
the Handoff feature for it. The application works such that the iOS versions
stores its data locally and the macOS version should only work when the iOS
version is running and on reachable by Handoff. The macOS version should pull
its data from the iOS application and submit any changes to the iOS version to
persist.

This is not exactly the intended use-case for Handoff and I suspect in this
spike I might find it is not feasible to implement this. Maybe Handoff won't be
fast enough or have high enough throughput to exchange data through it as if it
was a generalized data transfer channel.

I am unable to determine the feasibility of this without implementing the
feature and finding out for myself, hence this repository.

Apple documentation includes a Handoff tutorial I will be working off of,
pulling in any other sources as/if needed:

https://developer.apple.com/documentation/foundation/task_management/implementing_handoff_in_your_app

I started off with iOS where I replaced the initial `Text` with a `TextField`
and I bound its text to a variable on the view. On each change to the binding, I
think I should update the activity. At the same time, the tutorial says to
override the `updateUserActivityState` method of the view controller. I don't
know how to get at the root view controller in Swift and according to this
Stack Overflow question, it is not exactly straightforward:

https://stackoverflow.com/a/59994872/2715716

There is also this HackingSwift article about view controllers in SwiftUI:

https://www.hackingwithswift.com/books/ios-swiftui/wrapping-a-uiviewcontroller-in-a-swiftui-view

Between these two resources I think there really won't be a simpler way to just
get at some default/root view controller and I will have to add this noise.

I ended up not trying this yet and instead just updating the activity instance.
I still need access to the application delegate in the macOS application to be
able to listen to the Handoff messages there, so I looked into how to access it
in a SwiftUI application:

https://www.hackingwithswift.com/quick-start/swiftui/how-to-add-an-appdelegate-to-a-swiftui-app

This article is for iOS but the concept is the same for macOS, just using the
`NS` prefix instead of `UI`. https://stackoverflow.com/a/71292001/2715716

This alone has not enabled me to receive the Handoff messages in the macOS app
sent from the iOS app. It looks like I will have to figure out the view
controller stuff on the iOS side.

I found one more link that looks very promising for this:

https://developer.apple.com/tutorials/swiftui/interfacing-with-uikit

- [ ] Access the view controller and override its `updateUserActivityState`
- [ ] Validate my `updateUserActivityState` override is being called
- [ ] Find out by what mechanism I should update the activity (push/pull):
  - [ ] Find out if I should pro-actively update the activity in the binding
  - [ ] Find out if I should re-actively update in `updateUserActivityState`
- [ ] Implement the Handoff handler in the macOS app and see if it gets called
