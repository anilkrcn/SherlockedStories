import SwiftUI

struct InitialOnboardingView: View {
    @AppStorage("hasSeenOnboarding") var hasSeenOnboarding = false

    var body: some View {
        OnboardingContentView {
            hasSeenOnboarding = true
        }
    }
}
