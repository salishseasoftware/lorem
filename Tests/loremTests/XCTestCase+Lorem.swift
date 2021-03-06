import XCTest
import LibStringy
import class Foundation.Bundle

public extension XCTestCase {

    override func setUpWithError() throws {
        // Some of the APIs that we use below are available in macOS 10.13 and above.
        guard #available(macOS 10.13, *) else {
            return
        }
    }

    func runProcess(args: String...) -> Result<String, Error> {
        let bin = productsDirectory.appendingPathComponent("lorem")
        let process = Process()
        process.executableURL = bin
        process.arguments = args

        let stdout = Pipe()
        process.standardOutput = stdout

        let stderr = Pipe()
        process.standardError = stderr

        do {
            try process.run()
            process.waitUntilExit()

            let data = stdout.fileHandleForReading.readDataToEndOfFile()

            let errData = stderr.fileHandleForReading.readDataToEndOfFile()

            if let errMssg = String(data: errData, encoding: .utf8)?.trimmingCharacters(in: .whitespacesAndNewlines) {
                guard errMssg.isEmpty else { throw(errMssg) }
            }

            guard let output = String(data: data, encoding: .utf8)?.trimmingCharacters(in: .whitespacesAndNewlines) else {
                throw("Output is nil")
            }

            return .success(output)

        } catch {
            return .failure(error)
        }
    }

    /// Returns path to the built products directory.
    var productsDirectory: URL {
      #if os(macOS)
        for bundle in Bundle.allBundles where bundle.bundlePath.hasSuffix(".xctest") {
            return bundle.bundleURL.deletingLastPathComponent()
        }
        fatalError("couldn't find the products directory")
      #else
        return Bundle.main.bundleURL
      #endif
    }


}
