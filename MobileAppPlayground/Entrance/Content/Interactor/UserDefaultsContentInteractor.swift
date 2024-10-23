import Foundation

final actor UserDefaultsContentInteractor: ContentInteractor {
    
    // MARK: - Properties
    
    static let shared: UserDefaultsContentInteractor = .init()
    
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
        try await Task.sleep(for: .seconds(2))
        return 0
    }
    
    func addContent() async throws -> Int {
//        let newContent = self.currentContent + 1
//        defer { self.currentContent = newContent }
        
        try await Task.sleep(for: .seconds(2))
        return 0
    }
}
