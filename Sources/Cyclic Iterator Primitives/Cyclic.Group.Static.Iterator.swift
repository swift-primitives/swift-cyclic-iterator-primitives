public import Cardinal_Primitives
public import Cyclic_Group_Static_Element_Primitives
public import Cyclic_Group_Static_Primitives
public import Cyclic_Namespace_Primitives
public import Iterable
internal import Ordinal_Primitives

extension Cyclic.Group.Static {

    public struct Iterator: Iterator_Primitive.Iterator.`Protocol`, IteratorProtocol, Sendable {
        @usableFromInline
        var current: Ordinal

        @usableFromInline
        let bound: Cardinal

        @inlinable
        package init() {
            self.current = .zero

            self.bound = try! Cardinal(modulus)
        }
    }
}

extension Cyclic.Group.Static.Iterator {

    @inlinable
    public mutating func next() -> Cyclic.Group.Static<modulus>.Element? {
        guard current < bound else { return nil }

        let element = Cyclic.Group.Static<modulus>.Element(__unchecked: current)
        current += Cardinal.one
        return element
    }
}
