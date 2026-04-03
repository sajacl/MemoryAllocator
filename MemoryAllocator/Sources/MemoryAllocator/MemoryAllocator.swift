import Foundation

enum MemoryAllocator {
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

    struct RequestMemoryFailure: LocalizedError {
        let error: Int32?

        init(error: Int32?) {
            self.error = error
        }

        var localizedDescription: String {
            return "Failed to allocate memory"
        }

        var failureReason: String? {
            nil
        }
    }
}
