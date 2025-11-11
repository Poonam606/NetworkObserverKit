// The Swift Programming Language
// https://docs.swift.org/swift-book
import SwiftUI
import Network

@MainActor
@Observable
public class NetWorkObserver {
    private var networkMonitor = NWPathMonitor()
    private var workerQueue = DispatchQueue(label: "NetworkObserver")
    public private(set) var isConnected = false
    init() {
        networkMonitor.pathUpdateHandler = { [weak self] path in
            DispatchQueue.main.async {
                self?.isConnected = path.status == .satisfied
          }
        }
        networkMonitor.start(queue: workerQueue)
    }
}

// ✅ Environment key definition
@MainActor
private struct NetworkObserverKey: @MainActor EnvironmentKey {
    static let defaultValue = NetWorkObserver()
}

@MainActor
public extension EnvironmentValues {
    var network: NetWorkObserver {
        get { self[NetworkObserverKey.self] }
        set { self[NetworkObserverKey.self] = newValue }
    }
}

// ✅ View extension
public extension View {
    func listenToNetwork() -> some View {
        environment(\.network, NetWorkObserver())
    }
}
