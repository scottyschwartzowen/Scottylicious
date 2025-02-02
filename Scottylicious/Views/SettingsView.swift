//
//  SettingsView.swift
//  Scottylicious
//
//  Created by Scotty Schwartz-Owen on 7/24/24.
//

import SwiftUI

struct SettingsView: View {

	@AppStorage("hideOptionalSteps") private var hideOptionalSteps: Bool = false
	@AppStorage("listBackgroundColor") private var listBackgroundColor = AppColor.background
	@AppStorage("listTextColor") private var listTextColor = AppColor.foreground

	var body: some View {
		NavigationStack {
			Form {
				ColorPicker("List BackgroundColor", selection: $listBackgroundColor)
					.padding()
					.listRowBackground(listBackgroundColor)
				ColorPicker("Text Color", selection: $listTextColor)
					.padding()
					.listRowBackground(listBackgroundColor)
				Toggle("Hide Optional Steps", isOn: $hideOptionalSteps)
					.padding()
					.listRowBackground(listBackgroundColor)
			}
			.foregroundStyle(listTextColor)
			.navigationTitle("Settings")
		}
	}
}

#Preview {
    SettingsView()
}
