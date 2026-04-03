import Foundation

extension Memory {
    enum Allocator {
        /// Method to request memory from OS, using `mmap`.
        /// Providing generic arguments for mmap syscall.
        /// - Parameter size: size of memory in bytes.
        static func requestMemory(of size: Int) -> Result<UnsafeMutableRawPointer, Error> {
            let pointer = mmap(
                nil,
                size,
                PROT_READ | PROT_WRITE,
                MAP_PRIVATE | MAP_ANON,
                -1,
                0
            )

            if pointer == MAP_FAILED {
                return .failure(RequestMemoryFailure(error: errno))
            }

            guard let pointer else {
                return .failure(RequestMemoryFailure(error: nil))
            }

            return .success(pointer)
        }
    }
}
