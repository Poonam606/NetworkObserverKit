
# 🌐 NetworkObserverKit

**NetworkObserverKit** is a lightweight Swift package that monitors real-time internet connectivity using Apple’s **Network framework (`NWPathMonitor`)**.  
It’s designed with **SwiftUI** in mind and provides a clean **environment-based injection** so you can easily access connectivity status from anywhere in your app.

---

## ✨ Features

- ✅ Real-time detection of online/offline network status  
- ✅ Built using Apple’s `NWPathMonitor`  
- ✅ Seamless integration with **SwiftUI Environment**  
- ✅ Thread-safe and memory-efficient  
- ✅ Zero external dependencies  
- ✅ Works on iOS 15+

---

## 🧩 Installation

### Using Swift Package Manager (SPM)

1. In Xcode, go to  
   **File → Add Packages…**
2. Enter the package URL:
https://github.com/Poonam606/NetworkObserverKit.git
3. Choose your app target and click **Add Package**.

---

## 🚀 Getting Started

### 1. Import the library
import NetworkObserverKit

### 2. Inject the network observer into your SwiftUI environment
In your App entry point:
@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .listenToNetwork() // 👈 Injects NetworkObserver into environment
        }
    }
}
### 3. Access network state anywhere in your SwiftUI views
struct ContentView: View {
    @Environment(\.network) private var network
    var body: some View {
        VStack {
            if network.isConnected {
                Text("🟢 Online")
                    .foregroundColor(.green)
            } else {
                Text("🔴 Offline")
                    .foregroundColor(.red)
            }
        }
        .padding()
    }
}

📦 Requirements
Platform	Minimum Version
macOS	15.6.1
Swift	6.2
Xcode	26.0.1 

🧰 Technologies Used
Swift 6.2
SwiftUI
Network.framework (NWPathMonitor)
