import Foundation

extension Memory {
    struct RequestMemoryFailure: LocalizedError {
        let error: Int32?

        init(error: Int32?) {
            self.error = error
        }

        var localizedDescription: String {
            return "Failed to allocate memory"
        }

        var failureReason: String? {
            guard let error else {
                return nil
            }

            if let cString = strerror(error) {
                return String(cString: cString)
            }

            return "Unknown error code: \(error)"
        }
    }
}
