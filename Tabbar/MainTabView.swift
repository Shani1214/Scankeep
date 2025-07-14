import SwiftUI

enum Tab {
    case home
    case receipts
    case notifications
    case settings
}

struct MainTabView: View {
    @State private var selectedTab: Tab = .home

    var body: some View {
        VStack(spacing: 0) {
        
            Group {
                switch selectedTab {
                case .home:
                    HomeScreen()
                case .receipts:
                    ReceiptScreen()
                case .notifications:
                    NotificationScreen()
                case .settings:
                   SettingScreen()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

            // MARK: Custom Tab Bar
            HStack {
                TabBarButton(
                    tab: .home,
                    selectedTab: $selectedTab,
                    icon: Image.appImage.homee,
                    title: "Home"
                )
                TabBarButton(
                    tab: .receipts,
                    selectedTab: $selectedTab,
                    icon: Image.appImage.receipts,
                    title: "Receipts"
                )
                TabBarButton(
                    tab: .notifications,
                    selectedTab: $selectedTab,
                    icon: Image.appImage.notifications,
                    title: "Notification"
                )
                TabBarButton(
                    tab: .settings,
                    selectedTab: $selectedTab,
                    icon: Image.appImage.settings,
                    title: "Settings"
                )
            }
            .padding(.vertical, 10)
            .background(Color.white.shadow(radius: 1))
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct TabBarButton: View {
    let tab: Tab
    @Binding var selectedTab: Tab
    let icon: Image
    let title: String

    var isSelected: Bool {
        selectedTab == tab
    }

    var body: some View {
        Button(action: {
            selectedTab = tab
        }) {
            VStack(spacing: 4) {
                icon
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 22, height: 22)
                    .foregroundColor(isSelected ? .blue : .gray)

                Text(title)
                    .font(.caption)
                    .foregroundColor(isSelected ? .blue : .gray)
            }
            .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    MainTabView()
}
