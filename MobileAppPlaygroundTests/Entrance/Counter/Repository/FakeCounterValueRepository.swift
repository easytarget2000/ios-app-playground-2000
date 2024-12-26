@testable import MobileAppPlayground

final actor FakeCounterValueRepository: CounterValueRepository {

    // MARK: - Properties

    // MARK: Return Values

    var fetchValueResult: Int

    // MARK: Spies

    var fetchValueCalled: Bool = false
    var setValueCalled: Bool = false
    var setValueValue: Int?
    
    // MARK: - Constructor

    init(fetchValueResult: Int) {
        self.fetchValueResult = fetchValueResult
    }

    // MARK: - Protocol Implementation

    func fetchValue() async throws -> Int {
        fetchValueCalled = true
        return fetchValueResult
    }

    func setValue(_ value: Int) async throws {
        fetchValueCalled = true
        setValueCalled = true
        setValueValue = value
    }

}
