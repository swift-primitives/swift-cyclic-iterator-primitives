import Cyclic_Iterator_Primitives
import Testing

@Suite("Cyclic Iterator Tests")
struct CyclicIteratorTests {
    @Suite struct Unit {}
}

extension CyclicIteratorTests.Unit {
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
        var positions: [Ordinal] = []
        for element in Cyclic.Group.Static<5>() {
            positions.append(element.position)
        }
        #expect(positions == [0, 1, 2, 3, 4])
    }
}
