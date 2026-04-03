import Foundation

enum MemoryAllocator {

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
