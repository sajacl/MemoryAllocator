import Foundation

struct PageAllocator: ~Copyable {
    let size: Int

    let pointer: UnsafeMutableRawPointer

    init?(size: Int) {
        let _pointer = MemoryAllocator.requestMemory(of: size)

        guard let _pointer = try? _pointer.get() else {
            return nil
        }

        self.size = size
        pointer = _pointer
    }

    deinit {
        let result = munmap(pointer, size)
    }
}
