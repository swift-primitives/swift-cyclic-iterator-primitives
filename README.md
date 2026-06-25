# Cyclic Iterator Primitives

![Development Status](https://img.shields.io/badge/status-active--development-blue.svg)

Iteration for finite cyclic groups — `Iterable` and `Swift.Sequence` conformance for `Cyclic.Group.Static`, walking its elements in order from position `0` to `modulus - 1`.

---

## Quick Start

`Cyclic.Group.Static<modulus>` is the finite cyclic group ℤ/`modulus`ℤ, its order fixed at compile time by the generic parameter. This package gives that type a way to enumerate itself: a `for-in` loop visits every element exactly once, in ascending position order, and the standard-library `Sequence` algorithms come along for free.

```swift
import Cyclic_Iterator_Primitives

// ℤ/12ℤ — the cyclic group behind a 12-hour clock face.
let clock = Cyclic.Group.Static<12>()

// `for-in` walks every element once, in order, from position 0 to 11.
for hour in clock {
    print(hour.position)   // 0, 1, 2, … 11
}

// The order is a compile-time-known Cardinal — no iteration required.
let order: Cardinal = Cyclic.Group.Static<12>.count   // 12
```

Because the conformance is to `Swift.Sequence`, every stdlib algorithm applies directly to a group value:

```swift
import Cyclic_Iterator_Primitives

// Collect the element positions of ℤ/5ℤ.
let positions: [Ordinal] = Cyclic.Group.Static<5>().map(\.position)   // [0, 1, 2, 3, 4]
```

Iteration is backed by `Cyclic.Group.Static.Iterator`, a scalar iterator that yields each `Element` from position `0` up to (but not including) `modulus`. It satisfies both the institute `Iterable` witness and `Swift.IteratorProtocol`, so the same group value serves span-based consumers and ordinary `for-in` loops without a second implementation.

---

## Installation

```swift
dependencies: [
    .package(url: "https://github.com/swift-primitives/swift-cyclic-iterator-primitives.git", branch: "main")
]
```

```swift
.target(
    name: "App",
    dependencies: [
        .product(name: "Cyclic Iterator Primitives", package: "swift-cyclic-iterator-primitives"),
    ]
)
```

Requires Swift 6.3.1 and macOS 26 / iOS 26 / tvOS 26 / watchOS 26 / visionOS 26 (or the matching Linux / Windows toolchain).

---

## Architecture

Two library products. The main target adds iteration to `Cyclic.Group.Static` and re-exports the cyclic-group, `Cardinal`, and `Ordinal` vocabulary it builds on.

| Product | Target | Purpose |
|---------|--------|---------|
| `Cyclic Iterator Primitives` | `Sources/Cyclic Iterator Primitives/` | `Iterable` + `Swift.Sequence` conformance for `Cyclic.Group.Static`, the `Cyclic.Group.Static.Iterator` scalar iterator, and the `count` / `underestimatedCount` group properties. |
| `Cyclic Iterator Primitives Test Support` | `Tests/Support/` | Re-exports the main target for test consumers. |

Foundation-free.

---

## Platform Support

| Platform | Status |
|----------|--------|
| macOS 26 | Full support |
| Linux | Full support |
| Windows | Full support |
| iOS / tvOS / watchOS / visionOS | Supported |

---

## Community

<!-- BEGIN: discussion -->
<!-- Discussion thread created at publication. -->
<!-- END: discussion -->

## License

Apache 2.0. See [LICENSE.md](LICENSE.md).
