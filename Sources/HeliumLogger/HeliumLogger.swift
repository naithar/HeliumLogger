/**
 * Copyright IBM Corporation 2015
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 **/

import Logger 

public enum TerminalColor: String {
    case White = "\u{001B}[0;37m" // white
    case Red = "\u{001B}[0;31m" // red
    case Yellow = "\u{001B}[0;33m" // yellow
}

public class HeliumLogger : Logger {
    
    /// 
    /// Singleton instance of the logger
    // static public var logger: Logger?
    
    public var colored: Bool = true
    
    public var details: Bool = true
    
    public init () {}
    
    public func log(type: LoggerMessageType, msg: String,
        functionName: String, lineNum: Int, fileName: String ) {
            
            var color : TerminalColor = .White
            
            if type == .Warning {
                color = .Yellow
            } else if type == .Error {
                color = .Red
            } else {
                color = .White
            }
            
            if colored && details {
                print ("\(color.rawValue) \(type.rawValue): \(functionName) \(fileName) line \(lineNum) - \(msg) \(TerminalColor.White.rawValue)")
            } else if !colored && details {
                print (" \(type.rawValue): \(functionName) \(fileName) line \(lineNum) - \(msg)")
            } else if colored && !details {
                print ("\(color.rawValue) \(type.rawValue): \(msg) \(TerminalColor.White.rawValue)")
            } else {
                print (" \(type.rawValue): \(msg)")
            }

            
    }
    
    
    
}