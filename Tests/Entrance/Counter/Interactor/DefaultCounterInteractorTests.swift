@testable import MobileAppPlayground
import Testing

@Suite struct DefaultCounterInteractorTests {

    // MARK: - `fetchLocal()`

    @Test func `first local fetching returns initial value`() async throws {
        let initialLocalValue = 99

        let sut: DefaultCounterInteractor = .init(
            initialLocalValue: initialLocalValue,
            globalValueRepository: FakeCounterValueRepository(),
            lifecycleLogger: .noOp,
            threadingLogger: .noOp,
        )

        let result = try await sut.fetchLocal()

        #expect(result == initialLocalValue)
    }

    // MARK: - `fetchGlobal()`

    @Test func `global fetching returns value from repository`() async throws {
        let expectation = 1

        let mockRepository: FakeCounterValueRepository
        = .init(fetchValueResult: expectation)
        let sut: DefaultCounterInteractor = .init(
            initialLocalValue: -1,
            globalValueRepository: mockRepository,
            lifecycleLogger: .noOp,
            threadingLogger: .noOp,
        )

        let result = try await sut.fetchGlobal()

        #expect(result == expectation)
    }

    // MARK: - `incrementLocal()`

    @Test func `locally incrementing 2x returns initial local value plus 2`()
    async throws {
        let initialLocalValue = 22

        let sut: DefaultCounterInteractor = .init(
            initialLocalValue: initialLocalValue,
            globalValueRepository: FakeCounterValueRepository(),
            lifecycleLogger: .noOp,
            threadingLogger: .noOp,
        )

        _ = try await sut.incrementLocal()
        let result = try await sut.incrementLocal()
        let expectation = 24

        #expect(result == expectation)
    }

    // MARK: - `incrementGlobal()`

    @Test func `globally incrementing stores new value in repository`()
    async throws {
        let initialValue = 333

        let fakeRepository: FakeCounterValueRepository
        = .init(fetchValueResult: initialValue)
        let sut: DefaultCounterInteractor = .init(
            initialLocalValue: -1,
            globalValueRepository: fakeRepository,
            lifecycleLogger: .noOp,
            threadingLogger: .noOp,
        )

        _ = try await sut.incrementGlobal()

        let result = fakeRepository.setValueValue
        let expectation = 334

        #expect(result == expectation)
    }

}
