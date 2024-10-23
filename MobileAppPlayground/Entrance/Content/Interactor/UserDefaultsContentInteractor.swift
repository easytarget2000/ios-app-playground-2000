import Foundation

final actor UserDefaultsContentInteractor: ContentInteractor {
    
    // MARK: - Properties
    
    static let shared: UserDefaultsContentInteractor = .init()
    
    var simulateSlowResponse = false
    
    private let userDefaults: UserDefaults
    private let lifecycleLogger: Logger
    
    // MARK: - Constructor/Deconstructor
    
    init(
        userDefaults: UserDefaults = .standard,
        lifecycleLogger: any Logger = .lifecycle(subsystemSuffix: "Content")
    ) {
        self.userDefaults = userDefaults
        self.lifecycleLogger = lifecycleLogger
        
        self.lifecycleLogger.debug("DefaultContentInteractor initialized.")
    }
    
    deinit {
        self.lifecycleLogger.debug("DefaultContentInteractor deinitialized.")
    }
    
    // MARK: - Protocol Implementations
    
    func fetchContent() async throws -> Int {
        if self.simulateSlowResponse {
            try await Task.sleep(for: .seconds(0.5))
        }
        return self.userDefaults.integer(forKey: UserDefaultsKey.content)
    }
    
    func addContent() async throws -> Int {
        let newContent = try await self.fetchContent() + 1
        defer { self.userDefaults.set(newContent, forKey: UserDefaultsKey.content) }
        
        if self.simulateSlowResponse {
            try await Task.sleep(for: .seconds(1))
        }
        
        return newContent
    }
}
