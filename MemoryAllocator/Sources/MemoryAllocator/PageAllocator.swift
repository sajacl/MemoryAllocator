import Foundation

extension Memory {
    struct Page: ~Copyable {
        let size: Int

        let pointer: UnsafeMutableRawPointer

        init?(size: Int) {
            let _pointer = try? requestMemory(of: size)

            guard let _pointer else {
                return nil
            }

            self.size = size
            pointer = _pointer
        }

        init(_ size: Int) throws {
            let _pointer = try requestMemory(of: size)

            self.size = size
            pointer = _pointer
        }

        consuming func free() throws {
            try freeMemory(pointer, size: size)
        }
    }
}
