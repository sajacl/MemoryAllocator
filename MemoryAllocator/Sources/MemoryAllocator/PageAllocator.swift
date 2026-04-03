import Foundation

extension Memory {
    struct Page: ~Copyable {
        let size: Int

        let pointer: UnsafeMutableRawPointer

        init?(size: Int) {
            let _pointer = Memory.Allocator.requestMemory(of: size)

            guard let _pointer = try? _pointer.get() else {
                return nil
            }

            self.size = size
            pointer = _pointer
        }

        func free() {
            let result = munmap(pointer, size)

            print(result)
        }
    }
}
