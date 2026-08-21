public import Cardinal_Primitives
public import Cyclic_Group_Static_Primitives
public import Cyclic_Namespace_Primitives
public import Iterable
public import Iterator_Chunk_Primitives
public import Iterator_Primitive

extension Cyclic.Group.Static: @retroactive Iterable {

    @_implements(Iterable,Iterator)
    public typealias IterableIterator = Iterator_Primitive.Iterator.Materializing<Iterator>

    @inlinable
    @_lifetime(borrow self)
    @_implements(Iterable,makeIterator())
    public borrowing func iterableMakeIterator()
        -> Iterator_Primitive.Iterator.Materializing<Iterator>
    {
        Iterator_Primitive.Iterator.Materializing(Iterator())
    }

    @inlinable
    public func makeIterator() -> Iterator {
        Iterator()
    }
}

extension Cyclic.Group.Static: @retroactive Swift.Sequence {

    @inlinable
    public var underestimatedCount: Int { Self.modulus }
}

extension Cyclic.Group.Static {

    @inlinable
    public static var count: Cardinal {

        try! Cardinal(modulus)
    }
}
