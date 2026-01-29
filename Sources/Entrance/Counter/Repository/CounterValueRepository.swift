protocol CounterValueRepository {
    func fetchValue() async throws -> Int
    func setValue(_ value: Int) async throws
}
