import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            StartView()
                .ignoresSafeArea()
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
        }
    }
}
