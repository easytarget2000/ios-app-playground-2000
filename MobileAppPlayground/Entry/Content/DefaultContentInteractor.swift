final actor DefaultContentInteractor: ContentInteractor {
    
    // MARK: - Properties
    
    private let lifecycleLogger: Logger
    private var currentContent: Int = 0
    
    static let shared: DefaultContentInteractor = .init()
    
    // MARK: - Constructor/Deconstructor
    
    init(lifecycleLogger: any Logger = .lifecycle(subsystemSuffix: "Content")) {
        self.lifecycleLogger = lifecycleLogger
        self.lifecycleLogger.debug("DefaultContentInteractor initialized.")
    }
    
    deinit {
        self.lifecycleLogger.debug("DefaultContentInteractor deinitialized.")
    }
    
    // MARK: - Protocol Implementations
    
    func fetchContent() async throws -> Int {
        try await Task.sleep(for: .seconds(2))
        return self.currentContent
    }
    
    func addContent() async throws -> Int {
        let newContent = self.currentContent + 1
        defer { self.currentContent = newContent }
        
        try await Task.sleep(for: .seconds(2))
        return newContent
    }
}
