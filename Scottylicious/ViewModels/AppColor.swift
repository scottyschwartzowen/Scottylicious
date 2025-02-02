//
//  AppColor.swift
//  Scottylicious
//
//  Created by Scotty Schwartz-Owen on 3/24/24.
//

import Foundation

import SwiftUI

struct AppColor {
	static let background: Color = Color(.sRGB,
																			 red: 99/255,
																			 green: 183/255,
																			 blue: 195/255,
																			 opacity: 0.1)
	static let foreground: Color = Color(.sRGB,
																			 red: 75/255,
																			 green: 0/255,
																			 blue: 150/255,
																			 opacity: 1)
}

extension Color: @retroactive RawRepresentable {
	public init?(rawValue: String) {
		do {
			let encodedData = rawValue.data(using: .utf8)!
			let components = try JSONDecoder().decode([Double].self, from: encodedData)
			self = Color(red: components[0],
									 green: components[1],
									 blue: components[2],
									 opacity: components[3])
		}
		catch {
			return nil
		}
	}

	public var rawValue: String {
		guard let cgFloatComponents = UIColor(self).cgColor.components else { return "" }
		let doubleComponents = cgFloatComponents.map { Double($0) }
		do {
			let encodedComponents = try JSONEncoder().encode(doubleComponents)
			return String(data: encodedComponents, encoding: .utf8) ?? ""
		}
		catch {
			return ""
		}
	}
}
