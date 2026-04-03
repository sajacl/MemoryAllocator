import Foundation

extension Memory {
    struct FreeRequestMemoryFailure: LocalizedError {
        let error: Int32

        init(error: Int32) {
            self.error = error
        }

        var localizedDescription: String {
            return "Failed to free memory"
        }

        var failureReason: String? {
            if let cString = strerror(error) {
                return String(cString: cString)
            }

            return "Unknown error code: \(error)"
        }
    }
}
