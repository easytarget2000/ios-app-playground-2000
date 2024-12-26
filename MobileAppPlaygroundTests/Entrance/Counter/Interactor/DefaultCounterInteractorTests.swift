import Testing
@testable import MobileAppPlayground

@Suite struct DefaultCounterInteractorTests {

    // MARK: - `fetch()`

    @Test func fetch_returnsValueFromRepository() async throws {
        let expectation = 1

        let mockRepository: FakeCounterValueRepository = .init(fetchValueResult: expectation)
        let sut: DefaultCounterInteractor = .init(valueRepository: mockRepository)

        let result = try await sut.fetch()

        #expect(result == expectation)
    }

    // MARK: - `increment()`

    @Test func increment_returnsValueIncrementedByOne() async throws {
        let initialValue = 22

        let mockRepository: FakeCounterValueRepository = .init(fetchValueResult: initialValue)
        let sut: DefaultCounterInteractor = .init(valueRepository: mockRepository)

        let result = try await sut.increment()
        let expectation = initialValue + 1

        #expect(result == expectation)
    }

    @Test func increment_storesIncrementedValueInRepository() async throws {
        let initialValue = 333

        let fakeRepository: FakeCounterValueRepository = .init(fetchValueResult: initialValue)
        let sut: DefaultCounterInteractor = .init(valueRepository: fakeRepository)

        let _ = try await sut.increment()

        let result = await fakeRepository.setValueValue
        let expectation = initialValue + 1

        #expect(result == expectation)
    }

}
