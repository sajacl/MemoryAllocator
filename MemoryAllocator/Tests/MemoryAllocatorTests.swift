import Foundation
import Testing
@testable import MemoryAllocator

@Suite
struct MemoryAllocatorTests {
    @Test
    func pageAllocator_general() throws {
        let size = 8 // bytes

        let page = try Memory.Page(size)

        print(page.size)
        print(page.pointer)

        try page.free()
    }

    @Test
    func pageAllocator_multiplePages() throws {
        let size = 8 // bytes

        var pointers: [UnsafeMutableRawPointer] = []

        for i in 1...2 {
            let page1 = try Memory.Page(size)

            page1.pointer.storeBytes(of: i, as: Int.self)
            #expect(i == page1.pointer.load(as: Int.self))

            pointers.append(page1.pointer)
        }

        for pointer in pointers {
            if munmap(pointer, size) == -1 {
                throw Memory.FreeRequestMemoryFailure(error: errno)
            }
        }
    }
}
