import Testing
@testable import MemoryAllocator

@Suite
struct MemoryAllocatorTests {
    @Test
    func pageAllocator_general() throws {
        let size = 10 // bytes

        let page = try Memory.Page(size)

        print(page.size)
        print(page.pointer)

        page.free()
    }
}
