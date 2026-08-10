import Observation

protocol NestingViewModel3 {

    var value: Int { get }

    func increaseValue()

}

extension NestingViewModel3 where Self == DefaultNestingViewModel3 {

    static func `default`() -> Self {
        Self.init()
    }

}

@Observable
final class DefaultNestingViewModel3: NestingViewModel3 {

    private(set) var value: Int = 0

    func increaseValue() {
        value += 1
    }
}
