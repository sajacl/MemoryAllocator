import Foundation

/// A wrapper that indicate calls passes through a syscall.
extension Memory {
    /// Method to request memory from OS, using `mmap`.
    /// Providing generic arguments for mmap syscall.
    /// - Parameter size: size of memory in bytes.
    @inlinable
    static func requestMemory(of size: Int) throws -> UnsafeMutableRawPointer {
        let pointer = mmap(
            nil,
            size,
            PROT_READ | PROT_WRITE,
            MAP_PRIVATE | MAP_ANON,
            -1,
            0
        )

        if pointer == MAP_FAILED {
            throw RequestMemoryFailure(error: errno)
        }

        guard let pointer else {
            throw RequestMemoryFailure(error: nil)
        }

        return pointer
    }

    @inlinable
    static func freeMemory(_ pointer: UnsafeMutableRawPointer, size: Int) throws {
        let result = munmap(pointer, size)

        if result == -1 {
            throw FreeRequestMemoryFailure(error: errno)
        }
    }
}
