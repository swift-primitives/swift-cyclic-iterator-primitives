import Cyclic_Iterator_Primitives
import Testing

// `Cyclic.Group.Static` is generic (`Cyclic.Group.Static<modulus>`), so the
// tests use the parallel namespace pattern per [SWIFT-TEST-003] rather than
// an extension on the source type.

@Suite
struct `Cyclic Iterator Tests` {
    @Suite struct Unit {}
    @Suite struct `Edge Case` {}
    @Suite struct Integration {}
}

extension `Cyclic Iterator Tests`.Unit {
    @Test
    func `count equals the modulus`() {
        let count: Cardinal = Cyclic.Group.Static<5>.count
        #expect(count == Cardinal(5))
    }

    @Test
    func `iterating runs exactly modulus times`() {
        var iterations = 0
        for _ in Cyclic.Group.Static<5>() {
            iterations += 1
        }
        #expect(iterations == 5)
    }

    @Test
    func `element positions are zero through four in order`() {
        let elements: [Cyclic.Group.Static<5>.Element] = Array(Cyclic.Group.Static<5>())
        let expected: [Cyclic.Group.Static<5>.Element] = (0..<5).map {
            Cyclic.Group.Static<5>.Element(wrapping: Ordinal(UInt($0)))
        }
        #expect(elements == expected)
    }
}
