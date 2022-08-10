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
