@testable import MobileAppPlayground
import Testing

@Suite struct DefaultCounterInteractorTests {

    // MARK: - `fetchLocal()`

    @Test func fetchLocal_returnsZero() async throws {
        let expectation = 0

        let sut: DefaultCounterInteractor = .init(globalValueRepository: .mock())

        let result = try await sut.fetchLocal()

        #expect(result == expectation)
    }

    // MARK: - `fetchGlobal()`

    @Test func fetchGlobal_returnsValueFromRepository() async throws {
        let expectation = 1

        let mockRepository: FakeCounterValueRepository = .init(fetchValueResult: expectation)
        let sut: DefaultCounterInteractor = .init(globalValueRepository: mockRepository)

        let result = try await sut.fetchGlobal()

        #expect(result == expectation)
    }

    // MARK: - `incrementLocal()`

    @Test func incrementLocal_calledTwice_returnsLocalValueIncrementedByTwo() async throws {
        let initialValue = 22

        let sut: DefaultCounterInteractor = .init(globalValueRepository: .mock())

        _ = try await sut.incrementLocal()
        let result = try await sut.incrementLocal()
        let expectation = 2

        #expect(result == expectation)
    }

    // MARK: - `incrementGlobal()`

    @Test func incrementGlobal_storesIncrementedValueInRepository() async throws {
        let initialValue = 333

        let fakeRepository: FakeCounterValueRepository = .init(fetchValueResult: initialValue)
        let sut: DefaultCounterInteractor = .init(globalValueRepository: fakeRepository)

        _ = try await sut.incrementGlobal()

        let result = await fakeRepository.setValueValue
        let expectation = initialValue + 1

        #expect(result == expectation)
    }

}
